library ieee;
use ieee.std_logic_1164. all;

Entity Practica5 is
	port(
		a,b		: in std_logic_vector(4 downto 0); --Entrada
		c_out		: out std_logic;--Desbordamiento
		salida1	: out std_logic_vector(6 downto 0);	--Primer bin a 7 seg
		salida2	: out std_logic_vector(6 downto 0)  --Segundo bin a 7 seg	
	);
end Practica5;

architecture structural of Practica5 is
	--señales intermedias
	signal s : std_logic_vector(4 downto 0);
	signal e1: std_logic_vector(3 downto 0);
	signal e2: std_logic_vector(3 downto 0);
	
	component Sumador5Bits
	port(
		a,b	: in std_logic_vector(4 downto 0); --Entrada
		s		: out std_logic_vector(4 downto 0); --Salida
		c_out	: out std_logic);
	end component;
	component BinA7Seg
	port( 
		E			:in std_logic_vector(3 downto 0);
		salida	:out std_logic_vector(6 downto 0)
	);
	end component;
	
begin

e1 <= s(3 downto 0);
e2 <= '0'&'0'&'0'&s(4);



i1 : Sumador5Bits
	port map(
	a			=>		 a,
	b			=>		 b,
	c_out 	=>	c_out,
	s			=>		 s
	);

i2 : BinA7Seg
	port map(
	E => e1,
	salida 	=>	salida1
	);

i3 : BinA7Seg
	port map(
	E => e2,
	salida 	=>	salida2
	);
end structural;

