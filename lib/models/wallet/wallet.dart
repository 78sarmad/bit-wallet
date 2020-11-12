class Wallet {
  String status;
  Data data;

  Wallet({this.status, this.data});

  Wallet.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String network;
  int userId;
  String address;
  String label;
  String availableBalance;
  String pendingReceivedBalance;

  Data(
      {this.network,
      this.userId,
      this.address,
      this.label,
      this.availableBalance,
      this.pendingReceivedBalance});

  Data.fromJson(Map<String, dynamic> json) {
    network = json['network'];
    userId = json['user_id'];
    address = json['address'];
    label = json['label'];
    availableBalance = json['available_balance'];
    pendingReceivedBalance = json['pending_received_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['network'] = this.network;
    data['user_id'] = this.userId;
    data['address'] = this.address;
    data['label'] = this.label;
    data['available_balance'] = this.availableBalance;
    data['pending_received_balance'] = this.pendingReceivedBalance;
    return data;
  }
}
