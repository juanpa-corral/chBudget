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
      'en': 'or sign up with',
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
    '0do99xra': {
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
    '6c0hsfzz': {
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
    'ci9xhesj': {
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
    'z1d9ysp0': {
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
    '9i5qe4zu': {
      'en': 'New Password',
      'es': '',
    },
    '4bi2dxk5': {
      'en': '*  *  *  *  *  *  *  *',
      'es': '',
    },
    '662bxesz': {
      'en': 'Confirm New Password',
      'es': '',
    },
    'hsljthd5': {
      'en': '*  *  *  *  *  *  *  *',
      'es': '',
    },
    'rshvteee': {
      'en': 'example@example.com is required',
      'es': '',
    },
    '9l4krky3': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'vz1ko0qt': {
      'en': '*  *  *  *  *  *  *  *  is required',
      'es': '',
    },
    '1c9ngnmw': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    '3jr4dv7k': {
      'en': 'Change Password',
      'es': '',
    },
    'gbmtuv5o': {
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
    '0v7rxh1g': {
      'en': 'Home',
      'es': '',
    },
  },
  // SuccesfullyChanged
  {
    '1it91tbe': {
      'en': 'Password Has been Changed successfully',
      'es': '',
    },
    'gfxv1h1k': {
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
    'o6ohms1p': {
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
    '3lg3rb5f': {
      'en': 'Home',
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
