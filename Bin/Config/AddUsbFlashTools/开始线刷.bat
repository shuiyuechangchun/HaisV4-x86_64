@echo off
title HaisؼHaisDevice ��ˢ - QȺ��927251103

echo.***********************************************
echo.
echo.  1��ˢ���з��ա�ˢ��ǰ�뱸�ݺ����ݣ����ñ�ש׼����
echo.  2���˰�δ�����ԣ�ˢ������κ������Լ�����
echo.  3��ˢ�����ȡ�����������Fastbootģʽ��򿪴˽ű���
echo.  4��ˢ��ʧ������USB���������ֻ��Ƿ�������
echo.
echo.***********************************************
echo.
echo.  Y=��������ˢ��(Ĭ��)           N=�����������ˢ��(����Ҫ��д)
echo.
set /p CHOICE=����ѡ��
cd %~dp0
echo.
echo.�뽫�ֻ�����fastboot,���߻��Զ���ʼˢ��
echo.
echo.�����������Ӧ��ǰ��QȺ'927251103'����Ѱ��������װ�������ֻ��ڹ������¿�ʼ��
echo.
META-INF\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *HaisDevice" || echo ���Ͳ�ƥ��,��ֹˢ��
META-INF\fastboot %* getvar product 2>&1 | findstr /r /c:"^product: *HaisDevice" || exit /B 1
if exist system.new.dat.brx (
	if not exist firmware-update\super.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D system.transfer.list -d system.new.dat.brx -o firmware-update\super.img
	)
)
if "%CHOICE%" == "N" (
	echo.�û��������������...
	META-INF\fastboot %* erase userdata  >NUL 2>NUL
	META-INF\fastboot %* erase secdata  >NUL 2>NUL
	META-INF\fastboot %* erase metadata  >NUL 2>NUL
	META-INF\fastboot %* erase exaid  >NUL 2>NUL
	META-INF\fastboot -w  >NUL 2>NUL
	echo.
)
META-INF\fastboot %* set_active a 
echo.
echo.
echo.  ˢ�����������ĵȴ�,��ɺ����������ʾ��
echo.
echo.
META-INF\fastboot %* flash super firmware-update\super.img
echo.
echo.
echo.  ��ϲ��ˢ����ɣ�ϵͳ����������������Ӧ���ֶ�������
echo.
META-INF\fastboot %* set_active a 
META-INF\fastboot %* reboot 
echo.***********************************************
echo.
echo.  1���˰�δ�����ԣ�ˢ������κ������Լ�����
echo.  2���粻�ܿ������ɳ���REC�ָ����ʽ��data�󿪻���
echo.  3���粻�ܿ�������ʹ�ùٷ�MiFlashˢ�ٰ��ָ���
echo.  4������ò���ϣ�����Ⱥ��֧��һ��Hais��
echo.
echo.***********************************************
echo.
echo.   �籣������ˢ������һ�����볢��ж����ߺ�����
echo.
echo.***********************************************
echo.  ��������رմ˴���
echo.
pause
exit