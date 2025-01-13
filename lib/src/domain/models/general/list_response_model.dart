class ListResponseModel {
  static getPureListData(jsonResponse) {
    List<String> keys = jsonResponse.keys.toList();
    for (int i = 0; i < keys.length; i++) {
      if (keys[i] != 'totalPages' && keys[i] != 'currentPage') {
        return jsonResponse[keys[i]];
      }
    }
    return jsonResponse;
  }
}
