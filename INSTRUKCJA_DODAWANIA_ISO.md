# Instrukcja: Dodanie ISO do istniejących maszyn wirtualnych

## Krok 1: Sprawdź aktualny stan (OPCJONALNE)
```bash
cd /home/marek/CODE/vmtof
terraform show
```

## Krok 2: Zrób backup konfiguracji
```bash
cp prod.tfvars prod.tfvars.backup
```

## Krok 3: Edytuj prod.tfvars - dodaj ścieżkę do ISO
Zmień linię:
```
iso_path         = ""
```
Na przykład:
```
iso_path         = "iso/ubuntu-22.04.3-desktop-amd64.iso"
```

## Krok 4: Sprawdź co się zmieni (DRY RUN)
```bash
terraform plan
```

Oczekiwany rezultat:
```
Plan: 0 to add, 5 to change, 0 to destroy.

Changes to Outputs:
  # vsphere_virtual_machine.cloned_vm[0] will be updated in-place
  ~ resource "vsphere_virtual_machine" "cloned_vm" {
        id   = "vm-12345"
        name = "cloned0.example.com.pl"
        # (inne atrybuty...)

      + cdrom {
          + datastore_id = "datastore-67890"
          + path         = "iso/ubuntu-22.04.3-desktop-amd64.iso"
        }
    }
  
  # (podobnie dla pozostałych 4 maszyn...)
```

## Krok 5A: Test na jednej maszynie (ZALECANE)
```bash
# Zmodyfikuj tylko pierwszą maszynę jako test
terraform apply -target=vsphere_virtual_machine.cloned_vm[0]
```

## Krok 5B: Zastosuj zmiany na wszystkich maszynach
```bash
terraform apply
```

## Krok 6: Sprawdź rezultat
```bash
terraform show | grep cdrom
```

## Co się stanie podczas apply:
1. ⏸️  Terraform zatrzyma każdą maszynę
2. 💿 Doda CD-ROM z ISO
3. ▶️  Uruchomi maszynę ponownie
4. 🔄 Maszyna wystartuje z ISO w CD-ROM

## Czas downtime:
- ~2-5 minut na maszynę
- Maszyny restartują się jedna po drugiej

## Rollback (jeśli coś pójdzie nie tak):
```bash
# Przywróć poprzednią konfigurację
cp prod.tfvars.backup prod.tfvars
terraform apply
```
