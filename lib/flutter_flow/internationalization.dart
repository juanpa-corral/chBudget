import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LaunchA
  {
    'uasvu1mt': {
      'en': 'Home',
      'es': '',
    },
  },
  // LaunchB
  {
    'l1vqssgq': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod. ',
      'es': '',
    },
    '7h3dnb2g': {
      'en': 'Log In',
      'es': '',
    },
    'sod6fj5x': {
      'en': 'Sign Up',
      'es': '',
    },
    'bnubi1rq': {
      'en': 'Home',
      'es': '',
    },
  },
  // OnBoarding
  {
    'x7rqhl3f': {
      'en': 'Next',
      'es': '',
    },
    'ga50qifj': {
      'en': 'Home',
      'es': '',
    },
  },
  // Login
  {
    '8y868dbs': {
      'en': 'Welcome',
      'es': '',
    },
    'ate8burw': {
      'en': 'Username Or Email',
      'es': '',
    },
    '85agzqic': {
      'en': 'example@example.com',
      'es': '',
    },
    'b64o0ad8': {
      'en': 'Password',
      'es': '',
    },
    '7a8chkkq': {
      'en': '*  *  *  *  *  *  *  *',
      'es': '',
    },
    'mbbus3yr': {
      'en': 'example@example.com is required',
      'es': '',
    },
    'nd33ud5t': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    '1ffl8x2a': {
      'en': '*  *  *  *  *  *  *  *  is required',
      'es': '',
    },
    '7kku5r4h': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'z025h3m8': {
      'en': 'Log In',
      'es': '',
    },
    'pcxgotkk': {
      'en': 'Forgot Password?',
      'es': '',
    },
    'kcpgzfeg': {
      'en': 'Sign Up',
      'es': '',
    },
    'v3l7yi7b': {
      'en': 'Use Fingerprint To Access',
      'es': '',
    },
    '1lfmjhyz': {
      'en': 'or Log In with',
      'es': '',
    },
    '6dz8m4ox': {
      'en': 'Don\'t have an account?',
      'es': '',
    },
    '4d48h08q': {
      'en': 'Sign Up',
      'es': '',
    },
    'v20racys': {
      'en': 'Home',
      'es': '',
    },
  },
  // SignUp
  {
    'izd1ivyj': {
      'en': 'Create Account',
      'es': '',
    },
    'n3u9kkga': {
      'en': 'Full Name',
      'es': '',
    },
    'l5dqnc3p': {
      'en': '',
      'es': '',
    },
    'nydodra6': {
      'en': 'Juanito Sarmiento',
      'es': '',
    },
    'fm63n2s5': {
      'en': 'Mobile Number',
      'es': '',
    },
    '7bu1khaw': {
      'en': '+57 1234567890',
      'es': '',
    },
    '8hypmex5': {
      'en': 'Email',
      'es': '',
    },
    '1jtdi4bs': {
      'en': 'example@example.com',
      'es': '',
    },
    'd7qj4uoc': {
      'en': 'Password',
      'es': '',
    },
    '9uh1uzk1': {
      'en': '*  *  *  *  *  *  *  *',
      'es': '',
    },
    'ilx4btp6': {
      'en': 'Confirm Password',
      'es': '',
    },
    '1xn90owi': {
      'en': '*  *  *  *  *  *  *  *',
      'es': '',
    },
    'nowqgphd': {
      'en': 'example@example.com is required',
      'es': '',
    },
    'niegr0qb': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'hf6isse5': {
      'en': '*  *  *  *  *  *  *  *  is required',
      'es': '',
    },
    '83zk7ofg': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'tsapxhxe': {
      'en': 'By continuining, you agree to Terms of Use and Privacy Policy.',
      'es': '',
    },
    '2c7r9g6s': {
      'en': 'Sign Up',
      'es': '',
    },
    '4wms5r8g': {
      'en': 'or sign up with',
      'es': '',
    },
    'mjf6ilhi': {
      'en': 'Already have an account?',
      'es': '',
    },
    'exx0s8fg': {
      'en': 'Log In',
      'es': '',
    },
    'qum5cs94': {
      'en': 'Home',
      'es': '',
    },
  },
  // ForgotPassword
  {
    'bemm7z7m': {
      'en': 'Forgot Password',
      'es': '',
    },
    'wx375u4x': {
      'en': 'Reset Password?',
      'es': '',
    },
    'ssy9t8gy': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      'es': '',
    },
    'os4zvb9c': {
      'en': 'Enter Email Address',
      'es': '',
    },
    'ejwrf6o6': {
      'en': 'example@example.com',
      'es': '',
    },
    't1ffpdp6': {
      'en': 'example@example.com is required',
      'es': '',
    },
    '9jfnrar8': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'tb87avlh': {
      'en': '*  *  *  *  *  *  *  *  is required',
      'es': '',
    },
    'z4w3k5zr': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'p1bb0ujz': {
      'en': 'Next Step',
      'es': '',
    },
    'rj9macyl': {
      'en': 'Sign Up',
      'es': '',
    },
    'fzo3huvh': {
      'en': 'Don\'t have an account?',
      'es': '',
    },
    'hrrrzxc5': {
      'en': 'Sign Up',
      'es': '',
    },
    'mixyxvgb': {
      'en': 'Home',
      'es': '',
    },
  },
  // NewPassword
  {
    'htam0szy': {
      'en': 'New Password',
      'es': '',
    },
    'shgld569': {
      'en': 'Send Email for Change Passwrod in a security Way',
      'es': '',
    },
    '3jr4dv7k': {
      'en': 'Change Password',
      'es': '',
    },
    'wmj179r2': {
      'en': 'Home',
      'es': '',
    },
  },
  // SecurityPin
  {
    'w6i637a0': {
      'en': 'Security Pin',
      'es': '',
    },
    '5issm7qj': {
      'en': 'Enter Security Pin',
      'es': '',
    },
    'jjwg9cw2': {
      'en': 'Accept',
      'es': '',
    },
    'nndzi64g': {
      'en': 'Send Again',
      'es': '',
    },
    'dra3os22': {
      'en': 'or sign up with',
      'es': '',
    },
    'qoe0rqc5': {
      'en': 'Don\'t have an account?',
      'es': '',
    },
    'ccnpc10u': {
      'en': 'Sign Up',
      'es': '',
    },
    'ynhm6m6j': {
      'en': 'Home',
      'es': '',
    },
  },
  // SuccesfullyChanged
  {
    '1it91tbe': {
      'en':
          'Email Reset Password Has been sent Successfully! Try Log In Again!',
      'es': '',
    },
    'nvvv5m7x': {
      'en': 'Home',
      'es': '',
    },
  },
  // SecurityFingerprint
  {
    'oc0y7gl6': {
      'en': 'Security Fingerprint',
      'es': '',
    },
    'exrokgov': {
      'en': 'Use Fingerprint To Access',
      'es': '',
    },
    '3h6zkkyz': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt. ',
      'es': '',
    },
    'ax1omcla': {
      'en': 'Use Touch Id',
      'es': '',
    },
    'jizq5l2a': {
      'en': 'Or prefer to use pin code?',
      'es': '',
    },
    '1kstlspg': {
      'en': 'Home',
      'es': '',
    },
  },
  // Home
  {
    'fh92enev': {
      'en': 'Hi, Welcome Back',
      'es': '',
    },
    '8npt8g00': {
      'en': 'Juan Pablo Corral',
      'es': '',
    },
    'xkkdwwl2': {
      'en': 'Total Balance',
      'es': '',
    },
    'ezmfiyzv': {
      'en': '\$8.000.000',
      'es': '',
    },
    'g83j4aux': {
      'en': 'Total Balance',
      'es': '',
    },
    '4tih60oq': {
      'en': '-\$8.000.000',
      'es': '',
    },
    'rtz911ew': {
      'en': '',
      'es': '',
    },
    '4gpwxe67': {
      'en': '\$20.000.000',
      'es': '',
    },
    'u3jzfc0e': {
      'en': '30%',
      'es': '',
    },
    'x2ctz0be': {
      'en': '30% Of Your Expenses, Looks Good',
      'es': '',
    },
    'jkrc5334': {
      'en': '',
      'es': '',
    },
    'fvwokzwm': {
      'en': 'Savings\nOn Goals',
      'es': '',
    },
    '9fmpyqi1': {
      'en': 'Revenue Last Week',
      'es': '',
    },
    'gotp7lcl': {
      'en': '\$6.000.000',
      'es': '',
    },
    'cclkxpdi': {
      'en': 'Food Last Week',
      'es': '',
    },
    'z7uhbjcc': {
      'en': '-\$2.000.000',
      'es': '',
    },
    'lvew9n8h': {
      'en': 'Daily',
      'es': '',
    },
    'tvpq3h42': {
      'en': 'Weekly',
      'es': '',
    },
    'usra22tp': {
      'en': 'Monthly',
      'es': '',
    },
    'emuf2l7x': {
      'en': '',
      'es': '',
    },
    'tuk63ggl': {
      'en': 'Salary',
      'es': '',
    },
    'wpq365w2': {
      'en': 'April 30',
      'es': '',
    },
    'az2zggus': {
      'en': 'Monthly',
      'es': '',
    },
    'dhv5k7su': {
      'en': '\$6.000.000',
      'es': '',
    },
    '1q075k4k': {
      'en': 'Salary',
      'es': '',
    },
    'taia4rd7': {
      'en': 'April 30',
      'es': '',
    },
    'f0euwdwi': {
      'en': 'Monthly',
      'es': '',
    },
    'ytiidynw': {
      'en': '\$6.000.000',
      'es': '',
    },
    'mbx8trzv': {
      'en': 'Salary',
      'es': '',
    },
    '76m2nykb': {
      'en': 'April 30',
      'es': '',
    },
    's64dkkyw': {
      'en': 'Monthly',
      'es': '',
    },
    'plcqs5t5': {
      'en': '\$6.000.000',
      'es': '',
    },
    'w4e70uyg': {
      'en': 'Salary',
      'es': '',
    },
    'u3cphaez': {
      'en': 'April 30',
      'es': '',
    },
    'up2rbqav': {
      'en': 'Monthly',
      'es': '',
    },
    '68ane540': {
      'en': '\$6.000.000',
      'es': '',
    },
    'tiwp7vlv': {
      'en': 'Home',
      'es': '',
    },
  },
  // Transaction
  {
    '3yez6dr7': {
      'en': 'Hi, Welcome Back',
      'es': '',
    },
    'wmuyyf9b': {
      'en': 'Juan Pablo Corral',
      'es': '',
    },
    'kpkxm4hp': {
      'en': 'Total Balance',
      'es': '',
    },
    'np5gboru': {
      'en': '\$8.000.000',
      'es': '',
    },
    'autb5kuz': {
      'en': 'Total Balance',
      'es': '',
    },
    'qgod83a6': {
      'en': '-\$8.000.000',
      'es': '',
    },
    'cs0rz9db': {
      'en': '',
      'es': '',
    },
    '6n97jsh1': {
      'en': '\$20.000.000',
      'es': '',
    },
    'cig1n8wg': {
      'en': '30%',
      'es': '',
    },
    'ezyhmig1': {
      'en': '30% Of Your Expenses, Looks Good',
      'es': '',
    },
    '9dxl1mkc': {
      'en': 'Transaction',
      'es': '',
    },
  },
  // Analysis
  {
    'wdwjju6y': {
      'en': 'Hi, Welcome Back',
      'es': '',
    },
    'awz7gjvv': {
      'en': 'Juan Pablo Corral',
      'es': '',
    },
    '4peuomjm': {
      'en': 'Total Balance',
      'es': '',
    },
    'p7102ans': {
      'en': '\$8.000.000',
      'es': '',
    },
    'c20752f4': {
      'en': 'Total Balance',
      'es': '',
    },
    '03uovtod': {
      'en': '-\$8.000.000',
      'es': '',
    },
    'p45d45fy': {
      'en': '',
      'es': '',
    },
    'x6vphc92': {
      'en': '\$20.000.000',
      'es': '',
    },
    'dmb216ra': {
      'en': '30%',
      'es': '',
    },
    'afsazcg3': {
      'en': '30% Of Your Expenses, Looks Good',
      'es': '',
    },
    'v9g1t6g7': {
      'en': 'Analysis',
      'es': '',
    },
  },
  // Categories
  {
    '65cm3sct': {
      'en': 'Hi, Welcome Back',
      'es': '',
    },
    '2bifgg1t': {
      'en': 'Juan Pablo Corral',
      'es': '',
    },
    'x74d8ugz': {
      'en': 'Total Balance',
      'es': '',
    },
    'kd0hrs86': {
      'en': '\$8.000.000',
      'es': '',
    },
    'ovinhy47': {
      'en': 'Total Balance',
      'es': '',
    },
    'rg5qspnn': {
      'en': '-\$8.000.000',
      'es': '',
    },
    'jgjequc1': {
      'en': '',
      'es': '',
    },
    'a3jtqdeu': {
      'en': '\$20.000.000',
      'es': '',
    },
    '0yft60fp': {
      'en': '30%',
      'es': '',
    },
    'u2k1rjon': {
      'en': '30% Of Your Expenses, Looks Good',
      'es': '',
    },
    'k794dlnv': {
      'en': 'Categories',
      'es': '',
    },
  },
  // Profile
  {
    'maamc0i7': {
      'en': 'Profile',
      'es': '',
    },
    'y0z96bt7': {
      'en': 'Adminstrate Family',
      'es': '',
    },
    '9ywyjqmx': {
      'en': 'Join To a Family',
      'es': '',
    },
    '7mxbv75t': {
      'en': 'Edit Profle',
      'es': '',
    },
    'ds5i55zs': {
      'en': 'Security',
      'es': '',
    },
    '58khgvuo': {
      'en': 'Setting',
      'es': '',
    },
    'luiatrp1': {
      'en': ' Logout',
      'es': '',
    },
    'lpjdikm8': {
      'en': 'Profile',
      'es': '',
    },
  },
  // FamilyCreation
  {
    '5io5s384': {
      'en': 'Create Family',
      'es': '',
    },
    'gwob4cxz': {
      'en': 'Create a family to manage shared expenses',
      'es': '',
    },
    '3zqiogds': {
      'en': 'Family Name',
      'es': '',
    },
    '9agct10g': {
      'en': '',
      'es': '',
    },
    '274u58wj': {
      'en': 'Sarmiento Gonzales',
      'es': '',
    },
    'mirbsw0q': {
      'en': 'Create Family',
      'es': '',
    },
    'a8083r4u': {
      'en': 'Home',
      'es': '',
    },
  },
  // AdminFamily
  {
    '2z3dgfhl': {
      'en': 'Family',
      'es': '',
    },
    'ddbm2i06': {
      'en': 'Family Cards',
      'es': '',
    },
    'lgr3dgnf': {
      'en': 'Add Family Cards',
      'es': '',
    },
    '0vae4u48': {
      'en': 'Profile',
      'es': '',
    },
  },
  // JoinFamily
  {
    'de9mh84y': {
      'en': 'Join To a Family',
      'es': '',
    },
    'g8mhzxzp': {
      'en': 'Enter the Invitation Code',
      'es': '',
    },
    'jt6vx8k1': {
      'en': 'Join Family',
      'es': '',
    },
    'ellu289k': {
      'en': 'Home',
      'es': '',
    },
  },
  // AddCardForm
  {
    'u8gau2tn': {
      'en': 'Add New Family Card',
      'es': '',
    },
    '4mjzgd3v': {
      'en': 'Card Alias',
      'es': '',
    },
    'wo2rqffs': {
      'en': 'My Credit Card',
      'es': '',
    },
    'fi1cbt3j': {
      'en': 'Last 4 Digits',
      'es': '',
    },
    'ypdrt8ni': {
      'en': '1234',
      'es': '',
    },
    'mg7lfwl8': {
      'en': 'Network',
      'es': '',
    },
    'zx2ojlf2': {
      'en': 'Select...',
      'es': '',
    },
    '2tzntwtf': {
      'en': 'Search...',
      'es': '',
    },
    'rs388sk9': {
      'en': 'Visa',
      'es': '',
    },
    'ywtveonn': {
      'en': 'Mastercard',
      'es': '',
    },
    'z3rbnc4p': {
      'en': 'American Express',
      'es': '',
    },
    'enfsn4op': {
      'en': 'Dinners Club',
      'es': '',
    },
    'ws8fob68': {
      'en': 'Discover',
      'es': '',
    },
    '4nbkf7hl': {
      'en': 'Family Member',
      'es': '',
    },
    's7p930sm': {
      'en': 'Select...',
      'es': '',
    },
    'ft81yzed': {
      'en': 'Search...',
      'es': '',
    },
    'kn7l7u9g': {
      'en': 'Add Card',
      'es': '',
    },
  },
  // AddExpenseForm
  {
    '9j2f74cq': {
      'en': 'Description Name',
      'es': '',
    },
    'tscyb4th': {
      'en': '',
      'es': '',
    },
    'pns4ho43': {
      'en': 'Launch on Archie\'s',
      'es': '',
    },
    'w1h4rbqy': {
      'en': 'Amount',
      'es': '',
    },
    'bludj7b7': {
      'en': '120000',
      'es': '',
    },
    'pd8bzgw8': {
      'en': 'Date',
      'es': '',
    },
    'aj0qoj63': {
      'en': 'Category',
      'es': '',
    },
    '54ucjuhb': {
      'en': 'Transport...',
      'es': '',
    },
    'tz3hrt2n': {
      'en': 'Search...',
      'es': '',
    },
    'ujfkkpca': {
      'en': 'Option 1',
      'es': '',
    },
    'z7dg6vzn': {
      'en': 'Option 2',
      'es': '',
    },
    'ro8s9a5j': {
      'en': 'Option 3',
      'es': '',
    },
    '1cxcqak6': {
      'en': 'Type of Transaction',
      'es': '',
    },
    '7vpcpxbp': {
      'en': 'Personal',
      'es': '',
    },
    'jfqqig8x': {
      'en': 'Familiar',
      'es': '',
    },
    '82653ocb': {
      'en': 'Card',
      'es': '',
    },
    'tba82sd8': {
      'en': '****-****-****-3456',
      'es': '',
    },
    'xt3fxnlh': {
      'en': 'Search...',
      'es': '',
    },
    '0n100alu': {
      'en': 'Option 1',
      'es': '',
    },
    'gmbjgtkx': {
      'en': 'Option 2',
      'es': '',
    },
    'ur060v88': {
      'en': 'Option 3',
      'es': '',
    },
    'a9smy4y6': {
      'en': 'Save Expense',
      'es': '',
    },
    'cf5tkcx4': {
      'en': 'example@example.com is required',
      'es': '',
    },
    'iy95mshd': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'xj4jxgoz': {
      'en': '*  *  *  *  *  *  *  *  is required',
      'es': '',
    },
    'po6we9ks': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'gqyr9nm6': {
      'en': '',
      'es': '',
    },
    'qn0t8dqe': {
      'en': '',
      'es': '',
    },
    'k5ax599z': {
      'en': '',
      'es': '',
    },
    'ap1oebl2': {
      'en': '',
      'es': '',
    },
    'p1k2erwo': {
      'en': '',
      'es': '',
    },
    '8bnncunx': {
      'en': '',
      'es': '',
    },
    'jfeevx8r': {
      'en': '',
      'es': '',
    },
    'wheugvxx': {
      'en': '',
      'es': '',
    },
    'qkdqjchg': {
      'en': '',
      'es': '',
    },
    '93wrrh4x': {
      'en': '',
      'es': '',
    },
    'shgffht0': {
      'en': '',
      'es': '',
    },
    'jttwgpo1': {
      'en': '',
      'es': '',
    },
    'eg0z2nsx': {
      'en': '',
      'es': '',
    },
    'tfkgxw2l': {
      'en': '',
      'es': '',
    },
    't3038su7': {
      'en': '',
      'es': '',
    },
    'wjne1tyu': {
      'en': '',
      'es': '',
    },
    'fc9s6hgj': {
      'en': '',
      'es': '',
    },
    '44pzuy3v': {
      'en': '',
      'es': '',
    },
    '7ztk03m8': {
      'en': '',
      'es': '',
    },
    '1k9bxdb9': {
      'en': '',
      'es': '',
    },
    'c96cfgw9': {
      'en': '',
      'es': '',
    },
    'kkrboobj': {
      'en': '',
      'es': '',
    },
    'bggtpe1r': {
      'en': '',
      'es': '',
    },
    'k7nqm3aj': {
      'en': '',
      'es': '',
    },
    '3jiuy4ib': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
