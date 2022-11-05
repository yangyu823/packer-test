# Enable choco allow Global Confirmation
choco feature enable -n=allowGlobalConfirmation

# Add artifactory remote source
choco source add -n=artifactory -s'https://artifactory.gcp.anz/artifactory/chocolatey' --priority=1

# Test install 7zip
choco install 7zip