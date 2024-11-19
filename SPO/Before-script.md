# Instructions d'installation et de connexion

Avant d'exécuter le script `SPO-Versionning.ps1`, vous devez :

1. **Installer le module PnP.PowerShell** en utilisant la commande suivante :
    ```powershell
    Install-Module PnP.PowerShell -Scope CurrentUser
    ```

2. **Importer le module** avec la commande :
    ```powershell
    Import-Module PnP.PowerShell
    ```

3. **Avant de vous connecter au site SharePoint, vous devez enregistrer une application Azure AD**. Pour ce faire, suivez les instructions détaillées ici :
    [Lire la documentation pour l'enregistrement d'une application](https://pnp.github.io/powershell/articles/registerapplication.html)

4. **Se connecter au site SharePoint** à l'URL suivante ( en remplaçant tenant par le nom de votre tenant et en ajoutant le clientID de l'application enregistré):
    ```powershell
    Connect-PnPOnline -Url "https://tenant-admin.sharepoint.com" -Interactive -ClientId "xxxxxxx-xxxxxx-xxxxxxx"
    ```
