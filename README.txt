INFICON LEAK QUEST — VR Upload Bundle
======================================
Stand: 2026-06-01 / v8 R14 + VR EDITION v1

Diese 8 Dateien sind alles, was zum Hochladen auf GitHub Pages /
Netlify / einen lokalen HTTP-Server gebraucht wird.

  index.html                4.9 KB   Landing-Page (4 Modi-Karten)
  iBoost_Game3D_v8.html     415 KB   Hauptspiel Desktop + altes VR
  iBoost_Game3D_VR.html     390 KB   *** NEUE eigene VR-Edition v1 ***
  leakquest_campaign.html   419 KB   3-Missionen-Story-Modus
  smartspray.glb           3.3 MB   SmartSpray-3D-Modell
  smartspray_data.js       4.3 MB   SmartSpray als base64 (file://-Fallback)
  ul3000_fab.glb           895 KB   UL3000-3D-Modell
  ul3000_fab_data.js       1.2 MB   UL3000 als base64 (file://-Fallback)

Gesamt ca. 10 MB.


WICHTIG für die Quest 3:
========================
1. Im Quest-Browser auf die GitHub-Pages-URL gehen.
2. Auf der Landing-Page die GRÜNE Karte "🥽 VR Edition v1" anklicken
   (nicht die blaue "Free Play (Desktop)"!).
3. Auf dem Startbildschirm sollte ein großes grünes Badge stehen:
   "🥽 VR EDITION v1 · 2026-06-01"
   Wenn das fehlt → der Upload ist nicht durchgekommen, ?v=2 anhängen
   oder Browser-Cache leeren.
4. Auf "🥽 Start VR (Quest)" klicken.
5. Beim Eintritt in VR muss als erstes ein 3D-Banner schweben:
   "🥽 VR EDITION v1 — Build OK"
   Wenn ja: alles richtig deployed.

Bedienung in VR Edition v1:
  Linker Stick     = Laufen (Smooth Walk)
  Rechter Stick X  = Snap-Turn (30° pro Push)
  Rechter Trigger  = SmartSpray sprühen
  Rechter Grip     = Hint-Ringe (zeigt alle Lecks 5s lang)
  Rechter A-Button = Spawn-Reset (zurück vor die Kammer)
  Linker Trigger   = iBoost-Stufe wechseln
  Linker Grip      = Walk ↔ Teleport umschalten

Wrist-Tablet (linker Arm):
  Zeigt Score, Lecks X/Y, Helium-Background, Helican-Patronen,
  iBoost-Level, aktuelle Leckrate und ggf. Cheat-Indikatoren.


Hochladen:
==========
- GitHub Pages: alle 8 Dateien ins Repo-Root pushen, Pages-Branch auf main.
- Netlify Drop: vr_upload-Ordner als ZIP draggen.
- Lokaler Test: `python -m http.server 8000` im vr_upload-Ordner, dann
  auf der Quest http://<PC-IP>:8000/ im Meta-Browser öffnen.

Coming Soon (nicht in diesem Bundle):
- Ghost Race, Training-Modus als eigene Dateien (sind aktuell nur
  im In-Game-Menü von v8 verfügbar).
