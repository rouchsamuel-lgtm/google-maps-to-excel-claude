#!/bin/bash

# Google Maps → Excel — Claude Code Skill Installer
# https://github.com/rouchsamuel-lgtm/google-maps-to-excel-claude

set -e

REPO="rouchsamuel-lgtm/google-maps-to-excel-claude"
RAW="https://raw.githubusercontent.com/$REPO/main"
SKILL_DIR="$HOME/.claude/skills/google-maps-to-excel"

echo ""
echo "📦 Installation du skill Google Maps → Excel"
echo "---------------------------------------------"

# Create directories
mkdir -p "$SKILL_DIR/scripts"

# Download skill files
echo "⬇️  Téléchargement de SKILL.md..."
curl -fsSL "$RAW/google-maps-to-excel/SKILL.md" -o "$SKILL_DIR/SKILL.md"

echo "⬇️  Téléchargement de export_excel.py..."
curl -fsSL "$RAW/google-maps-to-excel/scripts/export_excel.py" -o "$SKILL_DIR/scripts/export_excel.py"

echo ""
echo "✅ Skill installé dans : $SKILL_DIR"
echo ""
echo "👉 Prérequis :"
echo "   1. Installer l'extension Chrome 'Claude in Chrome'"
echo "   2. Relancer Claude Code"
echo ""
echo "🚀 Utilisation : demande à Claude :"
echo "   \"Scrape-moi les kinésithérapeutes à Lyon 3\""
echo "   \"Liste des notaires à Bordeaux sur Google Maps\""
echo ""
