# Create a folder under the drive root
mkdir actions-runner; cd actions-runner


$RUNNER_VERSION="2.298.2"
$RUNNER_ARCHIVE_BASENAME="actions-runner-win-x64-${RUNNER_VERSION}.zip"
# Download the latest runner package
Invoke-WebRequest -Uri https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/$RUNNER_ARCHIVE_BASENAME -OutFile $RUNNER_ARCHIVE_BASENAME
# Optional: Validate the hash
if((Get-FileHash -Path $RUNNER_ARCHIVE_BASENAME -Algorithm SHA256).Hash.ToUpper() -ne '02c11d07fcc453f95fc5c15e11ea911cd0fd56f595bd70f2e8df87f46b2c796a'.ToUpper()){ throw 'Computed checksum did not match' }
# Extract the installer
Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$PWD/$RUNNER_ARCHIVE_BASENAME", "$PWD")