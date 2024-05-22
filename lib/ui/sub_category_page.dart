import 'package:flutter/material.dart';
import '../dto/ranking_dto.dart' as rank;

class SubCategoryWidget extends StatefulWidget {
  final List<String>? subCategories;
  final rank.Result? rankingDto;
  final TabController? tabController;

  const SubCategoryWidget(
      {Key? key,
      @required this.subCategories,
      this.rankingDto,
      this.tabController})
      : super(key: key);

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.subCategories!.length,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(48.0),
        child: TabBar(
          controller: _tabController,
          unselectedLabelColor: Colors.indigo,
          labelColor: Colors.white,
          labelPadding: EdgeInsets.zero,
          dividerHeight: 0,
          padding: const EdgeInsets.symmetric(vertical: 5),
          indicator: const BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(4))),
          tabs: widget.subCategories!
              .map<Widget>((subCategory) => Tab(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Text(
                      subCategory,
                      style: const TextStyle(fontSize: 13),
                    ),
                  )))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          playerDetailsTable(
              context,
              widget.tabController?.index == 0
                  ? widget.rankingDto?.odiBatsman
                  : widget.tabController?.index == 1
                      ? widget.rankingDto?.testBatsman
                      : widget.rankingDto?.t20Batsman),
          playerDetailsTable(
              context,
              widget.tabController?.index == 0
                  ? widget.rankingDto?.odiBowler
                  : widget.tabController?.index == 1
                      ? widget.rankingDto?.testBowler
                      : widget.rankingDto?.t20Bowler),
          playerDetailsTable(
              context,
              widget.tabController?.index == 0
                  ? widget.rankingDto?.odiAllRounder
                  : widget.tabController?.index == 1
                      ? widget.rankingDto?.testAllRounder
                      : widget.rankingDto?.t20AllRounder),
          teamDetailsTable(
              context,
              widget.tabController?.index == 0
                  ? widget.rankingDto?.odiTeams
                  : widget.tabController?.index == 1
                      ? widget.rankingDto?.testTeams
                      : widget.rankingDto?.t20Teams)
        ],
      ),
    );
  }

  Widget playerDetailsTable(
      BuildContext context, List<rank.OdiAllRounder>? data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
            space: 0,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
        ),
        child: SingleChildScrollView(
          child: DataTable(
              horizontalMargin: 30,
              headingRowHeight: 40,
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
              columns: [
                DataColumn(
                  label: Text(
                    "Rank".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Players".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Points".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
              rows: data != null && data.isNotEmpty
                  ? List.generate(data.length, (index) {
                      var dto = data[index];
                      return DataRow(
                          color: index % 2 == 0
                              ? MaterialStateProperty.all(Colors.white)
                              : MaterialStateProperty.all(Colors.grey.shade200),
                          cells: [
                            DataCell(Text(
                              dto.position.toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )),
                            DataCell(Text(dto.playerName.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                            DataCell(Text(dto.points.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                          ]);
                    }).toList()
                  : []),
        ),
      ),
    );
  }

  Widget teamDetailsTable(BuildContext context, List<rank.Team>? data) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          dividerTheme: const DividerThemeData(
            color: Colors.transparent,
            space: 0,
            thickness: 0,
            indent: 0,
            endIndent: 0,
          ),
        ),
        child: SingleChildScrollView(
          child: DataTable(
              horizontalMargin: 30,
              headingRowHeight: 40,
              headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
              columns: const [
                DataColumn(
                  label: Text(
                    "Rank",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Players",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Rating",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                DataColumn(
                  label: Text(
                    "Points",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
              rows: data != null && data.isNotEmpty
                  ? List.generate(data.length, (index) {
                      var dto = data[index];
                      return DataRow(
                          color: index % 2 == 0
                              ? MaterialStateProperty.all(Colors.white)
                              : MaterialStateProperty.all(Colors.grey.shade200),
                          cells: [
                            DataCell(Text(
                              dto.position.toString(),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            )),
                            DataCell(Text(
                                "${dto.teamName!.split("\n").first} ${dto.teamName!.split("\n").last}",
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                            DataCell(Text(dto.rating.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                            DataCell(Text(dto.points.toString(),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400))),
                          ]);
                    }).toList()
                  : []),
        ),
      ),
    );
  }
}
