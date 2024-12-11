@ECHO OFF
TITLE Re-Sub! v2.a4 :: �ڸ� �̸� ��Ī ��ũ��Ʈ

ECHO (C) 2019. _SN_(sjs9880) all rights reserved.

::���� ������ ����
FOR %%* IN (.) DO SET folder=%%~n*
::���� ��� ����
FOR /f "tokens=*" %%A IN ('DIR *.3gp *.asf *.avi *.dpl *.dsf *.flv *.mkv *.mov *.mp4 *.mpe *.mpeg *.mpg *.nsr *.ogm *.rmvb *.tp *.ts *.vob *.wm *.wmv /A:-D /O:N /B') DO CALL :Renamer "%%A"

:: �ڸ� ���� ��� ����
FOR /f "tokens=*" %%A IN ('DIR *.psb *.srt *.ssa *.ass *.sub *.sami *.smi *.smil *.usf *.vtt /A:-D /O:N /B') DO CALL :Sort1 "%%A"
:: �ڸ� ���� ��� ������
SORT Sub1>Sub2

:: ���� ��Ī ��ũ��Ʈ
SET /a countA=0
SET /a countB=0
SET /a error=0
FOR /f "tokens=*" %%A IN (Vid) DO (
	CALL :count1
	FOR /f "delims=# tokens=1-2" %%B IN (Sub2) DO CALL :count2 "%%A" "%%C"
)
GOTO END

:: �ڸ� ���� ��ȣ �ڸ��� ���߱�
:Sort1
SET SubName=%~1
::�ڸ� Ȯ���� ó��
IF /I "%SubName:~-5%"==".sami" GOTO Sub4S
SET SubTitle=%SubName:~0,-4%
SET SubExt=%SubName:~-3%
GOTO SubJumpS
:Sub4S
SET SubTitle=%SubName:~0,-5%
SET SubExt=%SubName:~-4%
:SubJumpS
SET FN=%SubTitle:+= %
SET FNA=%FN: 1= 0000000001%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 2= 0000000002%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 3= 0000000003%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 4= 0000000004%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 5= 0000000005%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 6= 0000000006%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 7= 0000000007%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 8= 0000000008%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 9= 0000000009%
IF NOT "%FN%"=="%FNA%" GOTO Sort2
SET FNA=%FN: 0= 0000000000%
:: �ڸ� ��Ͽ� ��ȣ ���� ���̱�
:Sort2
ECHO %FNA:~-10%#%SubTitle%.%SubExt%>>Sub1
EXIT /B

:Renamer
::���� ���� �̸����� ȭ�� �� ���ڿ� ����
SET Re=%~1
SET Re=%Re:* - = - %
::���� ���� �̸� ����
REN "%~1" "%folder%%Re%"
ECHO %folder%%Re%>>Vid
EXIT /B

:count1
SET /a countA+=1
SET /a countB=0
EXIT /B

:count2
SET /a countB+=1
SET VidName=%~1
SET SubName=%~2
::���� Ȯ���� ó��
IF /I "%VidName:~-3%"==".tp" GOTO Vid2
IF /I "%VidName:~-3%"==".ts" GOTO Vid2
IF /I "%VidName:~-5%"==".mpeg" GOTO Vid4
IF /I "%VidName:~-5%"==".rmvb" GOTO Vid4
SET VidTitle=%VidName:~0,-4%
SET VidExt=%VidName:~-3%
GOTO VidJump
:Vid2
SET VidTitle=%VidName:~0,-3%
SET VidExt=%VidName:~-2%
GOTO VidJump
:Vid4
SET VidTitle=%VidName:~0,-5%
SET VidExt=%VidName:~-4%
:VidJump
::�ڸ� Ȯ���� ó��
IF /I "%SubName:~-5%"==".sami" GOTO Sub4
SET SubTitle=%SubName:~0,-4%
SET SubExt=%SubName:~-3%
GOTO SubJump
:Sub4
SET SubTitle=%SubName:~0,-5%
SET SubExt=%SubName:~-4%
:SubJump
IF %countA%==%countB% (
	IF EXIST "%VidTitle%.%SubExt%" (
		SET /a error+=1
		IF NOT "%VidTitle%"=="%SubTitle%" SET /a countA-=1
	)
	IF %error%==0 REN "%SubTitle%.%SubExt%" "%VidTitle%.%SubExt%"
	SET /a error=0
)
EXIT /B

:END
DEL Vid
DEL Sub1
DEL Sub2