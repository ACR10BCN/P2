PAV - P2: detección de actividad vocal (VAD)
============================================

Esta práctica se distribuye a través del repositorio GitHub [Práctica 2](https://github.com/albino-pav/P2),
y una parte de su gestión se realizará mediante esta web de trabajo colaborativo.  Al contrario que Git,
GitHub se gestiona completamente desde un entorno gráfico bastante intuitivo. Además, está razonablemente
documentado, tanto internamente, mediante sus [Guías de GitHub](https://guides.github.com/), como
externamente, mediante infinidad de tutoriales, guías y vídeos disponibles gratuitamente en internet.


Inicialización del repositorio de la práctica.
----------------------------------------------

Para cargar los ficheros en su ordenador personal debe seguir los pasos siguientes:

*	Abra una cuenta GitHub para gestionar esta y el resto de prácticas del curso.
*	Cree un repositorio GitHub con el contenido inicial de la práctica (sólo debe hacerlo uno de los
	integrantes del grupo de laboratorio, cuya página GitHub actuará de repositorio central del grupo):
	-	Acceda la página de la [Práctica 2](https://github.com/albino-pav/P2).
	-	En la parte superior derecha encontrará el botón **`Fork`**. Apriételo y, después de unos segundos,
		se creará en su cuenta GitHub un proyecto con el mismo nombre (**P2**). Si ya tuviera uno con ese 
		nombre, se utilizará el nombre **P2-1**, y así sucesivamente.
*	Habilite al resto de miembros del grupo como *colaboradores* del proyecto; de este modo, podrán
	subir sus modificaciones al repositorio central:
	-	En la página principal del repositorio, en la pestaña **:gear:`Settings`**, escoja la opción 
		**Collaborators** y añada a su compañero de prácticas.
	-	Éste recibirá un email solicitándole confirmación. Una vez confirmado, tanto él como el
		propietario podrán gestionar el repositorio, por ejemplo: crear ramas en él o subir las
		modificaciones de su directorio local de trabajo al repositorio GitHub.
*	En la página principal del repositorio, localice el botón **Branch: master** y úselo para crear
	una rama nueva con los primeros apellidos de los integrantes del equipo de prácticas separados por
	guion (**fulano-mengano**).
*	Todos los miembros del grupo deben realizar su copia local en su ordenador personal.
	-	Copie la dirección de su copia del repositorio apretando en el botón **Clone or download**.
		Asegúrese de usar *Clone with HTTPS*.
	-	Abra una sesión de Bash en su ordenador personal y vaya al directorio **PAV**. Desde ahí, ejecute:

		```.sh
		git clone dirección-del-fork-de-la-práctica
		```

	-	Vaya al directorio de la práctica `cd P2`.
	-	Añada la etiqueta `origin` a su copia del repositorio. Esto es útil para facilitar los *push* y
		*pull* al repositorio original:
		```.sh
		git remote add origin dirección-del-fork-de-la-práctica
		```
	-	Cambie a la rama **fulano-mengano** con la orden:

		```.sh
		git checkout fulano-mengano
		```

*	A partir de este momento, todos los miembros del grupo de prácticas pueden trabajar en su directorio
	local del modo habitual.
	-	También puede utilizar el repositorio remoto como repositorio central para el trabajo colaborativo
		de los distintos miembros del grupo de prácticas; o puede serle útil usarlo como copia de
		seguridad.
	-	Cada vez que quiera subir sus cambios locales al repositorio GitHub deberá confirmar los
		cambios en su directorio local:

		```.sh
		git add .
		git commit -m "Mensaje del commit"
		```

		y, a continuación, subirlos con la orden:

		```.sh
		git push -u origin fulano-mengano
		```

*	Al final de la práctica, la rama **fulano-mengano** del repositorio GitHub servirá para remitir la
	práctica para su evaluación utilizando el mecanismo *pull request*.
	-	Vaya a la página principal de la copia del repositorio y asegúrese de estar en la rama
		**fulano-mengano**.
	-	Pulse en el botón **New pull request**, y siga las instrucciones de GitHub.


Entrega de la práctica.
-----------------------

Responda, en este mismo documento (README.md), los ejercicios indicados a continuación. Este documento es
un fichero de texto escrito con un formato denominado _**markdown**_. La principal característica de este
formato es que, manteniendo la legibilidad cuando se visualiza con herramientas en modo texto (`more`,
`less`, editores varios, ...), permite amplias posibilidades de visualización con formato en una amplia
gama de aplicaciones; muy notablemente, **GitHub**, **Doxygen** y **Facebook** (ciertamente, :eyes:).

En GitHub. cuando existe un fichero denominado README.md en el directorio raíz de un repositorio, se
interpreta y muestra al entrar en el repositorio.

Debe redactar las respuestas a los ejercicios usando Markdown. Puede encontrar información acerca de su
sintáxis en la página web [Sintaxis de Markdown](https://daringfireball.net/projects/markdown/syntax).
También puede consultar el documento adjunto [MARKDOWN.md](MARKDOWN.md), en el que se enumeran los
elementos más relevantes para completar la redacción de esta práctica.

Recuerde realizar el *pull request* una vez completada la práctica.

Ejercicios
----------

### Etiquetado manual de los segmentos de voz y silencio

- Etiquete manualmente los segmentos de voz y silencio del fichero grabado al efecto. Inserte, a 
  continuación, una captura de `wavesurfer` en la que se vea con claridad la señal temporal, el contorno de
  potencia y la tasa de cruces por cero, junto con el etiquetado manual de los segmentos.
<picture>
  

  <image src="/PAV/P2/img/audio_lebels_i_potencia.png)" alt="Captura de wavesurfer senyal de veu  amb l'etiquetat manual i la potència">
  

</picture>

- A la vista de la gráfica, indique qué valores considera adecuados para las magnitudes siguientes:

	* Incremento del nivel potencia en dB, respecto al nivel correspondiente al silencio inicial, para estar seguros de que un segmento de señal se corresponde con voz.

	Si realitzem aquest nivell mitjançant les gràfiques obtingudes amb el wavesurder, és bastant poc exacte, ja que, tot i que les potències dels segments de silenci i veu es diferencin prou bé, resulta un xic arriscat. Però si ho féssim basant-nos en això, podriem dir que a partir de 30 dB's aproximadament es podria considerar veu. Tot i això, a la pràctica hem pogur establir llindars més precisos.

	* Duración mínima razonable de los segmentos de voz y silencio.

	Analitzant el fitxer wav i comparant-lo amb altres, hem arribat a la conclusió que els segments de veu, acostumen a durar, com a mínim 0,5 segons, tot i que pot haver-hi de menys i els de silenci 0,2 segons. Però això varia molt depenent de la duració de les paraules i silencia, ja que en mitjana la duració dels trams de veu està al voltant dels 4 segons. I pel que respecte als trams de silenci, la majoria que ens hem trobat estaven al voltant de 0,471.

	* ¿Es capaz de sacar alguna conclusión a partir de la evolución de la tasa de cruces por cero?

	Podem observar que per a que fa als silencis, el ZRC sempre, en mitjana es troba en un valor que ronda entre el 10000 i 2000. Tot i que si observem valors mínims i màxims, aquests poden anar des del 50 al 3600. Pel que fa als trams de veu, observem en mitjana un ZRC que va es mou entre els 300 i 700 i que si ens fixem en els valors màxims i mínims poden anar del 50 al 4000. Per tant, si observem en mitjana, sí que ens poden orientar, segons el valor si es tracta d'un tram de silenci o veu. Els encreuaments per zero, poden ajudar-nos a afinar el nostre algorisme per tal d'obtenir resultats més precisos, però la màxima diferenciació la farem amb la potència. 
	A més el ZRC, ens pog ajudar a diferenciar silenci (soroll) de sons fricatius (/s/, /f/) de baixa energia.


### Desarrollo del detector de actividad vocal

- Complete el código de los ficheros de la práctica para implementar un detector de actividad vocal en
  tiempo real tan exacto como sea posible. Tome como objetivo la maximización de la puntuación-F `TOTAL`.
<picture>
<image src="/PAV/P2/img/score_total.png)" alt="Maximització F">

</picture>

- Inserte una gráfica en la que se vea con claridad la señal temporal, el etiquetado manual y la detección
  automática conseguida para el fichero grabado al efecto. 
<picture>
<image src=" /PAV/P2/img/comparació_labels_a_ma_i_fets_amb_algorisme.png)" alt=" Gràfica wavesurfer comparació etiquetatge manual i l'automàtica">
</picture>

- Explique, si existen. las discrepancias entre el etiquetado manual y la detección automática.

En la imatge podem observar, com a d'alt tenim l'etiquetatge manual, realitzat per nosaltres i a sota, el realitzat automàticament per l'algorisme. Es pot observar com l'algorisme ha detectat millor els trams de veu i silenci tot i que no s'allunyi gaire de la nostra detecció manual. La seva detecció ha sigut més precisa que la nostra pel que respecte a certs detalls a l'hora de saber quan acaba la veu i comença el silenci. A més podem veure que l'algorisme alguns sons sords els confon amb silenci.

- Evalúe los resultados sobre la base de datos `db.v4` con el script `vad_evaluation.pl` e inserte a 
  continuación las tasas de sensibilidad (*recall*) y precisión para el conjunto de la base de datos (sólo
  el resumen).

<picture>
<image src="/PAV/P2/img/score_total.png)" alt="Maximització F">

</picture>

Hem obtingut un valor d'F de 94,152% per al conjunt de senyals de la base de dades proporcionada.

### Trabajos de ampliación

#### Cancelación del ruido en los segmentos de silencio

- Si ha desarrollado el algoritmo para la cancelación de los segmentos de silencio, inserte una gráfica en
  la que se vea con claridad la señal antes y después de la cancelación (puede que `wavesurfer` no sea la
  mejor opción para esto, ya que no es capaz de visualizar varias señales al mismo tiempo).

 <picture>
<image src="/PAV/P2/img/ampliable1_abans_i_despres.png)" alt="Comparació algorisme cancelació segments de silenci">

</picture>

En la imatge superior tenim la senyal de veu inicial i en la segona, un cop hem aplicat l'algorisme. Es pot observar clarament que on hi ha trams de silenci, en la de d'alt no tenim un valor exactament de zero, degut a possible soroll que hi hagi de fons, però si observem la de baix, aquests tramms de silenci clarament estan tots a un valor de zero. Per tant, podem afirmar que l'algorisme fica a zero els trams de silenci.

#### Gestión de las opciones del programa usando `docopt_c`

- Si ha usado `docopt_c` para realizar la gestión de las opciones y argumentos del programa `vad`, inserte
  una captura de pantalla en la que se vea el mensaje de ayuda del programa.

<picture>
<image src="/PAV/P2/img/ampliable2_comprovacio.png)" alt="Definició dels paràmetres des de la terminal">

</picture>

<picture>
<image src="/PAV/P2/img/captura_docopt_c_ampliable2.png)" alt="Missatge d'ajuda del programa vad">

En la primera imatge observem com des de la terminal podem determinar els valors per defecte dels paràmetres.

En la segona imatge observem el menú d'ajuda de vad.

</picture>
### Contribuciones adicionales y/o comentarios acerca de la práctica

- Indique a continuación si ha realizado algún tipo de aportación suplementaria (algoritmos de detección o 
  parámetros alternativos, etc.).

- Si lo desea, puede realizar también algún comentario acerca de la realización de la práctica que
  considere de interés de cara a su evaluación.

  Aquesta pràctica ens ha permés conéixer github i aprendre a treballar amb ell. Una eina molt útil i dinàmica. A més, ens agradaria comentar que pel que respecte a l'ampliable 1 hem tingut diversos problemes i realitzat diferents intents sense èxit, però finalment ens hem ensortit i hem aconseguit el que se'ns demanava.


### Antes de entregar la práctica

Recuerde comprobar que el repositorio cuenta con los códigos correctos y en condiciones de ser 
correctamente compilados con la orden `meson bin; ninja -C bin`. El programa generado (`bin/vad`) será
el usado, sin más opciones, para realizar la evaluación *ciega* del sistema.