# Google Maps → Excel — Claude Code Skill

Extrait automatiquement des listes de professionnels depuis Google Maps et les exporte en Excel, directement depuis Claude Code.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/rouchsamuel-lgtm/google-maps-to-excel-claude/main/install.sh | bash
```

Puis **relancer Claude Code**.

## Utilisation

Une fois installé, demande simplement à Claude :

> "Scrape-moi les experts-comptables à Paris 6"
> "Donne-moi une liste de kinésithérapeutes à Lyon 3"
> "Extrais depuis Google Maps les notaires à Bordeaux"

Claude navigue sur Google Maps, extrait les contacts et sauvegarde un fichier Excel automatiquement.

## Résultat

| Colonne | Exemple |
|---------|---------|
| Nom | Cabinet Charles Lefebvre |
| Adresse | 54 Bd Saint-Michel |
| Code Postal | 75006 |
| Ville | Paris |
| Téléphone | +33 1 43 26 57 82 |
| Site web | https://cabinet-lefebvre.fr |

## Prérequis

- [Claude Code](https://claude.ai/code)
- Extension Chrome [Claude in Chrome](https://chromewebstore.google.com) connectée

## Désinstallation

```bash
rm -rf ~/.claude/skills/google-maps-to-excel
```

## Licence

MIT
