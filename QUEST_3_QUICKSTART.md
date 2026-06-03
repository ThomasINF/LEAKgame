# Quest 3 — Quickstart fuer den ersten Leak-Hunter-Test

**Stand:** 2026-05-27 · **Zielgeraet:** Meta Quest 3 (Software v68+)

---

## In 60 Sekunden zum VR-Spiel

1. **Server starten** — `start_server.bat` im Projekt-Ordner doppelklicken.
   Konsole zeigt eine Zeile wie `http://192.168.x.x:8000/iBoost_Game3D.html`.
   *Beim ersten Mal: Windows-Firewall-Dialog → "Heimnetzwerk zulassen".*

2. **IP merken** — die `192.168.x.x`-Adresse aus dem Konsolenfenster.
   (Mehrere Eintraege? Die mit `192.168.` ist meistens die richtige.
   `10.x.x.x` oder `172.x.x.x` gehen auch, je nach Router.)

3. **Quest 3 aufsetzen** und sicherstellen, dass das Headset **im gleichen WLAN
   wie der PC** ist (Settings -> Wi-Fi).

4. **Meta-Browser oeffnen** (das Globus-Icon im Universal-Menue).

5. **URL eingeben:** `http://192.168.x.x:8000/iBoost_Game3D.html`
   (Deine Adresse aus Schritt 2.) Enter druecken.

6. **Lade-Screen abwarten** — Three.js + GLB-Assets brauchen 5–15 Sekunden.

7. **Orangenen Button "🥽 VR starten (Quest)"** klicken
   (mit dem Hand-Cursor des Browsers / Trigger).

8. **Permissions akzeptieren** — Quest fragt einmalig nach VR-Modus,
   ggf. nach Hand-Tracking.

9. **Onboarding folgen** — vier Banner erscheinen automatisch:
   *Trigger / Teleport / Snap-Turn / Wrist-Tablet*.
   A-Knopf (rechts) oder rechter Pinch zum Weiter.

10. **Spielen!**
    - Rechter Trigger = SmartSpray spruehen
    - Linker Stick + loslassen = Teleport
    - Rechter Stick (links/rechts) = Snap-Turn
    - Linker Grip = Pause-Menue

---

## Wenn etwas nicht klappt — Checklist

| Symptom | Ursache / Fix |
|---|---|
| **"Seite kann nicht geladen werden"** | PC und Quest nicht im selben WLAN — pruefen. |
| **Seite laedt, aber 🥽-Button macht nichts** | F12-Konsole im PC-Browser oeffnen (vor dem Aufsetzen): muss `[VR3] integration loaded` ausgeben. Wenn nicht: JS-Fehler — Screenshot machen. |
| **`Immersive VR nicht unterstuetzt`** | URL faengt mit `http://192.168.…` an? `file://` und externe Domains werden vom Quest-Browser blockiert. |
| **Schwarzer Screen in VR** | Passthrough versehentlich aktiv. Linker Grip → "Passthrough"-Button im Menue. |
| **Spieler steht im Boden / schwebt** | Reference-Space-Fallback hat zugeschlagen. F12-Konsole zeigt `[VR3][diag] requiredFeatures local-floor abgelehnt`. Quest-Boundary neu kalibrieren (Quest-Menu -> "Stationary boundary"). |
| **Snap-Turn dreht 2x** | Sollte nicht passieren. Falls doch: F12 → `[VR3] integration loaded`-Log pruefen. |
| **Audio bleibt stumm** | 🥽-Button **muss** mit Trigger geklickt werden (User-Gesture fuer AudioContext). Falls Stumm bleibt: Pause auf-und-zu. |
| **Schlechte FPS** | F3 (am PC) zeigt Render-Stats. In VR: Pause → "Foveation: high", "Quality: low". |
| **Haende fehlen** | Quest-Settings → Hand-Tracking auf "Auto". Controller weglegen, kurz warten. |

---

## Was die F12-Konsole verraet (PC-Browser, **vor** dem 🥽-Klick auf)

Das Spiel loggt jetzt diagnostische Zeilen mit Prefix `[VR3][diag]`:

