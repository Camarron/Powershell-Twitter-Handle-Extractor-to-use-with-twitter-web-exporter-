$csvPath = "Path to CSV"
$rows    = Import-Csv $csvPath
$pattern = '^RT @(\w+):'
$handles = $rows |
    Where-Object { $_.'full_text' -match $pattern } |
    ForEach-Object { [regex]::Match($_.'full_text', $pattern).Groups[1].Value } |
    Sort-Object -Unique

# Print to console
$handles | ForEach-Object { Write-Host "@$_" }
Write-Host "`nFound $($handles.Count) unique handles"

# Save to text file
$handles | ForEach-Object { "@$_" } | Out-File "rt_handles.txt" -Encoding UTF8
