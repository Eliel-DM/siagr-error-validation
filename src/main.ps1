<#
.SYNOPSIS
    Menu principal que chama scripts de ação.
.DESCRIPTION
    Exibe um menu numerado de 1 a 10. Cada opção invoca um script .ps1
    localizado na pasta ".\Scripts".
.NOTES
    Salve este arquivo como "main.ps1".
#>


function Main {
    Clear-Host
    $pastaScripts = ".\scripts"  # Ajuste o caminho se necessário

    do {
        # Exibe o menu
        Write-Host "`n========== MENU PRINCIPAL ==========" -ForegroundColor Cyan
        Write-Host " 1 - Versão do Java "
        Write-Host " 2 - Limpar arquivos temporários"
        Write-Host " 0 - Sair"
        Write-Host "=====================================" -ForegroundColor Cyan

        $opcao = Read-Host "`nDigite o número da opção desejada"

        switch ($opcao) {
            '1' {
                Write-Host "Verificar versão do Java" -ForegroundColor Yellow
                & "$pastaScripts\javaVersion.ps1"
            }
            '2' {
                Write-Host "Executando: Limpar arquivos temporários..." -ForegroundColor Yellow
                & "$pastaScripts\LimparTemp.ps1"
            }
            '0' {
                Write-Host "Saindo do programa..." -ForegroundColor Green
                break
            }
            default {
                Write-Host "Opção inválida! Tente novamente." -ForegroundColor Red
                Pause
            }
        }
        Write-Host ""
    } while ($opcao -ne '0')
}

Main