```
[VR3][diag] user-agent: Mozilla/5.0 … OculusBrowser/…
[VR3][diag] isQuest detection: true
[VR3][diag] immersive-vr supported: true
[VR3][diag] framebuffer scale set: 1.2
[VR3][diag] environmentBlendMode: opaque
[VR3][diag] enabledFeatures: [local-floor, hand-tracking, layers]
[VR3][diag] supported reference spaces: { viewer: true, local: true, local-floor: true, … }
[VR3][diag] supportedFrameRates: [72, 80, 90, 120]
[VR3][diag] target frame rate set to 120 Hz
[VR3][diag] FULL SNAPSHOT: { … }
```

Wenn etwas fehlt oder als `false` zurueckkommt → Screenshot der Konsole machen
und fuer die naechste Session aufheben.

Im Quest-Browser selbst lassen sich diese Logs ueber `chrome://inspect/#devices`
am PC anzeigen (USB-Debugging muss in Quest-Settings einmalig erlaubt werden).

---

## F3 Debug-Overlay (PC-Browser)

Beim normalen Desktop-Test zeigt **F3** ein kleines Overlay mit:

- live FPS (5 Hz refresh)
- `renderer.info.render.calls / triangles / points / lines`
- aktive `programs` (Shader)
- `geometries` / `textures`

Im VR sieht man das Overlay nicht — daher die Konsolen-Diagnose oben.
Vor dem VR-Start einmal mit F3 nachsehen, ob die Werte plausibel sind
(Calls < 400, Triangles < 1.5 M).

Programmatisch toggeln: `window.toggleDebugOverlay(true)` in der Konsole.

---

## Reihenfolge der ersten Test-Session — empfohlen

1. Erstmal **Desktop-Run** (5 Min): F3 druecken, Frame-Stats pruefen, einmal
   sicherstellen dass die Konsole keine Fehler wirft.
2. **`start_server.bat` starten**, IP aufschreiben.
3. **Quest aufsetzen**, Browser, URL, 🥽-Button, Onboarding.
4. **Free Play** ein paar Minuten — pruefen ob Locomotion stimmt
   (Teleport zielt mit linker Hand, Snap mit rechter), ob die Pistole
   am Trigger ansaeuselt, ob Helican-Pickup haptisch fuehlbar ist.
5. **Pause-Menue** auftesten (linker Grip): durch alle 9 Buttons mit dem
   Laser-Pointer klicken.
6. **Falls alles laeuft:** Training Level 1 starten (Pause → Spectator? Nein:
   im Quest Menue ist das nicht direkt. Stattdessen VR verlassen, Desktop
   "Training" → Level 1, dann wieder 🥽-Button.)
7. **Diagnostik exportieren:** Quest absetzen, am PC F12 oeffnen, alle
   `[VR3][diag]`-Zeilen kopieren → in eine Text-Datei `quest_test_<datum>.txt`.

---

## Bekannte Quest-3-Quirks (wichtig fuer den ersten Lauf)

- **`session.updateTargetFrameRate(120)`** funktioniert ab Quest-Software v68.
  Aelter? Fallback auf 90 oder Default — wird automatisch geloggt, kein Crash.
- **Passthrough** zeigt aktuell nur ein "Backdrop-Verstecken"-Simulat, kein
  echtes Camera-Feed. Fuer echtes Passthrough braucht es das
  `plane-detection`-Feature (Phase-4-Ausbau).
- **WebXR ueber `file://` geht NICHT** — der `start_server.bat`-Weg ist Pflicht.
- **Hand-Tracking** uebernimmt automatisch sobald Controller liegengelassen
  werden. Re-Aktivierung: Controller wieder aufheben.

---

## Tabellen-Spickzettel — Quest-3-Controller

| Knopf | Wirkung |
|---|---|
| Rechter Trigger | Spray / A-Button im Menue |
| Rechter Stick (links/rechts) | Snap-Turn |
| Rechter Stick (vor/zurueck) | Smooth-Walk (wenn aktiv) |
| Rechter A | Onboarding weiter / Menue-Klick |
| Rechter B | Reset Spawn |
| Rechter Grip | Hint-Ringe 5 s |
| Linker Stick (halten) | Teleport zielen |
| Linker Stick (loslassen) | Teleport ausfuehren |
| Linker Trigger | iBoost-Stufe wechseln |
| Linker Grip | Pause-Menue Toggle |
| Linker / Rechter Pinch | wie Trigger (Hand-Mode) |

---

**Bei Problemen:** F12-Konsole-Screenshot + `[VR3][diag]`-Output —
das ist die schnellste Diagnose.
