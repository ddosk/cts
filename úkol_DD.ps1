$page = Invoke-WebRequest -Uri "https://www.cts-tradeit.cz/kariera/"
$pozice = $page.ParsedHtml.getElementsByTagName("div") | Where-Object {$_.className -eq "row row-cols-1 row-cols-md-2 row-cols-xl-2 card-links row-xl mt-lg-4 mb-3 mb-lg-4"}

$titles = ($pozice.getElementsByTagName('h3') | Where-Object { $_.className -eq 'card-title mb-0' }).innerText
$titles | Out-File titles.txt -Force

$links = ($pozice.getElementsByTagName('a') | Where-Object { $_.className -eq 'card card-lg card-link-bottom' }).ie8_href.replace("about:/","https://www.cts-tradeit.cz/")
$links | Out-File link.txt -Force

$titles
Write-Host "`n"

$links
Write-Host "`n"

Read-Host -Prompt "Press Enter to exit"