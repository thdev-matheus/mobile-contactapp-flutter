import 'package:contact_app/styles/global_styles.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

Future<CroppedFile?> pickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  XFile? image = await picker.pickImage(
    source: source,
  );
  CroppedFile? croppedFile;

  if (image == null) {
    return null;
  }

  croppedFile = await ImageCropper().cropImage(
    sourcePath: image.path,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
    ],
    aspectRatio: const CropAspectRatio(ratioX: 5, ratioY: 5),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Cortar imagem',
        toolbarColor: primary,
        toolbarWidgetColor: white,
        initAspectRatio: CropAspectRatioPreset.square,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        aspectRatioLockEnabled: true,
        title: 'Cortar imagem',
      ),
    ],
  );

  if (croppedFile != null) {
    await GallerySaver.saveImage(
      croppedFile.path,
      toDcim: true,
    );
  }

  return croppedFile;
}
