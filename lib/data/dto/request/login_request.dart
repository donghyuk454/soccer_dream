class LoginRequest {
  final int memberId;

  LoginRequest(this.memberId);

  int getMemberId() {
    return memberId;
  }

  Map<String, int> toJson() => {
    'memberId' : memberId,
  };
}