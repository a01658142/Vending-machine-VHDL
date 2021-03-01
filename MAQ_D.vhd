library ieee;
use ieee.std_logic_1164.all;

Entity MAQ_D is
	PORT(
	switches: IN std_logic_vector (2 downto 0);
	clk_50: IN std_logic;
	uDinero, dDinero, uCambio, dCambio: OUT std_logic_vector(6 downto 0)
	);
End MAQ_D;

Architecture behavior of MAQ_D is

	component bin_to_bcd is
		port(bin: IN std_logic_vector(9 downto 0);
			bcd_u, bcd_d, bcd_c: OUT std_logic_vector(3 downto 0));
	end component;
	
	component DECODER is
		Port(A: IN std_logic_vector(3 downto 0);
			  S: OUT std_logic_vector(6 downto 0));
	End component;
	
	component fsm_producto is
		port( monedas: IN std_logic_vector(2 downto 0);
					 clk: IN std_logic;
	   dinero,cambio: OUT std_logic_vector(4 downto 0));
	end component;
	
	component DIV_FREC IS 

		generic(pulsos: integer:= 25000000);
	
		Port( CLK:  in std_logic;
		     CLK2: out std_logic);
	end component;
	
	signal clk_3s: std_logic;
	signal dinInt,cambInt: std_logic_vector(4 downto 0);
	signal Dbcd_u, Dbcd_d, Dbcd_c: std_logic_vector(3 downto 0);
	signal Cbcd_u, Cbcd_d, Cbcd_c: std_logic_vector(3 downto 0);
	
Begin
	
	U0: DIV_FREC generic map (75000000) port map (clk_50, clk_3s);
	U1: fsm_producto port map (switches, clk_3s, dinInt, cambInt);
	U2: bin_to_bcd port map ("00000"&dinInt, Dbcd_u, Dbcd_d, Dbcd_c);
	U3: bin_to_bcd port map ("00000"&cambInt, Cbcd_u, Cbcd_d, Cbcd_c);
	U4: DECODER port map (Dbcd_u, uDinero);
	U5: DECODER port map (Dbcd_d, dDinero);
	U6: DECODER port map (Cbcd_u, uCambio);
	U7: DECODER port map (Cbcd_d, dCambio);

End behavior;
