import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

/// haber listesinin çekildiği sınıf
@JsonSerializable()
class NewsModel {
  /// haberlerin çekildiği sınıfın yapıcı metodu
  const NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  /// jsondan nesneye dönüştürme
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  /// durum
  final String? status;

  /// toplam sonuç
  final num? totalResults;

  /// haberler
  final List<Articles>? articles;

  /// nesneden jsona dönüştürme
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

/// haberlerin çekildiği sınıf
@JsonSerializable()
class Articles {
  /// haberlerin çekildiği sınıfın yapıcı metodu
  const Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  /// jsondan nesneye dönüştürme
  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  /// kaynak
  final Source? source;

  /// yazar
  final String? author;

  /// başlık
  final String? title;

  /// açıklama
  final String? description;

  /// url
  final String? url;

  /// resim url
  final String? urlToImage;

  /// yayınlanma tarihi
  final String? publishedAt;

  /// içerik
  final String? content;

  /// nesneden jsona dönüştürme
  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}

/// kaynak sınıf
@JsonSerializable()
final class Source {
  /// kaynak sınıfın yapıcı metodu
  const Source({
    this.id,
    this.name,
  });

  /// jsondan nesneye dönüştürme
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  /// id
  final dynamic id;

  /// isim
  final String? name;

  /// nesneden jsona dönüştürme
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
