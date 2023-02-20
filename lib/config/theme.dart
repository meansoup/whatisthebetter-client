import 'package:flex_color_scheme/flex_color_scheme.dart';

// theme come from
// https://rydmike.com/flexcolorscheme/themesplayground-v6/#/

var mainTheme = FlexThemeData.light(
  scheme: FlexScheme.dellGenoa,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 9,
  appBarOpacity: 0.95,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    bottomSheetElevation: 17.0,
    bottomSheetModalElevation: 17.0,
  ),
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);

var mainDarkTheme = FlexThemeData.dark(
  scheme: FlexScheme.dellGenoa,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 15,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    bottomSheetElevation: 17.0,
    bottomSheetModalElevation: 17.0,
  ),
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
);