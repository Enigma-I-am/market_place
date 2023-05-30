


import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/view_model/main_page_vm.dart';


final indexProvider = StateProvider<int>((ref) => 0);
final mainPageVM = ChangeNotifierProvider((_) => MainPageVM(_.read));