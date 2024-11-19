# Récupérer la liste des sites SharePoint (si vous devez récupérer les sites depuis un tenant)
# Cette commande nécessite des droits d'administrateur global ou administrateur SharePoint dans votre tenant.
$sites = Get-PnPTenantSite 

# Initialiser un tableau pour stocker les informations des sites
$versioningData = @()

# Boucle pour traiter chaque site
foreach ($site in $sites) {
    # Connexion à chaque site
    #Connect-PnPOnline -Url $site.Url -UseWebLogin

    # Récupérer les informations de versioning pour chaque liste de ce site
    $lists = Get-PnPList
    foreach ($list in $lists) {
        # Vérifier si la liste a des paramètres de versioning activés
        if ($list.EnableVersioning) {
            $versioningData += [PSCustomObject]@{
                SiteUrl          = $site.Url
                ListTitle        = $list.Title
                VersioningEnabled = $list.EnableVersioning
                MajorVersions    = $list.MajorVersionLimit
                MinorVersions    = $list.MajorWithMinorVersionsLimit
                DraftItemSecurity = $list.DraftVersionVisibility
                ContentApprovalRequired = $list.EnableModeration
                CheckoutRequired = $list.ForceCheckout
            }
        }
    }

    # Récupérer la taille du site
    $siteSize = (Get-PnPTenantSite -Identity $site.Url).StorageUsage

    # Ajouter la taille du site aux données
    $versioningData += [PSCustomObject]@{
        SiteUrl          = $site.Url
        SiteSizeMB       = $siteSize
        ListTitle        = "Site Size"
        VersioningEnabled = $null
        MajorVersions    = $null
        MinorVersions    = $null
        DraftItemSecurity = $null
        ContentApprovalRequired = $null
        CheckoutRequired = $null
    }
}

# Exporter les données vers un fichier CSV
$versioningData | Export-Csv -Path "C:\SharePointVersioningReport22.csv" -NoTypeInformation

Write-Host "Rapport généré avec succès : C:\SharePointVersioningReport22.csv"
