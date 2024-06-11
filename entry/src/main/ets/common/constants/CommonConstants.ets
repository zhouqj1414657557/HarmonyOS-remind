/**
 * Common Constants for all features.
 */
 export default class CommonConstants {
  /**
   * database preference id.
   */
  static readonly PREFERENCE_ID = 'storageId';
  /**
   * default total minute.
   */
  static readonly DEFAULT_TOTAL_MINUTE: number = 60;
  /**
   * bundle name.
   */
  static readonly BUNDLE_NAME: string = 'com.example.wuyandeduihua2';
  /**
   * ability name.
   */
  static readonly ABILITY_NAME: string = 'EntryAbility';
  /**
   * default number negative.
   */
  static readonly DEFAULT_NUMBER_NEGATIVE: number = -1;
  /**
   * database alarm data key.
   */
  static readonly ALARM_KEY = 'alarmData';
  /**
   * default total hour.
   */
  static readonly DEFAULT_TOTAL_HOUR: number = 12;
  /**
   * default single.
   */
  static readonly DEFAULT_SINGLE: number = 1;
  /**
   * The number of columns for SM device.
   */
  static readonly GRID_ROW_SM: number = 4;

  /**
   * The number of columns for MD device.
   */
  static readonly GRID_ROW_MD: number = 8;

  /**
   * The number of columns for LG device.
   */
  static readonly GRID_ROW_LG: number = 12;

  /**
   * The gutter of x direction device.
   */
  static readonly GUTTER_X: number = vp2px(12);

  /**
   * The span of page for SM device.
   */
  static readonly SPAN_SM: number = 4;

  /**
   * The span of page for MD device.
   */
  static readonly SPAN_MD: number = 6;

  /**
   * The span of page for MD device.
   */
  static readonly SPAN_LG: number = 8;

  /**
   * The span of privacy statement for SM device.
   */
  static readonly PRIVACY_SPAN_SM: number = 2;

  /**
   * The span of privacy statement for MD device.
   */
  static readonly PRIVACY_SPAN_MD: number = 4;

  /**
   * The span of privacy statement for LG device.
   */
  static readonly PRIVACY_SPAN_LG: number = 4;

  /**
   * The span of mine page for SM device.
   */
  static readonly MINE_SPAN_SM: number = 4;

  /**
   * The span of mine page for MD device.
   */
  static readonly MINE_SPAN_MD: number = 8;

  /**
   * The span of mine for LG device.
   */
  static readonly MINE_SPAN_LG: number = 8;

  /**
   * The span of login component button for SM device.
   */
  static readonly BUTTON_SPAN_SM: number = 4;

  /**
   * The span of login component button for MD device if break point is smaller than 360vp.
   */
  static readonly BUTTON_SPAN_MD_SMALL: number = 3;

  /**
   * The span of login component button for MD device if break point is not smaller than 360vp.
   */
  static readonly BUTTON_SPAN_MD_BIG: number = 6;

  /**
   * The span of login component button for LG device.
   */
  static readonly BUTTON_SPAN_LG: number = 8;

  /**
   * The offset for SM device.
   */
  static readonly OFFSET_SM: number = 1;

  /**
   * The offset for MD device.
   */
  static readonly OFFSET_MD: number = 1;

  /**
   * The offset for LG device.
   */
  static readonly OFFSET_LG: number = 2;

  /**
   * The offset of privacy statement component for SM device.
   */
  static readonly PRIVACY_OFFSET_SM: number = 1;

  /**
   * The offset of privacy statement component for MD device.
   */
  static readonly PRIVACY_OFFSET_MD: number = 2;

  /**
   * The offset of privacy statement component for LG device.
   */
  static readonly PRIVACY_OFFSET_LG: number = 4;

  /**
   * The offset of login component button for SM device.
   */
  static readonly BUTTON_OFFSET_SM: number = 0;

  /**
   * The offset of login component button for MD device.
   */
  static readonly BUTTON_OFFSET_MD: number = 2;

  /**
   * The offset of login component button for LG device.
   */
  static readonly BUTTON_OFFSET_LG: number = 4;

  /**
   * The break point for page.
   */
  static readonly BREAK_POINT: Array<string> = ['320vp', '600vp', '820vp'];

  /**
   * Login scroll layout weight.
   */
  static readonly LOGIN_SCROLL_LAYOUT_WEIGHT: number = 1;

  /**
   * Registration success page scroll layout weight.
   */
  static readonly SCROLL_LAYOUT_WEIGHT: number = 1;

  /**
   * Mine page column layout weight.
   */
  static readonly COLUMN_LAYOUT_WEIGHT: number = 1;

  /**
   * Mine page list size.
   */
  static readonly LIST_SIZE: number = 2;

  /**
   * Title font weight.
   */
  static readonly TITLE_FONT_WEIGHT: number = 500;

  /**
   * Login text font weight.
   */
  static readonly LOGIN_TEXT_FONT_WEIGHT: number = 500;

  /**
   * Button font weight of registration page.
   */
  static readonly BUTTON_FONT_WEIGHT: number = 500;

  /**
   * Text font weight of registration page.
   */
  static readonly TEXT_FONT_WEIGHT: number = 500;

  /**
   * User nickname text font weight.
   */
  static readonly NICKNAME_FONT_WEIGHT: number = 500;

  /**
   * Mine page url.
   */
  static readonly MINE_PAGE_URL: string = 'pages/MinePage';

  /**
   * Registration success page url.
   */
  static readonly REGISTRATION_SUCCESS_PAGE_URL: string = 'pages/RegistrationSuccessPage';

  /**
   * Privacy page url.
   */
  static readonly PRIVACY_PAGE_URL: string = 'pages/PrivacyPage';

  /**
   * Customer service page url.
   */
  static readonly CUSTOMER_SERVICE_PAGE_URL: string = 'pages/CustomerServicePage';

  /**
   * Percent of the text input.
   */
  static readonly TEXT_INPUT_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of divider width.
   */
  static readonly DIVIDER_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the button width.
   */
  static readonly BUTTON_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the flex width.
   */
  static readonly FLEX_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the login page width.
   */
  static readonly LOGIN_PAGE_WIDTH_PERCENT: string = '100%';

  /**
   * Full percent of the width.
   */
  static readonly FULL_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the registration success page width.
   */
  static readonly REGISTRATION_PAGE_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the registration success page height.
   */
  static readonly REGISTRATION_PAGE_HEIGHT_PERCENT: string = '100%';

  /**
   * Percent of text width in mine page.
   */
  static readonly MINE_PAGE_TEXT_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of the mine page width.
   */
  static readonly MINE_PAGE_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of column width in customer service page.
   */
  static readonly CUSTOMER_COLUMN_WIDTH_PERCENT: string = '100%';

  /**
   * Percent of column height in customer service page.
   */
  static readonly CUSTOMER_COLUMN_HEIGHT_PERCENT: string = '100%';

  /**
   * Percent of column height in mine page.
   */
  static readonly MINE_PAGE_HEIGHT_PERCENT: string = '100%';

  /**
   * Percent of the row width.
   */
  static readonly ROW_WIDTH_PERCENT: string = '100%';

  /**
   * Scroll height percentage setting.
   */
  static readonly SCROLL_HEIGHT_PERCENT: string = '100%';

  /**
   * Percent of the column width in detail page.
   */
  static readonly DETAIL_COLUMN_WIDTH_PERCENT: string = '93%';

  /**
   * Date year
   */
  static readonly DATE_YEAR: string = '年';

  /**
   * Date month
   */
  static readonly DATE_MONTH: string = '月';

  /**
   * Date day
   */
  static readonly DATE_DAY: string = '日';

  /**
   * Date dialog start time.
   */
  static readonly START_TIME: string = '1900-1-1';

  static readonly END_TIME: string = '2100-1-1';

  /**
   * Date dialog select time.
   */
  static readonly SELECT_TIME: string = '1990-1-1';

  /**
   * Image back margin left of the 7.2.
   */
  static readonly BACK_MARGIN_LEFT: string = '7.2%';

  /**
   * Image avatar margin top of the 5.5.
   */
  static readonly AVATAR_MARGIN_TOP: string = '5.5%';

  /**
   * Text personal margin top of the 2.1.
   */
  static readonly PERSONAL_MARGIN_TOP: string = '2.1%';

  /**
   * Common dialog width of the 93.3.
   */
  static readonly COMMON_DIALOG_WIDTH: string = '93.3%';

  /**
   * Join comma
   */
  static readonly COMMA: string = '，';

  /**
   * Image back margin top of the 19.
   */
  static readonly BACK_MARGIN_TOP: number = 19;

  /**
   * Font weight of the 500.
   */
  static readonly BIGGER: number = 500;

  /**
   * Dialog y-axis offset distance of the 20.
   */
  static readonly DY_OFFSET: number = -20;

  /**
   * Current month plus one.
   */
  static readonly PLUS_ONE: number = 1;

  /**
   * Layout weight size of the 1.
   */
  static readonly WEIGHT_ONE: number = 1;

  /**
   * Text common max lines of the 1.
   */
  static readonly ONE_LINES: number = 1;

  /**
   * The Common utils tag.
   */
  static readonly TAG_COMMON_UTILS: string = 'CommonUtils';

  /**
   * Custom dialog widget tag.
   */
  static readonly TAG_CUSTOM: string = 'CustomDialogWidget';
  /**
   * Width the percentage of the 100.
   */
  static readonly FULL_WIDTH: string = '100%';

  static readonly FULL_HEIGHT: string = '100%';
}