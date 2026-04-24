# Validar a versão do Java se é 32 ou 64 Bits;
# Time de central de soluções, orientou que é preciso sempre da versão 32  == X86;

$output = java -XshowSettings:properties -version 2>&1
$versionLine = $output | Select-String "sun.arch.data.model"


if ($versionLine -match "32"){
    Write-Host "Versão 32 Bits (X86) Instalada!" -ForegroundColor Green
    Write-Host "Atende aos requisitos do Time de Central de Soluções!" -ForegroundColor Cyan
} 
elseif ($versionLine -match "64"){
    Write-Host "Versão 64 Bits (X64) Instalada!" -ForegroundColor Yellow
    Write-Host "NÃO atende aos requisitos do Time de Central de Soluções!" -ForegroundColor Red

     do {
        # Exibe o menu
        Write-Host "`n========== MENU PRINCIPAL ==========" -ForegroundColor Cyan
        Write-Host " 1 - Remover Java 64 Bits (X64) e instalar o Java 32 bits (X86)."
        Write-Host " 2 - Manter Java 64 Bits (X64), instalar o Java 32 bits (X86) e definir como padrão."
        Write-Host " 0 - Sair"
        Write-Host "=====================================" -ForegroundColor Cyan

        $opcao = Read-Host "`nDigite o número da opção desejada"

        switch ($opcao) {
            '1' {
                Write-Host "Realizando a remoção " -ForegroundColor Yellow
                & "$pastaScripts\JavaRemoveAndInstall\RemoveX64AndInstallX86.ps1"
            }
            '2' {
                Write-Host "Realizando o procedimento solicitado..." -ForegroundColor Yellow
                & "$pastaScripts\JavaRemoveAndInstall\InstallX86AndSetDefault.ps1"
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
    
} else {
    Write-Host "Não foi identificada nenhuma versão do Java instalada!" -ForegroundColor Red

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
}




Read-Host "`nPressione Enter para continuar"