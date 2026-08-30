import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/post_data_model.dart';
import 'package:flutter_app/repository/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepo = Get.put(PostRepository());

  final posts = <Data>[].obs;
  // final isLoading = false.obs;
  final isLoadingMore = false.obs;
  final errorMessage = ''.obs;
  final searchTerm = ''.obs;

  final int size = 10;

  int _page = 0;
  int _totalPages = 10;
  int _total = 0;
  int get total => _total;

  bool isLoading = false;
  bool get hasMore => _page + 1 < _totalPages;

  Timer? _searchTimer;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadFirstPage();
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      loadMore();
    }
  }

  void searchPost(String value){
    searchTerm.value = value.trim();
    _searchTimer?.cancel();
    _searchTimer = Timer(
        const Duration(microseconds: 500),
            () {
          loadFirstPage(showfullScreenloading: false);
        });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _searchTimer?.cancel();
    scrollController.dispose();
    super.onClose();
  }

  // First Page
  Future<void> loadFirstPage({bool showfullScreenloading = true}) async {
    if (showfullScreenloading){
      isLoading = true;
    }
    if (isLoading || !hasMore)
    errorMessage.value = '';

    try {
      final (PostDataModel? page, String? error) =
      await _postRepo.getPageTest(
        page: 0,
        size: size,
        title: searchTerm.value.trim(),
      );

      if (error != null) {
        errorMessage.value = error;
        posts.clear();
        return;
      }

      if (page == null) {
        errorMessage.value = 'No data';
        posts.clear();
        return;
      }

      // Replace old posts
      posts.assignAll(page.data ?? []);

      // Update pagination
      _applyMeta(page);
    } finally {
      if(showfullScreenloading){
        isLoading = false;
      }
    }
  }

  // Load More
  Future<void> loadMore() async {
    if (isLoadingMore.value || !hasMore) return;

    isLoadingMore.value = true;

    try {
      final nextPage = _page + 1;

      final (PostDataModel? page, String? error) =
      await _postRepo.getPageTest(
        page: nextPage,
        size: size,
        title: searchTerm.value.trim(),
      );

      if (error != null) {
        errorMessage.value = error;
        return;
      }

      if (page == null) {
        errorMessage.value = 'No data';
        return;
      }

      // Add new posts to existing posts
      posts.addAll(page.data ?? []);

      // Update pagination metadata
      _applyMeta(page);
    } finally {
      isLoadingMore.value = false;
    }
  }

  // Pagination Metadata
  void _applyMeta(PostDataModel page) {
    final Pagination? pagination = page.pagination;

    if (pagination == null) {
      _total = 0;
      _totalPages = 1;
      return;
    }

    _page = pagination.page ?? 0;
    _totalPages = pagination.totalPages ?? 1;
    _total = pagination.total ?? 0;

    print(
      'Pagination: '
          'page=$_page, '
          'totalPages=$_totalPages, '
          'total=$_total',
    );
  }

  // Refresh
  Future<void> refreshPosts() async {
    _page = 0;
    _totalPages = 1;
    _total = 0;
    await loadFirstPage(
        showfullScreenloading: false
    );
  }
}
