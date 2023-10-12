import 'package:contact_app/repositories/repositories.dart';
import 'package:contact_app/styles/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/utils/utils.dart';
import 'package:contact_app/components/components.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddContactForm extends StatefulWidget {
  const AddContactForm({
    super.key,
    required this.actionDone,
  });

  final void Function() actionDone;

  @override
  State<AddContactForm> createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  ContactRepository contactRepository = ContactRepository();

  String pathImg = 'Escolha a imagem';

  TextEditingController nameInputController = TextEditingController();

  final MaskTextInputFormatter cellphoneMask = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  final MaskTextInputFormatter landlineMask = MaskTextInputFormatter(
    mask: '(##) ####-####',
    filter: {'#': RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  bool isLandline = false;

  String? nameError;
  String? phoneError;

  void toggleIsLandline() {
    setState(() {
      landlineMask.clear();
      cellphoneMask.clear();
      isLandline = !isLandline;
    });
  }

  void onMessageAction(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );

  Future<void> getImage(ImageSource source) async {
    Navigator.pop(context);

    CroppedFile? file = await pickImage(source);

    if (file != null) {
      setState(() {
        pathImg = file.path;
      });
    }
  }

  Future<void> handleSubmit() async {
    if (pathImg == 'Escolha a imagem') {
      onMessageAction('Escolha uma imagem');
      return;
    }

    if (nameInputController.text.isEmpty) {
      nameError = 'Campo obrigatório';
    }
    if (isLandline && !landlineMask.isFill()) {
      phoneError = 'Campo obrigatório';
    }
    if (!isLandline && !cellphoneMask.isFill()) {
      phoneError = 'Campo obrigatório';
    }

    if (nameInputController.text.isEmpty ||
        (isLandline && !landlineMask.isFill()) ||
        (!isLandline && !cellphoneMask.isFill())) {
      setState(() {});
      return;
    }

    await contactRepository
        .createContact(
            name: nameInputController.text,
            number: isLandline
                ? landlineMask.getMaskedText()
                : cellphoneMask.getMaskedText(),
            imagePath: pathImg)
        .then((_) {
      setState(() {
        nameInputController.clear();
        pathImg = 'Escolha a imagem';
        cellphoneMask.clear();
        landlineMask.clear();
        widget.actionDone();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 40,
                  child: TXTButton(
                    textSize: 18,
                    text: pathImg.split('/').last,
                    action: () => showModalBottomSheet(
                        context: context,
                        builder: (context) => Wrap(
                              children: [
                                ListTile(
                                  onTap: () => getImage(ImageSource.gallery),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.image,
                                    size: 25,
                                    color: black,
                                  ),
                                  title: Text(
                                    'Galeria',
                                    style: primaryTextStyle(
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                separator(height: 16),
                                ListTile(
                                  onTap: () => getImage(ImageSource.camera),
                                  leading: const FaIcon(
                                    FontAwesomeIcons.cameraRetro,
                                    size: 25,
                                    color: black,
                                  ),
                                  title: Text(
                                    'Camera',
                                    style: primaryTextStyle(
                                      size: 18,
                                      weight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                  ),
                ),
              ),
            ],
          ),
          separator(height: 16),
          TextInput(
            borderRadius: 8,
            error: nameError,
            controller: nameInputController,
            placeholder: 'Digite um nome para o contato',
            icon: Icons.person,
            label: 'Nome',
            isRequired: true,
          ),
          separator(height: 16),
          TextInput(
            borderRadius: 8,
            error: phoneError,
            masks: [isLandline ? landlineMask : cellphoneMask],
            placeholder: 'Digite um número para contato',
            icon: isLandline ? Icons.phone : Icons.phone_android,
            label: 'Telefone',
            isRequired: true,
          ),
          Row(
            children: [
              Checkbox(
                value: isLandline,
                onChanged: (_) => toggleIsLandline(),
                checkColor: white,
                activeColor: primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3)),
              ),
              Text(
                'Fixo',
                style:
                    primaryTextStyle(weight: FontWeight.bold, color: primary),
              )
            ],
          ),
          separator(height: 16),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 55,
                  child: TXTButton(
                    textSize: 18,
                    text: 'Adicionar',
                    action: handleSubmit,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
