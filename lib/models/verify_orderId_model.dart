
// ignore_for_file: file_names

class VerifyIdModel {
    VerifyIdModel({
        this.id,
        this.transactionStatus,
        this.additionalDescription,
        this.amount,
        this.externalId,
        this.reason,
        this.created,
        this.modified,
        this.isActive,
        this.orderId,
        this.refundId,
    });

    int? id;
    String? transactionStatus;
    String? additionalDescription;
    String? amount;
    String? externalId;
    dynamic reason;
    DateTime? created;
    DateTime? modified;
    int? isActive;
    int? orderId;
    dynamic refundId;

    factory VerifyIdModel.fromJson(Map<String, dynamic> json) => VerifyIdModel(
        id: json["id"],
        transactionStatus: json["transaction_status"],
        additionalDescription: json["additional_description"],
        amount: json["amount"],
        externalId: json["external_id"],
        reason: json["reason"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
        modified: json["modified"] == null ? null : DateTime.parse(json["modified"]),
        isActive: json["is_active"],
        orderId: json["order_id"],
        refundId: json["refund_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "transaction_status": transactionStatus,
        "additional_description": additionalDescription,
        "amount": amount,
        "external_id": externalId,
        "reason": reason,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "is_active": isActive,
        "order_id": orderId,
        "refund_id": refundId,
    };
}
