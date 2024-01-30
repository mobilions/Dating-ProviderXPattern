class Constants {
  Constants._();

  static String mapUrl(lat, lng, label, scale) =>
      "https://maps.googleapis.com/maps/api/staticmap?markers=icon:https://www.famooshed.com/pin2.png%7Clabel:$label%7C%7C$lat,$lng&zoom=16&size=400x225&key=AIzaSyBlPrKDHq4CtetPgQivrBqsH87JkvLGtQw&scale=$scale";

  static const String kGoogleMap = 'AIzaSyBlPrKDHq4CtetPgQivrBqsH87JkvLGtQw';

  static const accessToken = 'accessToken';
  static const userId = 'userId';
  static const userName = 'userName';
  static const email = 'email';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const mobile = 'mobile';
  static const language = 'language';
}
