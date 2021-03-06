@REM
@REM solomon build
@REM


@REM
@REM 環境変数の初期化
@REM

@SETLOCAL

@SET SOLOMON_TARGET_SOLOMON_DIR=%~dp0
@SET SOLOMON_TARGET_CONFIG_DIR=%SOLOMON_TARGET_SOLOMON_DIR%\conf
@SET SOLOMON_TARGET_CONFIG_CMD=%SOLOMON_TARGET_CONFIG_DIR%\config.cmd
@SET SOLOMON_TARGET_CONFIG_LOCALHOST_CMD=%SOLOMON_TARGET_CONFIG_DIR%\config.%COMPUTERNAME%.cmd
@SET SOLOMON_TARGET_CONFIG_LOCALHOST_USER_CMD=%SOLOMON_TARGET_CONFIG_DIR%\config.%COMPUTERNAME%.%USERNAME%.cmd


@REM
@REM 設定ファイルの読み込み
@REM

@REM target\solomon\conf\config.cmd の読み込み
@IF NOT EXIST "%SOLOMON_TARGET_CONFIG_CMD%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: 設定ファイル "%SOLOMON_TARGET_CONFIG_CMD%" が存在しません。&GOTO :EOF
@CALL "%SOLOMON_TARGET_CONFIG_CMD%"

@REM target\solomon\conf\config.%COMPUTERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_TARGET_CONFIG_LOCALHOST_CMD%" CALL "%SOLOMON_TARGET_CONFIG_LOCALHOST_CMD%"

@REM target\solomon\conf\config.%COMPUTERNAME%.%USERNAME%.cmd がある場合はそちらも読み込む
@IF EXIST "%SOLOMON_TARGET_CONFIG_LOCALHOST_USER_CMD%" CALL "%SOLOMON_TARGET_CONFIG_LOCALHOST_USER_CMD%"


@REM
@REM solomon\main.cmdの呼び出し
@REM
 
@IF "" EQU "%SOLOMON_MAIN_CMD%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: SOLOMON_MAIN_CMD が指定されていません。設定を確認してください。&GOTO :EOF
@IF NOT EXIST "%SOLOMON_MAIN_CMD%" COLOR 0C&ECHO %SOLOMON_MESSAGE_PREFIX%CONFIG-ERROR: "%SOLOMON_MAIN_CMD%" が見つかりません。設定を確認してください。&GOTO :EOF
@CALL "%SOLOMON_MAIN_CMD%" %*
