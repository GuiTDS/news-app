enum NewsCategory { all, sports, health, politics, food, house, travel }

class NewsModel {
  final String newsTitle;
  final String newsImageURL;
  final String authorName;
  final String? authorImageURL;
  final NewsCategory newsCategory;

  const NewsModel(
      {required this.newsTitle,
      required this.newsCategory,
      required this.newsImageURL,
      required this.authorName,
      this.authorImageURL});
}
