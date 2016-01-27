@REM
@REM build
@REM


@REM
@REM ����
@REM

@CALL VERSION.cmd


@REM
@REM version.json �̍쐬
@REM

@ECHO "%VERSION_MAJOR%.%VERSION_MINOR%.%VERSION_BUILD%" >web\version.json


@REM
@REM �{�̏���
@REM

@REM �R���p�C�����ʂ̃R�s�[��f�B���N�g���̍쐬
@SET RESULT_DIR=%SOLOMON_SNAPSHOT_DIR%\result\%BUILD_NAME%
@IF NOT EXIST "%RESULT_DIR%" CALL "%SOLOMON_LIBCMD_DIR%\mkdir.ex.cmd" "%RESULT_DIR%"

@REM �R���p�C�����ʃf�B���N�g���Ƀo�[�W�������t�@�C�������݂��Ă�����폜
@IF EXIST "%RESULT_DIR%\VERSION.cmd" DEL "%RESULT_DIR%\VERSION.cmd"

@REM �R���p�C�����ʂ��R�s�[
@CALL "%SOLOMON_MAKE_SNAPSHOT_CMD%" ".\web" "%RESULT_DIR%\web" >NUL
@COPY /Y ".\VERSION.cmd" "%RESULT_DIR%" >NUL

@CALL "%SOLOMON_COMPILE_SUCCESS_CMD%"
@CALL "%SOLOMON_TEST_SUCCESS_CMD%"