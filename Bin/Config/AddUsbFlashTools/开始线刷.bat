@echo off
title HaisؼHaisDevice ��ˢ - QȺ��927251103

echo.***********************************************
echo.
echo.  1��ˢ���з��ա�ˢ��ǰ�뱸�ݺ����ݣ����ñ�ש׼����
echo.  2���˰�δ�����ԣ�ˢ������κ������Լ�����
echo.  3��ˢ�����ȡ�����������Fastbootģʽ��򿪴˽ű���
echo.  4��ˢ��ʧ������USB���������ֻ��Ƿ�������
echo.  5��������һ���ɵ�10����,�������ɳ��Ը�ʽ��data����ˢ��
echo.  6��ˢ��ǰ�뱣�ֵ�ǰĿ¼�޿ո�,ʣ���С����20G,�������ˢ��ʧ�ܡ�
echo.
echo.***********************************************
echo.
echo.  Y=��������ˢ��(Ĭ��)           N=�������ˢ��(��д,�Ƽ��ֶ���ʽ��data����ˢ��)
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
if exist super.new.dat.brx (
	if not exist firmware-update\super.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D brx.transfer.list -d super.new.dat.brx -o firmware-update\super_raw.img
		META-INF\img2simg firmware-update\super_raw.img firmware-update\super.img
		del firmware-update\super_raw.img
	)
	META-INF\fastboot %* flash super firmware-update\super.img
)
if exist system.new.dat.brx (
	if not exist firmware-update\system.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D brx.transfer.list -d system.new.dat.brx -o firmware-update\system.img
	)
	META-INF\fastboot %* flash system firmware-update\system.img
)
if exist vendor.new.dat.brx (
	if not exist firmware-update\vendor.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D brx.transfer.list -d vendor.new.dat.brx -o firmware-update\vendor.img
	)
	META-INF\fastboot %* flash vendor firmware-update\vendor.img
)
if exist system_ext.new.dat.brx (
	if not exist firmware-update\system_ext.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D brx.transfer.list -d system_ext.new.dat.brx -o firmware-update\system_ext.img
	)
	META-INF\fastboot %* flash system_ext firmware-update\system_ext.img
)
if exist vendor.new.dat.brx (
	if not exist firmware-update\vendor.img (
		echo.��ˢ�ļ�����׼����...
		META-INF\brx -D brx.transfer.list -d vendor.new.dat.brx -o firmware-update\vendor.img
	)
	META-INF\fastboot %* flash vendor firmware-update\vendor.img
)



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