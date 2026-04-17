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
        Write-Host " 3 - Fazer backup de pasta"
        Write-Host " 4 - Listar processos em execução"
        Write-Host " 5 - Verificar espaço em disco"
        Write-Host " 6 - Reiniciar serviço de spooler"
        Write-Host " 7 - Atualizar políticas de grupo"
        Write-Host " 8 - Executar verificação de rede"
        Write-Host " 9 - Mostrar informações do sistema"
        Write-Host "10 - Abrir pasta de scripts"
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
            '3' {
                Write-Host "Executando: Backup de pasta..." -ForegroundColor Yellow
                & "$pastaScripts\Backup.ps1"
            }
            '4' {
                Write-Host "Executando: Listar processos..." -ForegroundColor Yellow
                & "$pastaScripts\ListarProcessos.ps1"
            }
            '5' {
                Write-Host "Executando: Verificar espaço em disco..." -ForegroundColor Yellow
                & "$pastaScripts\EspacoDisco.ps1"
            }
            '6' {
                Write-Host "Executando: Reiniciar spooler de impressão..." -ForegroundColor Yellow
                & "$pastaScripts\ReiniciarSpooler.ps1"
            }
            '7' {
                Write-Host "Executando: Atualizar políticas de grupo..." -ForegroundColor Yellow
                & "$pastaScripts\AtualizarGP.ps1"
            }
            '8' {
                Write-Host "Executando: Verificação de rede..." -ForegroundColor Yellow
                & "$pastaScripts\VerificarRede.ps1"
            }
            '9' {
                Write-Host "Executando: Informações do sistema..." -ForegroundColor Yellow
                & "$pastaScripts\InfoSistema.ps1"
            }
            '10' {
                Write-Host "Abrindo pasta de scripts..." -ForegroundColor Yellow
                Invoke-Item $pastaScripts
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