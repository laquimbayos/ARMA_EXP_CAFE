
#Establecer el directorio de trabajo

setwd("C:/Users/57350/Desktop/GITHUB/SERIES DE TIEMPO/Series de tiempo")
remove(list = ls())


#librerías
library(readxl)
library(tidyverse)
library(tseries)
library(urca)
library(forecast)

#Importar data set

data_x <- read_excel("Volumen.xlsx")
plot(data_x)
attach(data_x)

#Volver serie de tiempo
data <- ts(EXP_CAFE, start= c(1958,1), frequency = 12)
view(data)
plot(data, main = "Gráfico del log serie de tiempo original")


# Prueba de estacionariedad
# Prueba de Dickey-Fuller
ur.df(data)%>% summary()


#En la prueba el P-valor es menor que los valores críticos al 5% y 10%,
#Se puede decir que hay suficiente evidencia estadistica para rechazar H0 y afirmar 
#que no hay raiz unitaria o que la serie de tiempo es estacionaria.


#Identificación de órdenes del modelo ARMA

# Gráficos de ACF y PACF
acf_data <- acf(data, lag.max = 80)
pacf_data <- pacf(data, lag.max = 80)


# Ajustar los modelos ante diferentes valores de p y q

ajuste_ARIMA <- function(data, valores_p, valores_q) 
{modelos <- list()
for (p in valores_p) {
  for (q in valores_q) {
    modelo <- Arima(data, order = c(p, 0, q))
    modelos[[paste("ARMA", p, q, sep = "")]] <- modelo
  }
}
return(modelos)
}


#Se definen los rangos de valores de p y q.
valores_p <- c(1, 2, 3)
valores_q <- c(0, 1, 2, 3, 4)

modelos_ajustados <- ajuste_ARIMA(data, valores_p, valores_q)


aic=numeric(length(modelos_ajustados))
bic=numeric(length(modelos_ajustados))

aic <- sapply(modelos_ajustados, AIC)
bic <- sapply(modelos_ajustados, BIC)


resumen = data.frame(modelos_ajustados=paste0("ARIMA",1:length(modelos_ajustados)),
                     AIC = aic,
                     BIC= bic)  
print(resumen)  


#El mejor modelo dado que sus criterios AIC y BIC son los menores, es el modelo 15
# ARIMA(3, 0, 4) con un AIC de 103.8 y un BIC de 104.2


ARMA15 = Arima(data, order=c(3,0,4)) 

#Una vez definido el mejor modelo ARMA podemos realizar el pronostico.

predic_1 =forecast(ARMA15, h=10)
summary(predic_1)
library(ggplot2)
autoplot(predic_1)

error=residuals(ARMA15)
checkresiduals(error)



#El resultado es el pronostico para 10 meses del volumen mensual 
#de ventas de cafe.






