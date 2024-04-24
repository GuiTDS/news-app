class NewsModel {
  final String newsTitle;
  final String newsImageURL;
  final String authorName;
  final String? authorImageURL;

  const NewsModel(
      {required this.newsTitle,
      required this.newsImageURL,
      required this.authorName,
      this.authorImageURL});
}
