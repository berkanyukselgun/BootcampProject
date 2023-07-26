class ImageConstants {
  ImageConstants._();
  static late final ImageConstants instance = ImageConstants._();

  static final String AUTH_IMAGE = 'auth_image'.toPngFromImageAsset();
  static final String GOOGLE = 'google'.toPngFromIconAsset();
  static final String TWITTER = 'twitter'.toPngFromIconAsset();
  static final String FACEBOOK = 'facebook'.toPngFromIconAsset();
  static final String LOGO_WITH_NAME = 'logo_with_name'.toPngFromIconAsset();
  static final String BACK = 'back'.toPngFromIconAsset();
  static final String NEXT = 'next'.toPngFromIconAsset();
  static final String NOTIFICATION = 'notification'.toPngFromIconAsset();
  static final String DIVIDER = 'divider'.toPngFromImageAsset();
  static final String LOCATION = 'location'.toPngFromIconAsset();
  static final String MAP = 'map'.toPngFromIconAsset();
  static final String TICKET = 'ticket'.toPngFromIconAsset();
  static final String HOME = 'home'.toPngFromIconAsset();
  static final String CAMP = 'camp'.toPngFromIconAsset();
  static final String COMPETITION = 'competition'.toPngFromIconAsset();
  static final String CONCERT = 'concert'.toPngFromIconAsset();
  static final String CONFERENCE = 'conference'.toPngFromIconAsset();
  static final String EXHIBITION = 'exhibition'.toPngFromIconAsset();
  static final String FAIR = 'fair'.toPngFromIconAsset();
  static final String FESTIVAL = 'festival'.toPngFromIconAsset();
  static final String SIGNING_DAY = 'signing_day'.toPngFromIconAsset();
  static final String THEATRE = 'theatre'.toPngFromIconAsset();
  static final String TRIP = 'trip'.toPngFromIconAsset();
  static final String WORKSHOP = 'workshop'.toPngFromIconAsset();
  static final String MESSAGES = 'messages'.toPngFromIconAsset();
  static final String PROFILE = 'profile'.toPngFromIconAsset();
  static final String SPLASH_IMAGE = 'splash_image'.toPngFromImageAsset();
  static final String ONBOARD1 = 'o1'.toPngFromImageAsset();
  static final String ONBOARD2 = 'o2'.toPngFromImageAsset();
  static final String ONBOARD3 = 'o3'.toPngFromImageAsset();
  static final String ENTRY_MAP = 'entry_map'.toPngFromImageAsset();
  static final String ENTRY_TICKET = 'entry_ticket'.toPngFromImageAsset();
  static final String TRASH = 'trash'.toPngFromIconAsset();
  static final String GALLERY = 'gallery'.toPngFromIconAsset();
  static final String CAMERA = 'camera'.toPngFromIconAsset();
  static final String DONE = 'done'.toPngFromIconAsset();
  static final String COMMUNITY = 'community'.toPngFromIconAsset();
  static final String WHITE_FAV = 'white_fav'.toPngFromIconAsset();
  static final String BACK_WITH_SHADOW = 'back_with_shadow'.toPngFromIconAsset();
  static final String LOGO = 'logo'.toPngFromIconAsset();
}

extension ImageExtensions on String {
  String toPngFromIconAsset() => 'assets/icons/$this.png';
  String toPngFromImageAsset() => 'assets/images/$this.png';
}
