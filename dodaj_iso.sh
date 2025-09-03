#!/bin/bash
# Skrypt do dodania ISO do istniejących maszyn

set -e  # Zatrzymaj przy błędzie

echo "🔍 Sprawdzam aktualną konfigurację..."
grep "iso_path" prod.tfvars

echo "💾 Tworzę backup..."
cp prod.tfvars prod.tfvars.backup.$(date +%Y%m%d_%H%M%S)

echo "📝 Podaj ścieżkę do ISO na datastore (np. iso/ubuntu-22.04.3-desktop-amd64.iso):"
read -r ISO_PATH

if [ -z "$ISO_PATH" ]; then
    echo "❌ Nie podano ścieżki do ISO!"
    exit 1
fi

echo "✏️  Aktualizuję prod.tfvars..."
sed -i "s|iso_path.*=.*\"\"|iso_path         = \"$ISO_PATH\"|" prod.tfvars

echo "🔍 Sprawdzam zmiany..."
terraform plan

echo "❓ Czy chcesz zastosować zmiany? (y/N)"
read -r CONFIRM

if [[ $CONFIRM =~ ^[Yy]$ ]]; then
    echo "🚀 Zastosowuję zmiany..."
    terraform apply -auto-approve
    echo "✅ Gotowe! ISO zostało dodane do wszystkich maszyn."
else
    echo "❌ Anulowano. Przywracam backup..."
    cp prod.tfvars.backup.* prod.tfvars
    echo "🔄 Backup przywrócony."
fi
