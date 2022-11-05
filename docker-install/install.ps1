# Setup Docker source file address
$URL = 'https://download.docker.com/components/engine/windows-server/19.03/docker-19.03.3.zip'

# Download Docker source file.
invoke-webrequest -UseBasicparsing -Outfile docker-19.03.3.zip -Uri $URL

# Install Docker. This requires rebooting.
Install-WindowsFeature containers | Out-Null

# Extract the archive.
Expand-Archive docker-19.03.3.zip -DestinationPath $Env:ProgramFiles -Force

# Clean up the zip file.
Remove-Item -Force docker-19.03.3.zip