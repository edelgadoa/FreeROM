He incluido la parte del FOM de NSE con LPS tanto como para tomar snapshots como para obtener cantidades como la energía cinética, el coeficiente de lift y drag etc.

En cuanto al cálculo de la base POD, he incluido el cálculo de la base POD para la velocidad, presión y viscosidad turbulenta, considerando en esta última dos. La primera sería un modelo en el que calculamos la viscosidad turbulenta como en el DEIM pero usando RBF y la otra es dividiendo la viscosidad turbulenta en una parte "media" y "fluctuante" y por ello conlleva el cálcula de dos bases POD. Con esta última podemos extrapolar en tiempo, luego he llamado a los archivos extrapolate.

He incluido el cálculo de todas las matrices offline usando RBF de los dos tipos y también he añadido la parte online de los dos tipos.

Por último, del DEIM he incluido como calcular los puntos mágicos, matrices offline que tiene la base del DEIM y como implementarlo en la fase online. 