abstract class INavigationService {
  Future<void> navigateToPage({required path, Object? object});
  Future<void> navigateToPageRemoved({required path, Object? object});
}
