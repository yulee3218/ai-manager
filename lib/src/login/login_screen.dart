import 'package:ai_manager/core/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void kakaoLogin() async {
  final isKakaoInstalled = await isKakaoTalkInstalled();
  if (isKakaoInstalled) {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      print('카카오 로그인 성공 ${token.accessToken}');
    } catch (error) {
      print('카카오 로그인 실패 $error');
    }
  } else {
    try {
      await AuthCodeClient.instance.authorize(
        redirectUri: AppConstants.redirectUrl,
      );
    } catch (error) {
      print('카카오 로그인 실패 $error');
    }
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text("휴대폰 번호로 간편하게 시작하기"),
          ),
          ElevatedButton(
              onPressed: () {
                kakaoLogin();
              },
              child: Text("카카오 아이디로 시작하기")),
          ElevatedButton(onPressed: () {}, child: Text("네이버 아이디로 시작하기")),
          ElevatedButton(onPressed: () {}, child: Text("애플 아이디로 시작하기")),
        ],
      ),
    );
  }
}
