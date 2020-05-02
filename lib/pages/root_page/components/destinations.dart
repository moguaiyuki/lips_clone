enum Destination { home, ranking, clip, notification }

extension DestinationExtension on Destination {
  String get title {
    switch (this) {
      case Destination.home:
        return 'Home';
      case Destination.ranking:
        return 'Ranking';
      case Destination.clip:
        return 'Clip';
      case Destination.notification:
        return 'Notification';
    }
    return '';
  }
}
