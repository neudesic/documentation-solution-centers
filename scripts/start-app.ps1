Write-Host "Python Check for Upgrades"
python -m pip install --upgrade pip
Write-Host "Python Version"
python -m pip --version
Write-Host "Install Python Build"
python -m pip install build
Write-Host "Install MkDocs"
python -m pip install mkdocs==1.2.3
Write-Host "Install MkDocs Material Theme"
python -m pip install git+https://github.com/neudesic/material-for-mkdocs-insiders
Write-Host "Install MkDocs Extensions"
python -m pip install pymdown-extensions==9.1
python -m pip install mkdocs-ezlinks-plugin==0.1.11
python -m pip install mdx_truly_sane_lists==1.2
Write-Host "Serve MkDocs"
mkdocs serve --config-file mkdocs.insiders.yml