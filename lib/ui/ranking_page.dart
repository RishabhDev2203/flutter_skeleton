import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_skeleton/bloc/cubit/ranking_cubit.dart';
import 'package:flutter_skeleton/repository/ranking_repository.dart';
import 'package:flutter_skeleton/ui/sub_category_page.dart';
import 'package:flutter_skeleton/utils/app_colors.dart';
import '../bloc/api_resp_state.dart';
import '../dto/ranking_dto.dart';
import '../utils/utility.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({Key? key}) : super(key: key);

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage>
    with SingleTickerProviderStateMixin {
  RankingCubit? _rankingCubit;
  RankingDto? rankingData;
  late TabController _tabController;
  final List<String> categories = ["ODI", "TEST", "T20"];
  final List<String> subCategories = [
    "Batsman",
    "Bowlers",
    "All-rounders",
    "Teams"
  ];

  @override
  void initState() {
    _rankingCubit = RankingCubit(RankingRepository());
    _getData();
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _rankingCubit = null;
    _rankingCubit?.close();
    super.dispose();
  }

  _getData() {
    Utility.showLoader(context);
    _rankingCubit?.getRankingDataCubit();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Ranking'.toUpperCase(),
            style: const TextStyle(
              color: AppColors.whiteColor,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[Colors.indigoAccent, Colors.indigo]),
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: AppColors.whiteColor,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.whiteColor,
            unselectedLabelColor: AppColors.whiteColor,
            indicatorPadding: const EdgeInsets.only(bottom: 1),
            tabs: const [
              Tab(
                text: "ODI",
              ),
              Tab(
                text: "TEST",
              ),
              Tab(
                text: "T20",
              ),
            ],
          ),
        ),
        body: _getBody(),
      ),
    );
  }

  _getBody() {
    return MultiBlocListener(
        listeners: [
          BlocListener<RankingCubit, ResponseState>(
            bloc: _rankingCubit,
            listener: (context, state) {
              if (state is ResponseStateLoading) {
              } else if (state is ResponseStateEmpty) {
              } else if (state is ResponseStateNoInternet) {
              } else if (state is ResponseStateError) {
              } else if (state is ResponseStateSuccess) {
                Utility.hideLoader(context);
                var dto = state.data as RankingDto;
                if (dto != null) {
                  rankingData = dto;
                }
              }
              setState(() {});
            },
          )
        ],
        child: TabBarView(
            controller: _tabController,
            children: categories
                .map(
                  (category) => SubCategoryWidget(
                    subCategories: subCategories,
                    rankingDto: rankingData?.responseData?.result,
                    tabController: _tabController,
                  ),
                )
                .toList()));
  }
}
