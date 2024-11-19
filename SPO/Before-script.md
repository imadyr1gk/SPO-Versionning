Avant d'exécuter le script SPO-Versionning.ps1, installez le module PnP.PowerShell et connectez-vous au site : https://tenant-admin.sharepoint.com

Remplacer tenant par le nom de votre tenant

Install-Module PnP.PowerShell -Scope CurrentUser

Import-Module PnP.PowerShell

Avant de se connecter au site SharePoint, il faut enregistrer une application comme suit : 

[Lire la documentation pour l'enregistrement d'une application](https://pnp.github.io/powershell/articles/registerapplication.html)


**Installer le module PnP.PowerShell** en utilisant la commande suivante :
    ```powershell
    Install-Module PnP.PowerShell -Scope CurrentUser
    ```
