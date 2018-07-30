class CategoryFilter {
  final String searchTerm;
  final SortBy sort;
  CategoryFilter(this.searchTerm, this.sort);
}

enum SortBy { LowestPrice, HighPrice, AZ, ZA }
