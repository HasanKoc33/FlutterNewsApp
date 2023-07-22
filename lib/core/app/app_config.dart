import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:nested/nested.dart';
import 'package:news_app/bloc/news_cubit/headline_news_cubit.dart';
import 'package:news_app/bloc/news_cubit/news_cubit.dart';
import 'package:news_app/bloc/theme_provider/theme_provider.dart';
import 'package:news_app/data/model/news_model.dart';
import 'package:news_app/ui/screens/home_screen.dart';
import 'package:news_app/ui/screens/news_detail_page.dart';
import 'package:news_app/ui/screens/settings_screen.dart';
import 'package:news_app/ui/screens/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

part 'navigator_routes.dart';
part 'providers.dart';
part 'route_names.dart';
