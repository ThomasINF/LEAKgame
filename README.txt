INFICON LEAK QUEST — VR Upload Bundle
======================================
Stand: 2026-06-01 / v8 R11

Diese 7 Dateien sind alles, was zum Hochladen auf GitHub Pages /
Netlify / einen lokalen HTTP-Server gebraucht wird.

  index.html                4.7 KB   Landing-Page (4 Modi-Karten)
  iBoost_Game3D_v8.html     413 KB   Hauptspiel (Free Play + VR Quest 3)
  leakquest_campaign.html   419 KB   3-Missionen-Story-Modus
  smartspray.glb           3.3 MB   SmartSpray-3D-Modell
  smartspray_data.js       4.3 MB   SmartSpray als base64 (file://-Fallback)
  ul3000_fab.glb           895 KB   UL3000-3D-Modell
  ul3000_fab_data.js       1.2 MB   UL3000 als base64 (file://-Fallback)

Gesamt ca. 10 MB.

Hochladen:
- GitHub Pages: alle 7 Dateien ins Repo-Root pushen, Pages-Branch auf main.
- Netlify Drop: vr_upload-Ordner als ZIP draggen.
- Lokaler Test: `python -m http.server 8000` im vr_upload-Ordner, dann
  auf der Quest http://<PC-IP>:8000/ im Meta-Browser öffnen.

WICHTIG für VR:
- WebXR braucht HTTPS oder localhost (kein file://).
- Quest 3 Meta-Browser empfohlen.
- Auf der Landing-Page "Free Play" wählen → dort den VR-Knopf klicken.

Coming Soon (nicht in diesem Bundle):
- Ghost Race, Training-Modus — werden später als eigene Dateien
  ergänzt; aktuell sind die Modi NUR im In-Game-Menü von v8 verfügbar.
