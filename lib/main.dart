import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hushin/application/bloc/user_bloc.dart';
import 'package:hushin/data/repository/user/user_repository_imple.dart';
import 'package:hushin/features/navigatonbar/navigation_cubit.dart';
import 'package:hushin/features/theme/cubit/theme_cubit.dart';
import 'package:hushin/features/theme/style/theme_style.dart';
import 'package:hushin/firebase_options.dart';
import 'package:hushin/pages/home/home_page.dart';
import 'package:hushin/pages/spalsh/splash.dart';
import 'package:hushin/service_locator.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        kIsWeb
            ? HydratedStorageDirectory.web
            : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = UserRepositoryImple(
      firestore: FirebaseFirestore.instance,
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => UserBloc(repository)..fetchUsers()),
        BlocProvider(create: (_) => NavigationCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder:
            (context, themeMode) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Hushin',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              home: HomePage(),
            ),
      ),
    );
  }
}
