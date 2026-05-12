@echo off
setlocal enabledelayedexpansion

echo ================================
echo  AUTOCARAVANAS PT - FULL RELEASE
echo ================================
echo.
echo Este script vai:
echo   1. Pedir versao, tipo e titulo
echo   2. git commit + push + tag
echo   3. Criar GitHub Release
echo.
pause

echo.
echo === VERSAO ===
set /p NEW_VERSION=Nova versao (ex: 0.3.0):

echo.
echo === TIPO ===
echo 1 = PATCH (fixes, tweaks, docs)
echo 2 = MINOR (novas features)
echo 3 = MAJOR (breaking changes, redesign)
set /p TIPO=Tipo de release (1/2/3):

echo.
set /p TITULO=Titulo da release (ex: Deploy Vercel e leads reais):

echo.
echo === CONFIRMACAO ===
echo Versao: v!NEW_VERSION!
echo Tipo:   !TIPO!
echo Titulo: !TITULO!
echo.
set /p CONFIRM=Confirma release? (S/N):

if /i not "!CONFIRM!"=="S" (
    echo Cancelado.
    pause
    exit /b 0
)

echo.
echo A fazer commit...
git add index.html backoffice.html CLAUDE.md CHANGELOG.md RELEASE_NOTES.md ROADMAP.md
git commit -m "v!NEW_VERSION!: !TITULO!"
echo OK

echo.
echo A fazer push...
git push origin main
echo OK

echo.
echo A criar tag v!NEW_VERSION!...
git tag -a v!NEW_VERSION! -m "v!NEW_VERSION!: !TITULO!"
git push origin v!NEW_VERSION!
echo OK

echo.
echo A criar GitHub Release...
gh release create v!NEW_VERSION! --title "v!NEW_VERSION! -- !TITULO!" --notes "Release v!NEW_VERSION!: !TITULO!"
echo OK

echo.
echo ================================
echo  CONCLUIDO! v!NEW_VERSION!
echo ================================
echo.
echo Se Vercel nao estiver ligado ao GitHub automaticamente:
echo   vercel --prod
echo   vercel alias (deployment-url) autocaravanas.vercel.app
echo.
pause
