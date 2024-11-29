import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:teslo_app/features/auth/presentation/providers/auth_provider.dart';

final goRouterNotifierProvider = Provider((ref) {
  final authNotifier = ref.read(authProvider.notifier);
  return GoRouterNotifier(authNotifier);
});

class GoRouterNotifier extends ChangeNotifier {
  final AuthNotifier _authNotifier;
  AuthStatus _authStatus = AuthStatus.checking;
  late final void Function(AuthState) _listener;

  AuthStatus get authStatus => _authStatus;
  set authStatus(AuthStatus status) {
    _authStatus = status;
    notifyListeners();
  }

  GoRouterNotifier(this._authNotifier) {
    _listener = (state) {
      authStatus = state.authStatus;
    };
    _authNotifier.addListener(_listener);
  }

  @override
  void dispose() {
    _authNotifier.dispose();
    super.dispose();
  }
}
