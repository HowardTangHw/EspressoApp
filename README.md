# ![ico](assets/images/Logo/SVG/Favicon-32x32.svg) Espresso App

![LOGO](assets/images/Logo/SVG/main-logo.svg)

## https://espresso.haowenmogu.chat/

### Powered By by Vercel

## Infra TODO:

- [x] dio
- [x] fquery
- [x] GetX
- [x] [google_nav_bar](https://pub.dev/packages/google_nav_bar)
- [x] flutter_native_splash
- [x] husky + commitlint
- [x] Flutter Hooks
- [x] infinite_scroll_pagination
- [x] MacOS
- [x] iOS
- [ ] Android
- [ ] Windows

## Requirement

> Home Page , Search Page , Profile Page , Repo Detail Page

### Home Page

- [ ] Favorite List(Unlimited loading)

### Search Page

- [ ] Search function

### Profile page

- [ ] Sign in
- [ ] Overview
- [ ] Repositories

### Repo Detail Page

> Global Repo Page when clicking any repo in the list

- [ ] Code
- [ ] Issues
- [ ] Pull Requests
- [ ] etc..

## Api list

[Github Api](https://api.github.com/)

Favorite List:

```
https://api.github.com/search/repositories?q=stars:>10000&sort=stars&order=desc
```

## JSON to Dart Model

> https://javiercbk.github.io/json_to_dart/

## Splash Command

> flutter pub run flutter_native_splash:create
**REMINDER: Please do not upload modifications to the site, as it has been enhanced separately**

## Windows command

> dart run msix:create

## iOS Command
1. xcrun simctl list devices
2. xcrun simctl boot "iPhone 15"
3. flutter devices
4. run `flutter run -d "iPhone 15" --machine`
