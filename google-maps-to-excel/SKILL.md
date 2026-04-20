---
name: google-maps-to-excel
description: >
  Extracts professional contact lists from Google Maps and exports them to Excel.
  Use this skill whenever the user wants to scrape, extract, or build a list of businesses/professionals
  from Google Maps — even if they just say "liste de [catégorie] à [ville]", "trouve-moi des [X] à [Y]",
  "scrape Google Maps", "extrais depuis Google Maps", or "donne-moi les contacts de [métier] sur [lieu]".
  The skill navigates Google Maps via the Chrome extension, extracts name/address/phone/website for each
  result, and saves a clean .xlsx file. Trigger whenever the user mentions Google Maps + a category + a
  location, or asks for a professional directory/annuaire for a specific trade and geography.
compatibility: "Requires Claude in Chrome extension connected to a Chrome browser."
---

# Google Maps → Excel

## What this skill does

Navigates Google Maps via the Chrome browser extension, extracts a list of professionals/businesses
matching a category and location, retrieves the actual website URL for each listing, and exports
everything to a clean Excel (.xlsx) file.

## Prerequisites

The Chrome extension (Claude in Chrome) must be connected. If `tabs_context_mcp` returns an error,
tell the user to open Chrome and make sure the extension is active.

## Output location

Always save to: `~/Desktop/` or ask the user where to save.
Filename format: `{category}_{location}.xlsx` — lowercase, spaces replaced by underscores.
Example: `expert_comptable_paris6.xlsx`

## Step-by-step process

### Step 1 — Get a browser tab

Call `tabs_context_mcp` (createIfEmpty: true) to get a valid tabId.

### Step 2 — Search Google Maps

Navigate to:
`https://www.google.fr/maps/search/{category}+{location}`

URL-encode spaces as `+`. Example:
`https://www.google.fr/maps/search/expert+comptable+Paris+6`

### Step 3 — Extract the results list

Call `get_page_text`. Google Maps renders results in this pattern:
```
Name [rating](N) Type · Address · Phone · Site Web Itinéraires "quote"
```
Parse each result to extract: Nom, Adresse, Code Postal, Ville, Téléphone, site indicator.

**Scroll for more results**: scroll down and call `get_page_text` again up to 3 times if needed.

### Step 4 — Get individual website URLs

For each result with a website, navigate to its Maps fiche:
`https://www.google.fr/maps/search/{name}+{address}`

The website domain appears just before the phone number in the page text.

### Step 5 — Export to Excel

Install openpyxl if needed: `pip3 install openpyxl --quiet`

Columns: Nom | Adresse | Code Postal | Ville | Téléphone | Site web
- Header: bold white text, blue background (#2E75B6)
- Website cells: blue underlined (#0563C1)
- Auto-adjusted column widths

### Step 6 — Report results

Show a markdown summary table then confirm the saved file path.

## Known limitations

- Pages Jaunes is blocked by the Chrome extension — do not use
- Some small businesses have no Maps fiche → phone/website will be empty
- Google Maps may include results slightly outside the exact area
