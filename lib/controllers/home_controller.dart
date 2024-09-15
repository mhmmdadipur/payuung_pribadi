part of 'controllers.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();

  final DatabaseController _databaseController = Get.find();

  Rx<List?> listExploreWellness = Rx<List?>(null);

  Future<bool> getListExploreWellness() async {
    try {
      /// Declare variable
      bool result = false;
      const String url =
          'https://bbde96af4096463d81ea54e3d613bbb8.api.mockbin.io/';

      var response = await _apiService.getData(url: url);

      dynamic decoded = jsonDecode(response.body);

      if (decoded?['isError'] == false) {
        listExploreWellness(decoded['data']);
        result = true;
      } else {
        if (listExploreWellness.isRxNull) listExploreWellness([]);
        SharedWidget.renderDefaultSnackBar(
            message: '${decoded['message']}', isError: true);
        result = false;
      }

      /// Write log
      await _databaseController.createLog(
          isDone: true,
          title: 'getListExploreWellness',
          url: url,
          method: 'GET',
          header: response.headers,
          body: {},
          response: decoded);

      return result;
    } on FormatException catch (e) {
      if (listExploreWellness.isRxNull) listExploreWellness([]);
      SharedWidget.renderDefaultSnackBar(
          title: 'Sorry Format Exception', message: e.message, isError: true);
      return false;
    } on ClientException catch (e) {
      if (listExploreWellness.isRxNull) listExploreWellness([]);
      SharedWidget.renderDefaultSnackBar(
          title: 'Sorry Client Exception', message: e.message, isError: true);
      return false;
    } on TimeoutException catch (e) {
      if (listExploreWellness.isRxNull) listExploreWellness([]);
      SharedWidget.renderDefaultSnackBar(
          title: 'Sorry Timeout Exception',
          message:
              'Request time has expired, please check your internet again and try again. (Max. ${e.duration?.inSeconds} seconds)',
          isError: true);
      return false;
    } catch (e) {
      if (listExploreWellness.isRxNull) listExploreWellness([]);
      SharedWidget.renderDefaultSnackBar(
          title: 'Sorry', message: '$e', isError: true);
      return false;
    }
  }
}
