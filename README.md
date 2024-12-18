# Re-Sub-
:: (C) 2019. _SN_(sjs9880) all rights reserved.
:: 제작 _SN_ [ https://sjs9880.blog.me/221655276348 ] 2018.09.28 배포
:: 본 스크립트는 파일 검색, 파일 생성, 이름 변경에 관한 명령어가 포함돼있으며, 사용 중 파일 손상이나 유실의 위험이 있습니다.


Re-Sub! 은 영상 파일과 자막 파일의 이름을 일괄 변경하는 스크립트입니다.
사용 중 발생한 파일 손상, 유실에 대해서는 제작자는 책임지지 않으며, 사전에 충분한 테스트를 거쳐서 사용하시길 당부 드립니다.

본 스크립트는 batch 언어로 작성되었으며, batch-file로 실행됩니다.
윈도우10 64bit 환경에서 제작, 테스트되었습니다.


[ 지원 기능 ]
1. 마우스 콘텍스트 메뉴(우클릭 메뉴) 에서 현재 폴더에 대해 작업 바로 실행하기
2. 자막 파일과 영상 파일을 자동으로 매칭하기 (파일 이름 정렬 순으로 동작)
3. 자막 파일의 이름을 영상 파일의 이름으로 변경
4. 영상 파일의 이름을 현재 폴더 이름으로 변경 후 1번 기능 동작
5. 영상 파일과 같은 이름의 자막이 존재하는 경우 건너뛰기 (자막 파일의 확장자가 동일한 경우에만)


[ 동작 조건 ]
1. 매칭할 자막 파일과 영상파일의 순서가 일치할 것. (자막 파일이 영상 파일의 이름을 따라가며, 정렬된 순서대로 매칭 됩니다.)
2. 영상 및 자막 파일들의 확장자가 1가지로 통일되어 있을 것. (두 가지 이상의 자막 확장자 또는 영상 확장자가 혼합되어 있을 경우 인식하지 못하고 잘못 매칭 됩니다.)
3. 영상 파일의 화수 앞에 " - "(띄어쓰기 포함) 문자가 있을 것.
4. 자막 파일의 화수 앞에 "+" 문자 또는 띄어쓰기가 있을 것.
4. 자막 파일의 화수 뒤에 최대  8자 이내의 문자만 있을 것.


[ 인식 가능 확장자 ]
영상 지원 확장자 : 3gp , asf , avi , dpl , dsf , flv , mkv , mov , mp4 , mpe , mpeg , mpg , nsr , ogm , rmvb , tp , ts , vob , wm , wmv
자막 지원 확장자 : psb , srt , ssa , ass , sub , sami , smi , smil , usf , vtt

[  설치  ]
1. install-ko.bat 파일을 관리자 권한으로 실행.
2. 1 을 입력 후 엔터
3. 설치 완료.

[  제거  ]
1. install-ko.bat 파일을 관리자 권한으로 실행.
2. 2 을 입력 후 엔터
3. 제거 완료.

[  사용  ]
1. 영상과 자막이 있는 폴더에서 파일 탐색기 공백 부분을 우 클릭
2. 우 클릭 메뉴 하단에 "Re-Sub! :: 자막 파일 매칭"의 하위 옵션 메뉴 클릭
3. CMD 창이 실행되며, 자동으로 종료됨.
4. 선택한 옵션에 따라 자막 파일 또는 영상 파일의 이름이 변경됨.
