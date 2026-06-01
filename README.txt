INFICON LEAK QUEST · VR-TEST-MATRIX
====================================
Stand: 2026-06-01 Abend

ZIEL: Funktionierendes VR-Erlebnis auf Meta Quest 3 finden.
Vorheriges Problem: Bild flackert / schwarze Balken sobald linker
Stick zum Laufen genutzt wird → Foveated-Rendering-Artefakt.


TESTANLEITUNG MORGEN FRÜH (in dieser Reihenfolge):
==================================================

Schritt 1: 🔬 Diagnose v3 (5 Sekunden Test)
-------------------------------------------
Auf der Landing-Page: "Test v3 — Foveation-Fix" anklicken.
START → linker Stick bedienen, schauen ob sauber läuft.

  ✅ Wenn läuft → weiter zu Schritt 2 (Spiel v2)
  ❌ Wenn flackert → weiter zu Schritt 3

Schritt 2: 🛠️ Spiel mit v2-Fixes (kompletter Test)
--------------------------------------------------
"Spiel — VR v2" anklicken. Hat alle Diagnose-v3-Fixes drin plus das
vollständige Spiel (Lecks, Score, Wrist-Tablet, alles).

Schritt 3: 🔬 Diagnose v4 — Teleport-only
-----------------------------------------
Falls Smooth-Walking das Problem war, ist Teleport-only der Workaround.
Linker Stick = Teleport-Bogen, loslassen = Sprung an die Stelle.

  ✅ Wenn läuft → ich baue dir morgen ein Spiel mit Teleport-only
  ❌ Wenn auch flackert → Schritt 4

Schritt 4: 🚀 Diagnose v5 — Three.js r160
------------------------------------------
3 Jahre neuere Bibliothek mit vielen Quest-Bugfixes.

  ✅ Wenn läuft → "Spiel — VR r160" testen, das ist der Goldstandard
  ❌ Wenn auch flackert → Schritt 5

Schritt 5: 🔬 Diagnose v6 — refSpace-Offset
-------------------------------------------
Alternative Locomotion-Methode (XRRigidTransform statt dolly.position).
Echter WebXR-Standard-Pattern.

  ✅ Wenn läuft → ich baue Spiel-Version damit
  ❌ Wenn auch flackert → ALLE WebXR-Pfade gescheitert → Schritt 6

Schritt 6: Wolvic-Browser
-------------------------
Im Meta Store nach "Wolvic" suchen, kostenlos installieren.
Wolvic ist eine alternative WebXR-Implementierung (Open Source).
Quest-Browser hat dokumentierte Bugs in Horizon OS v83+.
In Wolvic die Landing-Page öffnen und Tests v3/v4/v5/v6 NOCHMAL probieren.


DATEIEN IM BUNDLE (15 Stück):
=============================
  index.html                       — Landing-Page mit Test-Matrix

  Spielbare Versionen:
  iBoost_Game3D_v8.html             Desktop (Maus+WASD)
  iBoost_Game3D_Quest.html          Quest 2D mit On-Screen-Joysticks
  iBoost_Game3D_VR.html             VR v1 (alt, Referenz)
  iBoost_Game3D_VR_v2.html          VR v2 mit Foveation-Fix
  iBoost_Game3D_VR_r160.html        VR mit Three.js r160
  leakquest_campaign.html           Campaign-Modus

  Diagnose-Tests (10 KB jeweils):
  vr_minimal_test.html              v1 (alt)
  vr_minimal_test_v2.html           v2 (schwarz, alt)
  vr_minimal_test_v3.html           v3 Foveation-Fix
  vr_minimal_test_v4.html           v4 Teleport-only
  vr_minimal_test_v5.html           v5 Three.js r160
  vr_minimal_test_v6.html           v6 refSpace-Offset

  Assets:
  smartspray.glb + smartspray_data.js
  ul3000_fab.glb + ul3000_fab_data.js

Gesamt ca. 11.5 MB.


WICHTIG:
========
• Quest-Browser hat einen dokumentierten Schwarzbild-Bug in Horizon OS v83
  (Stand Januar 2026). Falls deine Quest dieses OS hat, könnte das die
  Ursache sein. Wolvic umgeht das.

• Bei jedem Test in der Konsole (Quest-Browser → Menü → DevTools)
  nach Logs mit "[v3]", "[v4]" usw. schauen — die zeigen genau wo's klemmt.

• Cache-Bust: ?v=irgendwas an die URL anhängen falls alte Version geladen wird.
