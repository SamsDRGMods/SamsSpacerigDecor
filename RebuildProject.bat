@echo off

echo Administrative permissions required. Detecting permissions...
net session >nul 2>&1
if %errorLevel% == 0 (
	echo Success: Administrative permissions confirmed.
) else (
	echo Failure: Current permissions inadequate.
	pause
	exit
)

rem change the current directory to the bat location
pushd %~dp0

echo downloading submodules
git submodule update --init --recursive

echo making symbolic links
rmdir "%cd%\FSD\Content\DRGLib"
del "%cd%\FSD\Content\DRGLib"
mklink /d "%cd%\FSD\Content\DRGLib" "%cd%\SpacerigDecoratorModule\DRGLibModule\DRGLib UE project\Content\DRGLib"
rmdir "%cd%\FSD\Content\SpacerigDecorator"
del "%cd%\FSD\Content\SpacerigDecorator"
mklink /d "%cd%\FSD\Content\SpacerigDecorator" "%cd%\SpacerigDecoratorModule\SpacerigDecorator UE project\Content\SpacerigDecorator"

pause
