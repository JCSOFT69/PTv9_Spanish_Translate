# PTv9_Spanish_Translate
Traducción de Packet Tracer v9.0 a español
Informe técnico: Limitaciones de internacionalización en Cisco Packet Tracer 9.0.1.0858
Versión analizada: Cisco Packet Tracer 9.0.1.0858
Idioma de destino: Español (castellano)
Método de trabajo: Traducción desde template.ts oficial → compilación con lrelease (Qt 6.8.7) → .ptl → prueba en Packet Tracer.

1. Resumen
Se ha completado la traducción al español de Packet Tracer 9.0.1 con 10.641 entradas finished (0 unfinished). A partir de la plantilla (template.ts) y de la versión anterior (Spanish_es.pt) traducida de la versión anterior y utilizando los scripts propios del grupo de traducción.
Durante el proceso se han identificado limitaciones estructurales de internacionalización que impiden traducir ciertas cadenas desde el sistema oficial de Qt (.ts/.ptl), incluso cuando la traducción está presente en el archivo compilado.
Estas limitaciones no son fallos de la traducción, sino consecuencia de cómo Cisco ha implementado (o no) la internacionalización en el código fuente. 

3. Casos resueltos con éxito
   
2.1. Categorías de dispositivos en CDeviceTypesBox
Problema: Las categorías de la paleta (Network Devices, Connections, End Devices, etc.) no se traducen aunque estuvieran en el .ts con corchetes ([Network Devices], [Connections], etc.).
Causa: Packet Tracer 9.0.1 busca las cadenas sin corchetes en el contexto CDeviceTypesBox, no con corchetes. El template.ts oficial solo expone la variante con corchetes.
Solución aplicada: Añadir las variantes sin corchetes en CDeviceTypesBox:
Resultado: Las categorías se muestran traducidas correctamente.

2.2 Accessibility en el menú Ayuda
Problema: El ítem Accessibility del menú Ayuda no aparecía en template.ts y no se traducía.
Causa: Cisco lo excluyó de template.ts (probablemente por una actualización de la plantilla sin regenerar con lupdate).
Solución aplicada: Se localizó el contexto buscando cadenas cercanas en el .ts y se añadió manualmente:
Resultado: Accessibility se traduce correctamente.

2.3 Colores en CAdministrativeOptionsBase
Problema: Al traducir los nombres de color (Black, White, Red, etc.) en el panel Preferencias → Colores, el panel se queda en negro y no se puede cambiar el color.
Causa: Packet Tracer usa el texto del botón para construir un QColor.
Solución aplicada: No traducir esas 10 entradas (marcarlas como sin traducir en el .ts, o traducir con el mismo valor), para que Qt haga el cambio al inglés y QColor funcione.
Resultado: El panel de colores funciona correctamente.
Evidencia: Otras traducciones documentan el mismo problema y aplica una solución equivalente a nivel binario (marcar las entradas como obsolete, tag 0x04). Nuestra solución es más limpia (en el .ts).

2.4 Botones estándar de Qt (OK / Yes / No / Cancel / Close)
Problema: Los botones OK, Yes, No, Cancel, Close no se traducen.
Causa: Son botones estándar de Qt (QMessageBox, QDialogButtonBox) que dependen de qt_es.qm, no del .ptl de Packet Tracer.
Solución aplicada: Se añadió el contexto QPlatformTheme con las traducciones:
Resultado: Parcial. Algunos botones se traducen; otros siguen dependiendo de qt_es.qm. Parece que funciona bien, pero no he mostrado todos los diálogos posibles.
Petición a Cisco: Incluir qt_es.qm en la instalación de Packet Tracer, o documentar cómo traducir los botones estándar de Qt.

3. Casos no traducibles (limitaciones de Cisco)
3.1 Tooltips de categorías de dispositivos
Ejemplo: Legacy Devices, Smart City Ctrl+Alt+T, Home Ctrl+Alt+H.
Causa: El código de CDeviceTypesBox construye el tooltip dinámicamente (concatena el nombre de la categoría con el atajo) y llama a QWidget::setToolTip() sin pasar por tr().
Petición a Cisco: Envolver en tr() las cadenas de los tooltips, o documentar que no son traducibles.

