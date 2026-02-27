// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Boarding Title 1`
  String get boardingTitle1 {
    return Intl.message(
      'Boarding Title 1',
      name: 'boardingTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Boarding Sub Title 1`
  String get boardingSubTitle1 {
    return Intl.message(
      'Boarding Sub Title 1',
      name: 'boardingSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Boarding Title 2`
  String get boardingTitle2 {
    return Intl.message(
      'Boarding Title 2',
      name: 'boardingTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Boarding Sub Title 2`
  String get boardingSubTitle2 {
    return Intl.message(
      'Boarding Sub Title 2',
      name: 'boardingSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Boarding Title 3`
  String get boardingTitle3 {
    return Intl.message(
      'Boarding Title 3',
      name: 'boardingTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Boarding Sub Title 3`
  String get boardingSubTitle3 {
    return Intl.message(
      'Boarding Sub Title 3',
      name: 'boardingSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Splash Screen`
  String get splashScreen {
    return Intl.message(
      'Splash Screen',
      name: 'splashScreen',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Login Screen`
  String get loginScreen {
    return Intl.message(
      'Login Screen',
      name: 'loginScreen',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter Email`
  String get enterEmail {
    return Intl.message('Enter Email', name: 'enterEmail', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `New User?`
  String get newUser {
    return Intl.message('New User?', name: 'newUser', desc: '', args: []);
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `All Ready Register ?`
  String get allReadyRegister {
    return Intl.message(
      'All Ready Register ?',
      name: 'allReadyRegister',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Enter Name`
  String get enterName {
    return Intl.message('Enter Name', name: 'enterName', desc: '', args: []);
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Upgrade`
  String get upgrade {
    return Intl.message('Upgrade', name: 'upgrade', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
