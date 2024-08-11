// class AuthResponse {
//   String accessToken;
//   String tokenType;
//   int expiresIn;

//   AuthResponse({
//     required this.accessToken,
//     required this.tokenType,
//     required this.expiresIn,
//   });

//   factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
//         accessToken: json["token"],
//         tokenType: json["token_type"],
//         expiresIn: json["expires_in"],
//       );

//   Map<String, dynamic> toJson() => {
//         "access_token": accessToken,
//         "token_type": tokenType,
//         "expires_in": expiresIn,
//       };

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AuthResponse &&
//           runtimeType == other.runtimeType &&
//           accessToken == other.accessToken &&
//           tokenType == other.tokenType &&
//           expiresIn == other.expiresIn;

//   @override
//   int get hashCode =>
//       accessToken.hashCode ^ tokenType.hashCode ^ expiresIn.hashCode;
// }
