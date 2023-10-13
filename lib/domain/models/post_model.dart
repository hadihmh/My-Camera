class PostModel {
  final String id;
  final String description;
  final String name;
  final int age;
  final List<String> interest;
  final String likes;
  final String distance;
  final List<String> images;

  PostModel(this.id, this.description, this.name, this.age, this.interest,
      this.distance, this.likes, this.images);

  static createDummyModel() {
    return PostModel(
        "1",
        "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
        "잭과분홍콩나물",
        25,
        [
          "💖 진지한 연애를 찾는 중",
          "🍸 전혀 안 함",
          "🚬 비흡연",
          "💪🏻 매일 1시간 이상",
          "🤝 만나는 걸 좋아함",
          "INFP"
        ],
        "서울.2km 거리에 있음",
        "29.930",
        [
          "assets/images/person1.png",
          "assets/images/person2.png",
          "assets/images/person3.png"
        ]);
  }
}
