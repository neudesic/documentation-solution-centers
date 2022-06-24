# Input Parameters & Variables
param([string]$token = '',[string]$branch = 'dev')
$repourl = "https://$token@github.com/neudesic/blogs-data-ai.git"

# Crawl Blogs Content - Start
Write-Output "Starting Crawl Blogs Repo Content Process"

# Clone Blogs Repo - Start
Write-Output "Starting Cloning Blogs Repo: $repourl"
git clone $repourl --branch=$branch --single-branch blogs
Write-Output "Cloning Blogs Repo Completed: $repourl"
# Clone Blogs Repo - End

# Copy Blogs Content - Start
Write-Output "Copying Blogs Content"
if (!(Test-Path -Path .\docs\blogs)) {
    New-Item -ItemType directory -Path .\docs\blogs
}
Copy-Item -Path .\blogs\docs\* -Destination .\docs\blogs -Recurse -Force
Write-Output "Copied Blogs Content"
# Copy Blogs Content - End

# Function to convert a text to title case
function toTitleCase($text) {
    $returnText = $text.replace('-', ' ')
    $TextInfo = (Get-Culture).TextInfo
    $returnText = $TextInfo.toTitleCase($returnText)
    return $returnText
}

# Function to add navigation link
function addNavigationLink($link) {
    Add-Content -Path .\mkdocs.yml -Value $link
}

# Add Blogs Navigation Links - Start
Write-Output "Adding Blogs Navigation Links"
$blogcategories = Get-ChildItem -Directory -Path .\docs\blogs -Recurse -Force | Select-Object -ExpandProperty Name
addNavigationLink("  - Blogs:")
addNavigationLink("    - Home: blogs/index.md")
foreach ($blogcategory in $blogcategories) {
    Write-Output "Blog Category - $blogcategory"
    addNavigationLink("    - $(toTitleCase($blogcategory)):")
    $blogposts = Get-ChildItem -Filter *.md -Path .\docs\blogs\$blogcategory -Recurse -Force | Select-Object -ExpandProperty Name
    foreach ($blogpost in $blogposts) {
        Write-Output "Blog Post - $blogpost"
        addNavigationLink("      - blogs/$blogcategory/$blogpost")
    }
}
Write-Output "Added Blogs Navigation Links"
# Add Blogs Navigation Links - End

Write-Output "Completed Crawl Blogs Repo Content Process"
# Crawl Blogs Content - End