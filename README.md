# ExactHours

Register your hours in plain text files.

## Usage

### 1. Maak week bestand

Maak een weekbestand aan met de naam week.jjjj.ww.yml. vervang jjjj met
2015 en wk met het weeknummer. De naam van het bestand mag niet anders
zijn.

### 2. clients bestand

Zorg dat in het weekbestand een clients mapping bestand aanwezig is. Dit
bestand heet ```clients``` en bevat alle klanten met hun id's space
gescheiden. A la een ```hosts``` bestand.

```
7517	ACTIAM
7519	VERDERINT
7520	CCV
7521	ABS
7523	DASSLR
7456	LLP
```

### 3. Registreer je uren in YAML

Houdt je uren van de week bij op de volgende manier:

```yaml
---
  employee: 5
  days:
    Monday:
      - qty: 2.0
        client: DASSLR
        type: tech_quote
        note: aanbieden offerte

    Tuesday:
      - qty: 4.0
        client: VERDER
        type: tech_sysadmin
        note: deployments fixen testplan (sla website)
        project: VERDER-2015

      - qty: 1.0
        client: BUWA
        type: tech_quote
        note: overleg over offerte servoy;

      - qty: 1.0
        client: BUWA
        type: tech_consult
        note: advies intranet, advies netwerk
```

hanteer de volgende uursoorten:
```
# tech_consult
# tech_support
# tech_design
# tech_dev
# tech_sysadmin
# tech_edu
# tech_quote
```

### 4. Draai eind van de week in de terminal het exact_hours commando

```bash
exact_hours prepare_for_import ~/Desktop/Uren\ hervorming\ Exact/weekimports/week.2015.45.yml
```

### 5. Importeer de uren in exact

- klik op LLP linksboven in het nieuwe menu
- klik op import/export
- klik op CSV/Excel
- klik op Project -> Tijd
- kies ```Anders gescheiden waarden``` tenzij je al een eigen definitie
  hebt gemaakt
- na succesvolle import moeten ze nog worden ingediend

## TODO

- [ ] bulk export van meerdere lijstjes
- [ ] kan kim ieders deze lijst importeren?


## Installation

$ gem install exact_hours
