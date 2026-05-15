$output = @()
$output += '# Repository Structure'
$output += ''
$output += '```text'

Get-ChildItem -Recurse |
Where-Object {
    $_.FullName -notlike "*\.git\*" -and
    $_.FullName -notlike "*\.venv\*" -and
    $_.FullName -notlike "*\site\*" -and
    $_.FullName -notlike "*\.tmp-mkdocs-*"
} |
Sort-Object FullName |
ForEach-Object {
    $relative = $_.FullName.Replace((Get-Location).Path + "\", "")
    $depth = ($relative -split "\\").Count - 1
    $indent = "    " * $depth
    "$indent- $($_.Name)"
} | ForEach-Object { $output += $_ }

$output += '```'

$output | Out-File repo_tree.md -Encoding utf8