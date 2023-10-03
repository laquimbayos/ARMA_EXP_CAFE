# ARMA_EXP_CAFE
Proyecto ejemplo de aplicación de series de tiempo (ARMA) en la proyección de las exportaciones de café colombiano. 
## Análisis de Series de Tiempo y Pronóstico de Ventas de Café

### Introducción

Este proyecto se centra en el análisis de series de tiempo y la generación de pronósticos para las ventas mensuales de café. Utilizamos el lenguaje de programación R y varias bibliotecas especializadas para llevar a cabo este análisis.

### Configuración

Antes de ejecutar el código, asegúrate de configurar adecuadamente tu entorno de trabajo. Esto se puede hacer mediante la función `setwd()` en R para establecer el directorio de trabajo en la ubicación donde se encuentra el archivo de datos "Volumen.xlsx".

### Requisitos

Asegúrate de tener las siguientes bibliotecas de R instaladas antes de ejecutar el código:

  - `readxl`: Para la lectura de archivos Excel.
  - `tidyverse`: Para manipulación y visualización de datos.
  - `tseries`: Para realizar análisis de series de tiempo.
  - `urca`: Para realizar pruebas de raíz unitaria.
  - `forecast`: Para generar pronósticos.

  Puedes instalar estas bibliotecas en R utilizando el siguiente código:
  
  ```R
  install.packages("readxl")
  install.packages("tidyverse")
  install.packages("tseries")
  install.packages("urca")
  install.packages("forecast")

### Usos

Este proyecto se utiliza para:

- Analizar series de tiempo de ventas mensuales de café.
- Realizar pruebas de estacionariedad en la serie de tiempo.
- Identificar los órdenes del modelo ARMA (AutoRegressive Moving Average).
- Ajustar varios modelos ARMA con diferentes valores de p y q.
- Seleccionar el mejor modelo ARMA basado en criterios AIC y BIC.
- Generar pronósticos para las ventas de café para los próximos 10 meses.
- Verificar la calidad del modelo mediante la inspección de los residuos.

### Resultados

Los resultados del proyecto incluyen:

- Identificación del mejor modelo ARMA, por ejemplo, ARIMA(3, 0, 4).
- Gráfico del pronóstico para las ventas mensuales de café.
- Evaluación de la calidad del modelo mediante la inspección de los residuos.

Estos resultados permiten tomar decisiones informadas sobre las ventas de café y proporcionan información útil para la planificación y la toma de decisiones empresariales relacionadas con el café.
