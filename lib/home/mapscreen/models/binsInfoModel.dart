class BinsInfoModel
{
bool? success ;

List<DataItem> BinsDataList = [];

BinsInfoModel.fromJson(Map<String , dynamic> json)
{
  success = json['success'];

  json["data"].forEach((element){
    BinsDataList.add(DataItem.fromJson(element));
  });

}

}

class DataItem
{
  int? status ;
  int? serialNumber ;
  String? createdAt ;
  String? updatedAt ;
  DataItem.fromJson(Map<String , dynamic> json)
  {
    status = json['status'];
    serialNumber = json['serialNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}