3.2 Nombres de cables (Copper Straight-Through, Fiber, etc.)
Causa: Packet Tracer 9.0.1 busca los nombres de cables en un contexto o con una cadena que no está expuesta en template.ts. Aunque el .ptl chino los tiene en CDeviceSpecificBox, CDeviceButton, CNetworkComponentBox y CTranslationDB, no se traducen en la interfaz.
Evidencia:
El template.ts oficial sólo los expone en CNetworkComponentBox (no en CDeviceSpecificBox).
Petición a Cisco: Documentar el contexto y formato exactos que Packet Tracer usa para los nombres de cables en 9.0.1, o exponerlos en template.ts con el contexto correcto.

3.3 Checkbuttons del gestor de plantillas (CBaseDeviceTemplateManager)
Problema: Los checkbuttons del gestor de plantillas de dispositivos no se traducen.
Evidencia:
El contexto CBaseDeviceTemplateManager no está expuesto en template.ts.
Se han añadido manualmente las cadenas (Browse..., Clear, Custom Icon, Icon File:, etc.) y estas se muestran traducidas que están debajo de los checkbuttons.
Causa probable: El código no pasa las cadenas por tr() en el punto donde se muestran los checkbuttons (se construyen dinámicamente o se usan como datos).
Petición a Cisco: Exponer el contexto CBaseDeviceTemplateManager en template.ts con las cadenas de los checkbuttons, o documentar que no son traducibles. Añadir la parte debajo de los checkbuttons para que esté en template.ts.

3.4 Archivos .ptd en la carpeta templates
Observación: Algunos ítems de la interfaz provienen de archivos .ptd (Packet Tracer Document) ubicados en la carpeta templates. Estos archivos están comprimidos (similar a .pkz) y contienen una mezcla de datos y JavaScript. Corresponden a los elementos de IoT. 

Causa: El texto que aparece en la interfaz desde estos archivos no pasa por el sistema de traducción de Qt (.ts/.ptl). Se carga dinámicamente desde el .ptd.
Petición a Cisco: Documentar si el contenido de los .ptd es localizable y, en su caso, cómo hacerlo.

4. Contextos que deben repetirse (inyección multi-contexto)
Contexto
Cadenas a repetir
CDeviceButton
Categorías, conexiones, nombres de dispositivos
CDeviceSpecificBox
Categorías, conexiones, nombres de dispositivos
CDeviceTypesBox
Categorías (con y sin corchetes), Connections, Legacy
CTranslationDB
Categorías, conexiones, nombres de dispositivos
CNetworkComponentBox
Categorías, conexiones, nombres de cables

Nota: La inyección multi-contexto es necesaria porque Cisco no expone las cadenas en todos los contextos donde Qt las busca. Sin embargo, no es suficiente para los casos de la sección 3 (tooltips, cables, checkbuttons), que requieren cambios en el código fuente de Cisco.

5. Peticiones concretas a Cisco
Regenerar template.ts con lupdate actualizado para incluir cadenas omitidas (Accessibility, CBaseDeviceTemplateManager, cables en CDeviceSpecificBox, etc.).
Documentar el formato exacto de las cadenas que Packet Tracer busca en cada contexto (con/sin corchetes, mayúsculas, espacios, etc.).
Envolver en tr() las cadenas construidas dinámicamente (tooltips de categorías, checkbuttons del gestor de plantillas).
Incluir qt_es.qm en la instalación de Packet Tracer, o documentar cómo traducir los botones estándar de Qt (OK, Yes, No, Cancel, Close).
Marcar como notranslate las cadenas que no deben traducirse (nombres de color en CAdministrativeOptionsBase, claves de hash como Smart City).
Documentar la localización de los archivos .ptd en la carpeta templates, si es que son localizables.
Revisar la coherencia de contextos entre versiones (9.0.1 vs 8.2.2), porque algunos cambios de contexto entre versiones no están documentados.

6. Conclusión
La traducción al español de Packet Tracer 9.0.1.0858 se ha completado con 10.641 entradas finished,
Las cadenas que quedan sin traducir no son traducibles desde el sistema oficial de Qt por limitaciones de implementación de Cisco (cadenas sin tr(), contextos no expuestos, dependencia de qt_es.qm, contenido en .ptd).

Las peticiones de la sección 5 están orientadas a que Cisco mejore la internacionalización de Packet Tracer en futuras versiones, de modo que los traductores puedan ofrecer una experiencia completamente localizada. Aunque no creo que hagan mucho caso.
La conclusión final es que hay bastantes fallos en las traducciones. Parece ser que actualizan ítems en el PT pero luego no actualizan el archivo de localización. Y algunos ítems se construyen de forma dinámica sin pasar por el traductor de Qt.



