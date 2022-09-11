import 'package:booriya/Colors.dart';
import 'package:booriya/common/info_form_field.dart';
import 'package:booriya/pages/fire_info_page/components/video_play.dart';
import 'package:booriya/styles.dart';
import 'package:flutter/material.dart';

class FireInfoPage extends StatelessWidget {
  final dataList;

  const FireInfoPage({this.dataList});

  @override
  Widget build(BuildContext context) {
    var url = dataList[0];
    var location = dataList[1];
    var roomName = dataList[2];
    var date = dataList[3];
    return Scaffold(
      appBar: AppBar(
        title: Text("화재 발생 정보"),
      ),
      // endDrawer: _buildBooriyaDrawer(context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView(
            children: [
              _buildVideo(url),
              _buildInfo(location, roomName, date),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVideo(String url) {
    return Column(
      children: [
        Text(
          "화재 발생 영상",
          style: h5(),
        ),
        VideoPlayerScreen(url: url),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildInfo(String location, String roomName, DateTime date) {
    return Column(
      children: [
        Text(
          "화재 발생 상세 정보",
          style: h5(),
        ),
        Container(
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: backgroundColor(),
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoFormField(
                  titleText: "1. 화재 감지 시간",
                  infoText: "${date}",
                ),
                SizedBox(height: 10),
                InfoFormField(
                  titleText: "2. 장소",
                  infoText: location,
                ),
                SizedBox(height: 10),
                InfoFormField(
                  titleText: "3. 발화 장소",
                  infoText: roomName,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
