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
} else {
    Write-Host "Não foi identificada nenhuma versão do Java instalada!" -ForegroundColor Red
    Write-Host "Por favor, instale o Java 32 Bits (X86)." -ForegroundColor Yellow
}

Read-Host "`nPressione Enter para continuar"