///
/// Created by Maker on 2019/8/7.
/// Description:
/// 
class TravelTab{
  String labelName;
  String groupChannelCode;

  TravelTab({this.labelName, this.groupChannelCode});

  TravelTab.fromJson(Map<String, dynamic> json) {
    labelName = json['labelName'];
    groupChannelCode = json['groupChannelCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labelName'] = this.labelName;
    data['groupChannelCode'] = this.groupChannelCode;
    return data;
  }

  @override
  String toString() {
    return 'TravelTab{labelName: $labelName, groupChannelCode: $groupChannelCode}';
  }


}

