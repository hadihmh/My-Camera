enum Routes {
  posts,
  users,
}

extension StaticRoutes on Routes {
  static const _url = {
    Routes.posts: "",
    Routes.users: "",
  };

  String get url => _url[this] ?? "";
}
