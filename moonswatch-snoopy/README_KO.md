# Moonwatch Snoopy Dual Phase

갤럭시 워치4 이상(Wear OS 4/API 33 이상)을 위한 Watch Face Format 프로젝트입니다.

## 기능

- 공식 제품 클로즈업을 기준으로 보정한 `New Moon Black`, `Full Moon White` 두 가지 다이얼 선택
- 기기 날짜를 사용하는 8단계 실제 달 위상 자동 전환
- 위치·네트워크 권한 불필요
- AOD에서 청록색 야광 달과 비밀 문구 표시
- 일반 화면에서 3시 방향 스누피/달 영역을 터치해 야광 메시지 켜기·끄기
- 초침은 일반 화면에서만 표시
- 실물형 검정 테두리·밝은 인레이 시침/분침과 다이아몬드 카운터웨이트 초침
- 스누피 마스크 아래에서 달 위상 디스크가 8단계로 회전하는 문페이즈 구조
- 9시 및 6시 서브다이얼의 짧은 침은 60 방향에 고정

## 빌드 및 설치

1. Android Studio에서 이 폴더를 엽니다.
2. Galaxy Watch에서 개발자 옵션과 무선 디버깅을 켭니다.
3. Android Studio의 실행 대상에서 워치를 선택하고 `watchface` 모듈을 실행합니다.
4. 워치 화면을 길게 눌러 `Moonwatch Snoopy Dual Phase`를 선택합니다.
5. 워치페이스 편집의 `Dial style`에서 검정 또는 흰색 다이얼을 선택합니다.

명령줄에서는 Android SDK가 준비된 상태에서 `./gradlew :watchface:assembleDebug`를 실행할 수 있습니다.

## 휴대폰에서 APK 받기

1. GitHub 저장소의 `Actions` 탭을 엽니다.
2. 가장 최근의 `Build Wear OS APK` 실행을 선택합니다.
3. 실행이 끝나면 `Artifacts`에서 `Moonwatch-Snoopy-Dual-Phase-APK`를 다운로드합니다.
4. ZIP의 APK를 워치에 설치합니다. 휴대폰에서 워치로 APK를 전송하려면 Wear OS용 ADB 설치 앱 또는 무선 디버깅을 사용할 수 있습니다.

GitHub Actions의 개인 테스트 APK는 실행마다 디버그 서명이 달라질 수 있습니다. `UPDATE_INCOMPATIBLE` 오류가 발생하면 워치에서 기존 `com.giyeol.moonwatch` 패키지를 삭제한 뒤 새 APK를 설치해야 합니다.

## 자동 프리뷰 (Actions 요약에서 바로 확인)

`main`에 push하면 `Build Wear OS APK` 워크플로우의 `preview` 잡이 Wear OS 4 에뮬레이터(원형 대형 화면)에서 워치페이스를 실행해, 오늘부터 +0/5/10/15/20/25일 날짜의 달 위상 6장과 AOD(화면 꺼짐) 화면 1장을 캡처합니다. Actions 실행 페이지의 **Summary** 탭에 이미지가 바로 표시되며, 원본 PNG는 `Moonwatch-Previews` 아티팩트로도 받을 수 있습니다.

> 개인 사용용 디자인입니다. 상표·캐릭터 이미지의 배포 또는 판매 권리는 별도로 확인해야 합니다.
