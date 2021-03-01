# Maquina expendedora

Este repositorio contiene una máquina de estados con entidad MAQ_D como entidad para interactuar con la FPGA y entidad fsm_producto donde se definen los estados.

## Background on this repository

Actividad de aprendizaje de como funciona una maquina de estados de meealey e implementarla en una FPGA intel DE10-Lite.  

## How to use this repository

Este proyecto esta dividido en 5 entidades,
MAQ_D entidad top para interactuar con el usuario. Cambiar el tiempo (CLK) en la asignación de puertos. 
    Asignación de pines, switches monedas 5, 10 ,15 (SW0, SW1, SW2), clk_50 (reloj 50Mhz fpga), uDinero (HEX5) dDinero (HEX4), uCambio (HEX1), dCambio (HEX0).
fsm_producto maquina de 5 estados (0,5,10,15,20) monedas. Aqui pueden cambiar y agregar a otras cantidades aumentando condiciones.  
DIV_FREC para el reloj. Generico para usar en otros proyectos.
DECODER para el display 7 segmentos, 
bin_to_bcd recibe binario en los switches del FPGA y lo manda al decoder

### File List

Files      | Descriptions 
---|---
[MAQ_D](./MAQ_D.vhd)
[DIV_FREC](./DIV_FREC.vhd) 
[DECODER](./DECODER.vhd) 
[fsm_producto](./fsm_producto.vhd) 
[bin_to_bcd](./bin_to_bcd.vhd) 