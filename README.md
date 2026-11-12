<table border="0">
<tr>
<td width="170" valign="top">
  <img src="logo.png" alt="Logo Traducción Packet Tracer ES" width="150">
</td>
<td valign="top">

# 🌐 Traducción de Cisco Packet Tracer 9.0.1.0858 al Español

**Informe técnico:** Limitaciones de internacionalización en Cisco Packet Tracer 9.0.1.0858

**Versión analizada:** `9.0.1.0858`

**Idioma de destino:** Español (castellano)

**Método de trabajo:** Traducción desde `template.ts` oficial → compilación con `linguist.exe` (Qt 6.8.7) → `.ptl` → prueba en Packet Tracer

</td>
</tr>
</table>
---

## 📑 Tabla de contenidos

- [📦 Requisitos de instalación](#-requisitos-de-instalación)
- [📥 Descarga e instalación](#-descarga-e-instalación)
- [📂 Ubicación de los archivos instalados](#-ubicación-de-los-archivos-instalados)
- [⚙️ Cómo activar la traducción](#️-cómo-activar-la-traducción)
- [🛠️ Problemas comunes](#️-problemas-comunes)
- [👥 Créditos](#-créditos)
- [1. Resumen](#1-resumen)
- [2. Casos resueltos con éxito](#2-casos-resueltos-con-éxito)
  - [2.1. Categorías de dispositivos en CDeviceTypesBox](#21-categorías-de-dispositivos-en-cdevicetypesbox)
  - [2.2. Accessibility en el menú Ayuda](#22-accessibility-en-el-menú-ayuda)
  - [2.3. Colores en CAdministrativeOptionsBase](#23-colores-en-cadministrativeoptionsbase)
  - [2.4. Botones estándar de Qt (OK / Yes / No / Cancel / Close)](#24-botones-estándar-de-qt-ok--yes--no--cancel--close)
- [3. Casos no traducibles (limitaciones de Cisco)](#3-casos-no-traducibles-limitaciones-de-cisco)
  - [3.1. Tooltips de categorías de dispositivos](#31-tooltips-de-categorías-de-dispositivos)
  - [3.2. Nombres de cables](#32-nombres-de-cables)
  - [3.3. Checkbuttons del gestor de plantillas](#33-checkbuttons-del-gestor-de-plantillas-cbasedevicetemplatemanager)
  - [3.4. Archivos .ptd en la carpeta templates](#34-archivos-ptd-en-la-carpeta-templates)
- [4. Contextos que deben repetirse (inyección multi-contexto)](#4-contextos-que-deben-repetirse-inyección-multi-contexto)
- [5. Peticiones concretas a Cisco](#5-peticiones-concretas-a-cisco)
- [6. Conclusión](#6-conclusión)

---

## 📦 Requisitos de instalación

- Tener instalada la versión **Cisco Packet Tracer v9.0.1.0858**.

## 📥 Descarga e instalación

En la sección de **Releases** de este repositorio encontrarás dos opciones de instalación:

### Opción A — Instalador completo (recomendado)

- **Archivo:** `TraduccionPacketTracerES-v9.0.1.0858_v1.0.exe`
- **Tipo:** Instalador generado con **Inno Setup**.
- **Qué instala:**
  - El archivo `Spanish_es.ptl` en `[Carpeta de PT]\languages\`.
  - Los archivos de créditos y léeme (`CREDITOS.txt`, `LEEME.txt`).
  - **Toda la ayuda web en HTML** en las carpetas de PT que tienen copia en inglés (`[Carpeta PT]\help\Spanish_es\`).
- **Requisitos:** Ejecutar como administrador.

### Opción B — Solo el archivo `.ptl` (ligero)

- **Archivo:** `instalar_traduccion_es.bat` (script de PowerShell).
- **Qué instala:** Únicamente el archivo `Spanish_es.ptl` en `[Carpeta de PT]\languages\`.
- **Requisitos:** Ejecutar como administrador.
- **Nota:** No instala la ayuda web en HTML.

## 📂 Ubicación de los archivos instalados

- `Spanish_es.ptl` → `[Carpeta de PT]\languages\`
- `CREDITOS.txt` → `[Carpeta de PT]\languages\`
- `LEEME.txt` → `[Carpeta de PT]\languages\`

**Carpeta de Ayuda web**

- `[Carpeta PT]\help\Spanish_es\`

## ⚙️ Cómo activar la traducción

1. Abra Cisco Packet Tracer.
2. Vaya a **Options > Preferences**.
3. En la pestaña **"Interface"**, apartado **"Select Language"**, seleccione `Spanish_es.ptl` como idioma.
4. Pulse el botón **"Change Language"**.
5. Reinicie Packet Tracer.

## 🛠️ Problemas comunes

- Si la traducción no aparece, verifique que el archivo esté en la carpeta `languages`.
- Asegúrese de tener permisos de escritura en la carpeta de instalación. Ejecute el instalador con privilegios de administrador.
- Hay problemas ajenos a la traducción al castellano. Algunos botones y/o cadenas de texto puede que no se puedan traducir. Es un problema de la interfaz de traducción del software de creación de PT.
- Los colores de fuentes de texto y fondo de la CLI no pueden ser traducidos. PT no es capaz de gestionar la traducción de los mismos. Por eso se han dejado a propósito en su versión original (en versiones anteriores puede provocar problemas, ya que están traducidos).

---

## 👥 Créditos

### Traductores principales del archivo `Spanish_es.ptl`

- **J.C. Rico** — Coordinación y traducción técnica, revisión y correcciones y scripts de fusión e instalación.
- **S. Alcaráz** — Traducción técnica, revisiones y correcciones.
- **R. Gombao** — Traducción técnica, revisiones y correcciones.
- **J.M. Morales** — Traducción técnica, revisiones y correcciones.
- **P.J. Roig** — Traducción técnica, revisiones y correcciones.
- **J.C. Rico** — Traducción Documentación y ayuda en HTML (parcial).

### Agradecimientos especiales

- A la comunidad de usuarios de Packet Tracer en español.
- A Cisco Systems por desarrollar esta herramienta educativa.

### Información técnica

- **Versión de la traducción:** 1.0
- **Fecha:** 2026
- **Compatible con:** Packet Tracer 8.x.x, Packet Tracer 9.x.x.

### ⚖️ Aviso legal (Disclaimer)

Esta traducción es un proyecto comunitario **no oficial**.

No está desarrollada por Cisco Systems, Inc., aunque el propio software permite la incorporación de archivos de idioma personalizados.

Cisco Packet Tracer y sus marcas asociadas son propiedad de sus respectivos titulares.

Esta traducción se proporciona **"tal cual"**, sin garantías de ningún tipo.
El uso de la misma se realiza bajo la responsabilidad del usuario.

Los autores y colaboradores no se hacen responsables de posibles errores, incompatibilidades o daños derivados de su uso.

---

## 1. Resumen

Se ha completado la traducción al español de **Packet Tracer 9.0.1** con **10.641 entradas `finished` (0 `unfinished`)**. A partir de la plantilla (`template.ts`) y de la versión anterior (`Spanish_es.pt`) traducida de la versión previa, utilizando los scripts propios del grupo de traducción.

Durante el proceso se han identificado **limitaciones estructurales de internacionalización** que impiden traducir ciertas cadenas desde el sistema oficial de Qt (`.ts` / `.ptl`), incluso cuando la traducción está presente en el archivo compilado.

> ⚠️ Estas limitaciones **no son fallos de la traducción**, sino consecuencia de cómo Cisco ha implementado (o no) la internacionalización en el código fuente.

---

## 2. Casos resueltos con éxito

### 2.1. Categorías de dispositivos en CDeviceTypesBox

- **Problema:** Las categorías de la paleta (*Network Devices*, *Connections*, *End Devices*, etc.) no se traducen aunque estuvieran en el `.ts` con corchetes (`[Network Devices]`, `[Connections]`, etc.).
- **Causa:** Packet Tracer 9.0.1 busca las cadenas **sin corchetes** en el contexto `CDeviceTypesBox`, no con corchetes. El `template.ts` oficial solo expone la variante con corchetes.
- **Solución aplicada:** Añadir las variantes **sin corchetes** en `CDeviceTypesBox`.
- **Resultado:** ✅ Las categorías se muestran traducidas correctamente.

### 2.2. Accessibility en el menú Ayuda

- **Problema:** El ítem `Accessibility` del menú Ayuda no aparecía en `template.ts` y no se traducía.
- **Causa:** Cisco lo excluyó de `template.ts` (probablemente por una actualización de la plantilla sin regenerar con `lupdate`).
- **Solución aplicada:** Se localizó el contexto buscando cadenas cercanas en el `.ts` y se añadió manualmente.
- **Resultado:** ✅ `Accessibility` se traduce correctamente.

### 2.3. Colores en CAdministrativeOptionsBase

- **Problema:** Al traducir los nombres de color (*Black*, *White*, *Red*, etc.) en el panel **Preferencias → Colores**, el panel se queda en negro y no se puede cambiar el color.
- **Causa:** Packet Tracer usa el texto del botón para construir un `QColor`.
- **Solución aplicada:** **No traducir** esas 10 entradas (marcarlas como sin traducir en el `.ts`, o traducir con el mismo valor), para que Qt haga el cambio al inglés y `QColor` funcione.
- **Resultado:** ✅ El panel de colores funciona correctamente.
- **Evidencia:** Otras traducciones documentan el mismo problema y aplican una solución equivalente a nivel binario (marcar las entradas como `obsolete`, tag `0x04`). Nuestra solución es más limpia (en el `.ts`).

### 2.4. Botones estándar de Qt (OK / Yes / No / Cancel / Close)

- **Problema:** Los botones `OK`, `Yes`, `No`, `Cancel`, `Close` no se traducen.
- **Causa:** Son botones estándar de Qt (`QMessageBox`, `QDialogButtonBox`) que dependen de `qt_es.qm`, no del `.ptl` de Packet Tracer.
- **Solución aplicada:** Se añadió el contexto `QPlatformTheme` con las traducciones.
- **Resultado:** ⚠️ **Parcial.** Algunos botones se traducen; otros siguen dependiendo de `qt_es.qm`. Parece que funciona bien, pero no se han mostrado todos los diálogos posibles.
- **Petición a Cisco:** Incluir `qt_es.qm` en la instalación de Packet Tracer, o documentar cómo traducir los botones estándar de Qt.

---

## 3. Casos no traducibles (limitaciones de Cisco)

### 3.1. Tooltips de categorías de dispositivos

**Ejemplo:** `Legacy Devices`, `Smart City Ctrl+Alt+T`, `Home Ctrl+Alt+H`.

- **Causa:** El código de `CDeviceTypesBox` construye el tooltip **dinámicamente** (concatena el nombre de la categoría con el atajo) y llama a `QWidget::setToolTip()` **sin pasar por `tr()`**.
- **Petición a Cisco:** Envolver en `tr()` las cadenas de los tooltips, o documentar que no son traducibles.

### 3.2. Nombres de cables

**Ejemplo:** `Copper Straight-Through`, `Fiber`, etc.

- **Causa:** Packet Tracer 9.0.1 busca los nombres de cables en un contexto o con una cadena que **no está expuesta en `template.ts`**. A pesar de estar en los contextos `CDeviceSpecificBox`, `CDeviceButton`, `CNetworkComponentBox` y `CTranslationDB`, **no se traducen en la interfaz**.
- **Evidencia:** El `template.ts` oficial solo los expone en `CNetworkComponentBox` (no en `CDeviceSpecificBox`).
- **Petición a Cisco:** Documentar el contexto y formato exactos que Packet Tracer usa para los nombres de cables en 9.0.1, o exponerlos en `template.ts` con el contexto correcto.

### 3.3. Checkbuttons del gestor de plantillas (CBaseDeviceTemplateManager)

- **Problema:** Los checkbuttons del gestor de plantillas de dispositivos no se traducen.
- **Evidencia:** El contexto `CBaseDeviceTemplateManager` no está expuesto en `template.ts`. Se han añadido manualmente las cadenas (`Browse...`, `Clear`, `Custom Icon`, `Icon File:`, etc.) y estas se muestran traducidas debajo de los checkbuttons.
- **Causa probable:** El código no pasa las cadenas por `tr()` en el punto donde se muestran los checkbuttons (se construyen dinámicamente o se usan como datos).
- **Petición a Cisco:** Exponer el contexto `CBaseDeviceTemplateManager` en `template.ts` con las cadenas de los checkbuttons, o documentar que no son traducibles. Añadir la parte debajo de los checkbuttons para que esté en `template.ts`.

### 3.4. Archivos .ptd en la carpeta templates

- **Observación:** Algunos ítems de la interfaz provienen de archivos `.ptd` (*Packet Tracer Document*) ubicados en la carpeta `templates`. Estos archivos están comprimidos (similar a `.pkz`) y contienen una mezcla de datos y JavaScript. Corresponden a los elementos de **IoT**.
- **Causa:** El texto que aparece en la interfaz desde estos archivos **no pasa por el sistema de traducción de Qt** (`.ts` / `.ptl`). Se carga dinámicamente desde el `.ptd`.
- **Petición a Cisco:** Documentar si el contenido de los `.ptd` es localizable y, en su caso, cómo hacerlo.

---

## 4. Contextos que deben repetirse (inyección multi-contexto)

- **`CDeviceButton`** → Categorías, conexiones, nombres de dispositivos
- **`CDeviceSpecificBox`** → Categorías, conexiones, nombres de dispositivos
- **`CDeviceTypesBox`** → Categorías (con y sin corchetes), `Connections`, `Legacy`
- **`CTranslationDB`** → Categorías, conexiones, nombres de dispositivos
- **`CNetworkComponentBox`** → Categorías, conexiones, nombres de cables

> 💡 **Nota:** La inyección multi-contexto es necesaria porque Cisco **no expone las cadenas en todos los contextos** donde Qt las busca. Sin embargo, **no es suficiente** para los casos de la sección 3 (tooltips, cables, checkbuttons), que requieren cambios en el código fuente de Cisco.

---

## 5. Peticiones concretas a Cisco

1. 🔄 **Regenerar `template.ts`** con `lupdate` actualizado para incluir cadenas omitidas (`Accessibility`, `CBaseDeviceTemplateManager`, cables en `CDeviceSpecificBox`, etc.).
2. 📖 **Documentar el formato exacto** de las cadenas que Packet Tracer busca en cada contexto (con/sin corchetes, mayúsculas, espacios, etc.).
3. 🧵 **Envolver en `tr()`** las cadenas construidas dinámicamente (tooltips de categorías, checkbuttons del gestor de plantillas).
4. 🌍 **Incluir `qt_es.qm`** en la instalación de Packet Tracer, o documentar cómo traducir los botones estándar de Qt (`OK`, `Yes`, `No`, `Cancel`, `Close`).
5. 🚫 **Marcar como `notranslate`** las cadenas que no deben traducirse (nombres de color en `CAdministrativeOptionsBase`, claves de hash como `Smart City`).
6. 📦 **Documentar la localización de los archivos `.ptd`** en la carpeta `templates`, si es que son localizables.
7. 🔍 **Revisar la coherencia de contextos entre versiones** (9.0.1 vs 9.0.0), porque algunos cambios de contexto entre versiones no están documentados.

---

## 6. Conclusión

La traducción al español de **Packet Tracer 9.0.1.0858** se ha completado con **10.641 entradas `finished`**.

Las cadenas que quedan sin traducir **no son traducibles desde el sistema oficial de Qt** por limitaciones de implementación de Cisco:

- 🧩 Cadenas sin `tr()`
- 🧱 Contextos no expuestos
- 🔗 Dependencia de `qt_es.qm`
- 📦 Contenido en `.ptd`

Las peticiones de la sección 5 están orientadas a que Cisco mejore la internacionalización de Packet Tracer en futuras versiones, de modo que los traductores puedan ofrecer una **experiencia completamente localizada**.

> 😔 *Aunque no creo que hagan mucho caso.*

La conclusión final es que **hay algunos fallos en las traducciones**. Parece ser que actualizan ítems en el PT pero luego no actualizan el archivo de localización. Y algunos ítems se construyen de forma dinámica **sin pasar por el traductor de Qt**.

---

<div align="center">

**Hecho con ❤️ por el grupo de traducción**

*Si encuentras algún fallo o quieres contribuir, abre un issue o un pull request.*

</div>
