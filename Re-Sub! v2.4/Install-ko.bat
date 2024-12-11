@ECHO OFF
CD "%~dp0"
TITLE Re-Sub! v2.4 설치 관리자
MODE CON COLS=90 LINES=13

:start
ECHO (C) 2019. _SN_(sjs9880) all rights reserved.
ECHO.
ECHO.
ECHO 		┌───────────────────────────────────────────────────────┐
ECHO 		│		 [ Re-Sub! v2.0 ] 설치 관리자		│
ECHO 		├───────────────────────────────────────────────────────┤
ECHO 		│	1 : 설치	2 : 제거	3 : 종료	│
ECHO 		└───────────────────────────────────────────────────────┘
ECHO			※ 관리자 권한으로 실행시켜주세요.
ECHO.
ECHO.
SET /P Select=실행할 작업을 선택 하세요. (1~3) : 
IF %Select%==1 GOTO install
IF %Select%==2 GOTO Uninstall
IF %Select%==3 GOTO END
ECHO 잘못입력하셧습니다.
GOTO start

:install
MKDIR %appdata%\Re-Sub!\
MKDIR %appdata%\Re-Sub!\icon\
COPY "%~dp0\Re-Sub! v2.a4.bat" "%appdata%\Re-Sub!\Re-Sub! v2.a4.bat"
COPY "%~dp0\Re-Sub! v2.b3.bat" "%appdata%\Re-Sub!\Re-Sub! v2.b3.bat"
COPY "%~dp0\icon\Fol.ico" "%appdata%\Re-Sub!\icon\Fol.ico"
COPY "%~dp0\icon\Re.ico" "%appdata%\Re-Sub!\icon\Re.ico"
COPY "%~dp0\icon\Vid.ico" "%appdata%\Re-Sub!\icon\Vid.ico"
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub" /v "MUIVerb" /t REG_SZ /d "Re-Sub! :: 자막 파일 매칭" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub" /v "icon" /t REG_SZ /d "%appdata%\Re-Sub!\icon\Re.ico" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub" /v "SubCommands" /t REG_SZ /d "" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub" /v "Position" /t REG_SZ /d "" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\1" /v "MUIVerb"  /t REG_SZ /d "폴더 이름 따라가기" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\1" /v "icon" /t REG_SZ /d "%appdata%\Re-Sub!\icon\Fol.ico" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\1\command" /ve /t REG_SZ /d "%appdata%\Re-Sub!\Re-Sub! v2.a4.bat" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\2" /v "MUIVerb"  /t REG_SZ /d "영상 이름 따라가기" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\2" /v "icon" /t REG_SZ /d "%appdata%\Re-Sub!\icon\Vid.ico" /f
REG ADD "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub\shell\2\command" /ve /t REG_SZ /d "%appdata%\Re-Sub!\Re-Sub! v2.b3.bat" /f
ECHO.
IF %ERRORLEVEL%==1 echo [ 에러 : 관리자 권한으로 실행시켜주세요. ]
ECHO.
PAUSE
GOTO END

:Uninstall
RMDIR /S "%appdata%\Re-Sub!"
REG DELETE "HKEY_CLASSES_ROOT\Directory\Background\shell\Re_Sub" /F
ECHO.
IF %ERRORLEVEL%==1 echo [ 에러 : 관리자 권한으로 실행시켜주세요. ]
ECHO.
PAUSE

:END