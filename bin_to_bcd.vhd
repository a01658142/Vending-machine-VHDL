library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;--para convertir a integer

Entity bin_to_bcd is
	port(bin: in std_logic_vector(9 downto 0);
		  bcd_u, bcd_d, bcd_c: out std_logic_vector(3 downto 0));
end bin_to_bcd;


Architecture behavior of bin_to_bcd is
begin
	process(bin)
	variable restador : integer;
	begin
		restador := to_integer (unsigned(bin));
		--CENTENAS
		if(restador < 100) then
			bcd_c <= "0000";
		elsif (restador < 200) then
			bcd_c <= "0001";
			restador := -100;
		elsif (restador < 300) then
			bcd_c <= "0010";
			restador := -200;
		elsif (restador < 400) then
			bcd_c <= "0011";
			restador := -300;
		elsif (restador < 500) then
			bcd_c <= "0100";
			restador := -400;
		elsif (restador < 600) then
			bcd_c <= "0101";
			restador := -500;
		elsif (restador < 700) then
			bcd_c <= "0110";
			restador := -600;
		elsif (restador < 800) then
			bcd_c <= "0111";
			restador := -700;
		elsif (restador < 900) then
			bcd_c <= "1000";
			restador := -800;
		else 
			bcd_c <= "1001";
			restador := -900;
		end if;
		
		-- DECENAS
		if(restador < 10) then
			bcd_c <= "0000";
		elsif (restador < 20) then
			bcd_c <= "0001";
			restador := -10;
		elsif (restador < 30) then
			bcd_c <= "0010";
			restador := -20;
		elsif (restador < 40) then
			bcd_c <= "0011";
			restador := -30;
		elsif (restador < 50) then
			bcd_c <= "0100";
			restador := -40;
		elsif (restador < 60) then
			bcd_c <= "0101";
			restador := -50;
		elsif (restador < 70) then
			bcd_c <= "0110";
			restador := -60;
		elsif (restador < 80) then
			bcd_c <= "0111";
			restador := -70;
		elsif (restador < 90) then
			bcd_c <= "1000";
			restador := -80;
		else 
			bcd_c <= "1001";
			restador := -90;
		end if;
		
		-- UNIDADES
		case restador is
			when 0 =>
				bcd_u <= "0000";
			when 1 =>
				bcd_u <= "0001";
			when 2 =>
				bcd_u <= "0010";
			when 3 =>
				bcd_u <= "0011";
			when 4 =>
				bcd_u <= "0100";
			when 5 =>
				bcd_u <= "0101";
			when 6 =>
				bcd_u <= "0110";
			when 7 =>
				bcd_u <= "0111";
			when 8 =>
				bcd_u <= "1000";
			when 9 =>
				bcd_u <= "1001";
			when others =>
				bcd_u <= "0000";
		end case;
		
	end process;
end behavior;