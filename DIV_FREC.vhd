library ieee;
use ieee.std_logic_1164.all;

ENTITY DIV_FREC IS 
--1hz entonces se agrega el generico para que sea universal
	generic(pulsos: integer:= 25000000);
	
	Port( CLK:  in std_logic;
		   CLK2: out std_logic);
end DIV_FREC;

architecture behavior of DIV_FREC is
	signal reloj : std_logic;
begin

	process (CLK)
	variable cont: integer :=0;
	begin
		if(rising_edge(CLK))then
			cont:= cont + 1;
			if (cont = pulsos)then
				reloj <= NOT reloj;
				cont:=0;
			end if;
		end if;
	end process;
	
	CLK2 <= reloj;
	
end behavior;