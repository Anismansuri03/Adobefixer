# Define the path to the Adobe Photoshop executable
$photoshopPath = "C:\Program Files\Adobe\Adobe Photoshop 2023\Photoshop.exe"

# Ensure the executable path exists
if (Test-Path $photoshopPath) {
    # Block outgoing connections for Adobe Photoshop
    New-NetFirewallRule -DisplayName "Block Adobe Photoshop Outbound" -Direction Outbound -Program $photoshopPath -Action Block -Profile Any

    # Block incoming connections for Adobe Photoshop
    New-NetFirewallRule -DisplayName "Block Adobe Photoshop Inbound" -Direction Inbound -Program $photoshopPath -Action Block -Profile Any

    Write-Output "Firewall rules to block Adobe Photoshop have been added."
} else {
    Write-Output "Adobe Photoshop executable not found at the specified path: $photoshopPath"
}
