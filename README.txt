INFICON LEAK QUEST — Quest/VR Upload Bundle
============================================
Stand: 2026-06-01 / Quest Edition + v8 R14

Diese 9 Dateien sind alles, was zum Hochladen auf GitHub Pages /
Netlify / einen lokalen HTTP-Server gebraucht wird.

  index.html                5.4 KB   Landing-Page (4 Modi)
  iBoost_Game3D_v8.html     415 KB   Hauptspiel Desktop (Browser, Maus+WASD)
  iBoost_Game3D_Quest.html  432 KB   *** EMPFOHLEN für Meta Quest 3 ***
  iBoost_Game3D_VR.html     390 KB   Experimenteller WebXR-Versuch
  leakquest_campaign.html   419 KB   3-Missionen-Story-Modus
  smartspray.glb           3.3 MB
  smartspray_data.js       4.3 MB
  ul3000_fab.glb           895 KB
  ul3000_fab_data.js       1.2 MB

Gesamt ca. 11 MB.


EMPFOHLEN auf der Quest 3:
==========================
Die Quest-Edition (grüne Karte auf der Landing-Page) ist die zuverlässige
Wahl. Sie nutzt KEIN WebXR — das Spiel läuft im normalen Quest-Browser
als 2D-Fläche (so wie ein großer Monitor), und die Bedienung erfolgt
über On-Screen-Joysticks, die du mit dem Controller-Pointer "anpacken"
kannst:

  Linker Joystick (unten links)   → laufen / strafen
  Rechter Joystick (unten rechts) → umsehen (yaw + pitch)
  SPRAY-Button                    → SmartSpray auslösen
  HINT-Button (oben mitte)        → Lecks 5s anzeigen
  iBOOST-Button (oben mitte)      → Stufe weiterschalten
  PAUSE-Button (oben mitte)       → Esc

Beide Quest-Controller können gleichzeitig gehalten werden — der eine
zeigt auf den linken Joystick, der andere auf den rechten. So spielt
es sich wie ein Mobile-Game mit zwei Daumen, nur mit Laser-Pointern.

Falls du eine Bluetooth-Tastatur an die Quest gekoppelt hast, kannst
du auch normal mit WASD + Maus spielen.


VR Edition v1 (experimentell, NICHT empfohlen):
===============================================
Das ist der echte WebXR-Stereo-Versuch. Auf manchen Builds funktioniert
das stabil, auf anderen kommt es zu Rendering-Glitches (überlagerte
Bilder, Flackern, keine Bewegung). Stand 1.6. eher instabil — die
Quest Edition oben ist der zuverlässige Weg.


Hochladen:
==========
- GitHub Pages: alle 9 Dateien ins Repo-Root pushen, Pages-Branch auf main.
- Netlify Drop: vr_upload-Ordner als ZIP draggen.
- Lokaler Test: `python -m http.server 8000` im vr_upload-Ordner, dann
  auf der Quest http://<PC-IP>:8000/ im Meta-Browser öffnen.


Verifikation nach dem Upload:
=============================
1. Landing-Page öffnen → 4 Karten sichtbar
2. "🎮 Quest Edition" anklicken
3. Auf dem Startbildschirm muss das GRÜNE Badge stehen:
   "🎮 QUEST EDITION · 2026-06-01"
4. Auf "🎮 Start Quest" klicken → Joysticks erscheinen unten links + rechts
5. Mit dem Quest-Controller-Pointer auf den linken Joystick zeigen,
   ziehen → du läufst.
