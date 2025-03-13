# JoinUsApp

JoinUsApp는 사용자가 회원가입 및 로그인을 할 수 있는 iOS 애플리케이션입니다.
Core Data를 활용하여 사용자 정보를 저장하며, 로그인 상태 유지 및 회원탈퇴 기능을 지원합니다.

📲 주요 기능

✅ 1. 시작하기 화면
	•	시작하기 버튼을 눌러 회원 여부를 확인합니다.
	•	회원이 아니라면 회원가입 화면으로 이동합니다.
	•	이미 가입된 회원이라면 로그인 성공 화면으로 이동합니다.

✅ 2. 회원가입 화면
	•	사용자 입력을 검증하여 회원가입을 진행합니다.
	•	입력 조건:
	•	이메일: 6~20자, 영문 소문자 및 숫자 가능, 숫자로 시작 불가, @ 포함 필수
	•	비밀번호: 최소 8자 이상, 영문자 및 숫자 포함 필수
	•	회원가입 성공 시: 자동으로 로그인 성공 화면으로 이동합니다.

✅ 3. 로그인 성공 화면
	•	로그인된 사용자의 닉네임을 환영 메시지로 표시합니다.
	•	로그아웃 버튼을 클릭하면 시작하기 화면으로 이동합니다.
	•	회원탈퇴 버튼을 클릭하면 계정이 삭제되며 시작하기 화면으로 이동합니다.

⸻

💻 기술 스택
	•	언어: Swift
	•	UI 프레임워크: UIKit, SnapKit
	•	데이터 저장: Core Data, UserDefaults
	•	아키텍처: MVC

⸻

🛠 실행 방법
	1.	Xcode에서 프로젝트를 실행합니다.
	2.	iOS 시뮬레이터 또는 실제 기기에서 빌드합니다.
	3.	시작하기 버튼을 눌러 회원가입 및 로그인 기능을 테스트합니다.

⸻

✅ 현재까지 구현된 기능
	•	Core Data 기반 회원가입 및 로그인
	•	로그인 상태 유지 (UserDefaults 활용)
	•	이메일 및 비밀번호 입력 제한 안내 UI 추가
	•	회원탈퇴 기능 추가
