part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  final AuthorizationStatus status;
  // TODO: Create the model for the notification.
  final List<dynamic> notifications;
  const NotificationsState(
      {this.status = AuthorizationStatus.notDetermined,
      this.notifications = const []});

  NotificationsState copyWith(
          {AuthorizationStatus? status, List<dynamic>? notifications}) =>
      NotificationsState(
          status: status ?? this.status,
          notifications: notifications ?? this.notifications);

  @override
  List<Object> get props => [status, notifications];
}
