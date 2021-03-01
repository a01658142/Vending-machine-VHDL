library ieee;
use ieee.std_logic_1164.all;

Entity DECODER IS
	Port(A:in std_logic_vector(3 downto 0);
		  S:out std_logic_vector(6 downto 0)
	);
End DECODER;

Architecture behavior of DECODER is

begin
	S <= "1000000" when A = "0000" else
		  "1111001" when A = "0001" else
		  "0100100" when A = "0010" else
		  "0110000" when A = "0011" else
		  "0011001" when A = "0100" else
		  "0010010" when A = "0101" else
		  "0000010" when A = "0110" else
		  "1111000" when A = "0111" else
		  "0000000" when A = "1000" else
		  "0011000" when A = "1001" else
		  "0001000" when A = "1111";
end behavior;