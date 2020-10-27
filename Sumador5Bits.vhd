library ieee;
use ieee.std_logic_1164. all;

entity Sumador5Bits is
	port(
		a,b	: in std_logic_vector(4 downto 0); --Entrada
		s		: out std_logic_vector(4 downto 0); --Salida
		c_out	: out std_logic); --Acarreo de salida
end Sumador5bits;

architecture structural of Sumador5Bits is
	--Acarreos intermedios
	signal c: std_logic_vector(5 downto 0);
	component Sumador1Bit
	port(
		a_i		: in std_logic; --bit de entrada
		b_i		: in std_logic; --bit de entrada
		c_i		: in std_logic; --acarreo de entrada
		s_i		: out std_logic;--Salida
		c_i_mas_1: out std_logic --Acarreo de salida
	
	);
	end component;
begin
	c(0) <= '0'; -- Inicialemte el acarreo es 0
	c_out <= c(5); -- el acarreo final es el de salida
	
	GenSum : for i in 0 to 4 generate
		--cada sumador de un 1 bit
		i_Sumador1Bit : Sumador1Bit
		port map(
			a_i		 => a(i),
			b_i		 => b(i),
			c_i		 => c(i),
			s_i		 => s(i),
			c_i_mas_1 => c(i+1)
		);
	end generate GenSum;
end structural;
		
	