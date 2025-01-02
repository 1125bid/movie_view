# 🎬 영화정보 앱

Flutter 기반으로 제작된 **TMDV API 연동 영화정보 앱**입니다. 사용자는 **영화정보를 확인** 할 수 있습니다.

---

## 🚀 주요 기능

1. **영화 list**

   - 현재상영작, 인기영화목록, 개봉예정, 평점높은 영화

2. **영화 상세정보**

   - 영화포스터, 제목 및 원제, 개봉일, 장르, 줄거리, 평점 및 인기도, 예산 및 수익정보, 제작사정보 확인가능합니다.

---

## 🛠️ 기술 스택

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Riverpod
- **Data Handling**: TMDB API
- **Clean Architecture**

---

## 📂 **프로젝트 구조**

```
📦lib
 ┣ 📂data
 ┃ ┣ 📂data_source
 ┃ ┃ ┣ 📜movie_data_source.dart
 ┃ ┃ ┗ 📜movie_data_source_impl.dart
 ┃ ┣ 📂dto
 ┃ ┃ ┣ 📜movie_detail_dto.dart
 ┃ ┃ ┗ 📜movie_response_dto.dart
 ┃ ┗ 📂repository
 ┃ ┃ ┗ 📜movie_repository_impl.dart
 ┣ 📂domain
 ┃ ┣ 📂entity
 ┃ ┃ ┣ 📜movie.dart
 ┃ ┃ ┗ 📜movie_detail.dart
 ┃ ┣ 📂repository
 ┃ ┃ ┗ 📜movie_repository.dart
 ┃ ┗ 📂usecase
 ┃ ┃ ┣ 📜fetch_movie_detail_usecase.dart
 ┃ ┃ ┣ 📜fetch_now_playing_movies_usecase.dart
 ┃ ┃ ┣ 📜fetch_popular_movies_usecase.dart
 ┃ ┃ ┣ 📜fetch_top_rated_movies_usecase.dart
 ┃ ┃ ┗ 📜fetch_upcoming_movies_usecase.dart
 ┣ 📂presentation
 ┃ ┣ 📂pages
 ┃ ┃ ┣ 📜detail_page.dart
 ┃ ┃ ┣ 📜detail_page_view_model.dart
 ┃ ┃ ┣ 📜home_page.dart
 ┃ ┃ ┗ 📜home_page_view_model.dart
 ┃ ┣ 📂widgets
 ┃ ┗ 📜providers.dart
 ┗ 📜main.dart
```

---
