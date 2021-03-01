library ieee;
use ieee.std_logic_1164.all;

Entity fsm_producto is
	port( monedas : in std_logic_vector(2 downto 0);
			clk: in std_logic;
	      dinero, cambio : out std_logic_vector(4 downto 0));
end fsm_producto;

architecture behavior of fsm_producto is

	type state_type is (A,B,C,D,E);
	signal edos : state_type;
	
begin
	--cambio de edos
	process(clk,monedas)
	begin
		-- se verifica el flaco de subida
		if (rising_edge(clk))then
			case edos is
				when A =>
					if(monedas ="001")then
						edos <= B;
					elsif (monedas ="010")then
						edos <= C;
					elsif (monedas ="100")then
						edos <=D;
					else 
						edos <= edos;
					end if;
				when B =>
					if(monedas ="001")then
						edos <= C;
					elsif (monedas ="010")then
						edos <= D;
					elsif (monedas ="100")then
						edos <=E;
					else 
						edos <= edos;
					end if;
				when C =>
					if(monedas ="001")then
						edos <= D;
					elsif (monedas ="010")then
						edos <= E;
					elsif (monedas ="100")then
						edos <=E;
					else 
						edos <= edos;
					end if;
				when D =>
					if(monedas ="001")then
						edos <= E;
					elsif (monedas ="010")then
						edos <= E;
					elsif (monedas ="100")then
						edos <=E;
					else 
						edos <= edos;
					end if;
				when E =>
					if(monedas ="001")then
						edos <= E;
					elsif (monedas ="010")then
						edos <= E;
					elsif (monedas ="100")then
						edos <=E;
					else 
						edos <= A;
					end if;
				when others =>
					edos <= A;
			end case;
		end if;
	end process;
	
	--logica de salida MOORE (CANTIDAD PUESTA _MORADO) 
	dinero <= "00000" when edos = A else
				 "00101" when edos = B else
				 "01010" when edos = C else
				 "01111" when edos = D else
				 "10100" when edos = E else
				 "00000";
	
	--logica de salida MEALY (CAMBIO _AZULCIELO) 
	process(monedas,edos)
	begin
		case edos is
			when A =>
				cambio <= "00000";
			when B =>
				cambio <= "00000";
			when C =>
				if(monedas="100")then
					cambio <= "00101";
				else
					cambio <= "00000";
				end if;
			when D =>
				if(monedas="010")then
					cambio <= "00101";
				elsif (monedas="100")then
					cambio <= "01010";
				else
					cambio <= "00000";
				end if;
			when E =>
				if(monedas="001")then
					cambio <= "00101";
				elsif (monedas="010")then
					cambio <= "01010";
				elsif (monedas="100")then
					cambio <= "01111";
				else
					cambio <= "00000";
				end if;
			when others =>
				cambio <= "00000";
		end case;
	end process;
	
end behavior;