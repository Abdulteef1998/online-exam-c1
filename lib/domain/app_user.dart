class AppUser {
  String? id;
  String? firstName;
  String? lastName;
  String? token;
  String? email;
  String? resetCode;
  String? newPassword;

  AppUser.fromData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.token,
    this.resetCode,
    this.newPassword,
  });
}
