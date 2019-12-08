library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity VGA is
port(Clk50_in : in std_logic;         
       Red       : out std_logic;         
       Green     : out std_logic;
       Blue     : out std_logic;
       Hs_out   : out std_logic;         
       Vs_out   : out std_logic);      
end VGA;
 
architecture Behavioral of VGA is
signal Clk25 : std_logic;
signal Hs : std_logic_vector (9 downto 0);
signal Vs : std_logic_vector (9 downto 0);
constant hPixels: std_logic_vector(9 downto 0) := "1100100000";
Begin
 

Process (Clk50_in)
Begin
	if Clk50_in'event and Clk50_in = '1' then
	if (Clk25 = '0') then              
 
	Clk25 <= '1';
	else
	Clk25 <= '0';
	end if;
	end if;
end Process;

Process (Clk25)
Begin
	if Clk25'event and Clk25 = '1' then
--DIBUJO
	
	--COLUMNA 1
	--MARCO IZQUIERDO ROJO
	if Hs >= "0010010011" and Hs <= "0011100101" and Vs >= "0000000001" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	-------------------------------------------------------------------------------------------------
	--COLUMNA 2
	--CUADRO ROJO ARRIBA IZQ
	elsif Hs >= "0011100110" and Hs <= "0100110111" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "0011100110" and Hs <= "0100110111" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO ABAJO IZQ
	elsif Hs >= "0011100110" and Hs <= "0100110111" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	-------------------------------------------------------------------------------------------------
	--COLUMNA 3
	--CUADRO ROJO 2 IZQ
	elsif Hs >= "0100111000" and Hs <= "0110001001" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "0100111000" and Hs <= "0110001001" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO ABAJO IZQ
	elsif Hs >= "0100111000" and Hs <= "0110001001" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	--------------------------------------------------------------------------------------
	--COLUMNA 3                     
	--CUADRO ROJO 1/2 Arriba
	elsif Hs >= "0110001010" and Hs <= "0110110010" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "0110001010" and Hs <= "0110110010" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO 1/2 ABAJO
	elsif Hs >= "0110001010" and Hs <= "0110110010" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--DIVISION EN MEDIO ROJO
	elsif Hs >= "0110110011" and Hs <= "0111011011" and Vs >= "0000000001" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';	
	Green <= '0';
	
	--COLUMNA 4
	--DIVISION EN MEDIO ROJO
	elsif Hs >= "0111011100" and Hs <= "1000000100" and Vs >= "0000000001" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';	
	Green <= '0';
	
	--DIVISION EN MEDIO ROJO 1/2
	elsif Hs >= "1000000101" and Hs <= "1000101101" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';	
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "1000000101" and Hs <= "1000101101" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO 1/2 ABAJO
	elsif Hs >= "1000000101" and Hs <= "1000101101" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	-------------------------------------------------------------------------------------------------
	--COLUMNA 5 
	--CUADRO ROJO 2 DER
	elsif Hs >= "1000101110" and Hs <= "1001111111" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "1000101110" and Hs <= "1001111111" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO 2 ABAJO
	elsif Hs >= "1000101110" and Hs <= "1001111111" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	--------------------------------------------------------------------------------------------------
	--COLUMNA 6 
	--CUADRO ROJO 3 DER
	elsif Hs >= "1010000000" and Hs <= "1011010000" and Vs >= "0000000001" and Vs <= "0001100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO enmedio IZQ
	elsif Hs >= "1010000000" and Hs <= "1011010000" and Vs >= "0011010101" and Vs <= "0100100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	
	--CUADRO ROJO 3 ABAJO
	elsif Hs >= "1010000000" and Hs <= "1011010000" and Vs >= "0110010011" and Vs <= "0111100100" then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	--------------------------------------------------------------------------------------------------
	--COLUMNA 7
	-- MARCO DERECHO
	elsif Hs >= "1011010001" and Hs <= "1100100000" and Vs >= "0000000001" and Vs <= "0111100100" 
	then
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	else 
	
	--AZUL
	Red <= '0';
	Blue <= '1';
	Green <= '0';
	end if;
	
	--Termina el dibujo
	if (hs > "0000000000") and (hs < "0001100001") then
	hs_out <= '0';
	else
	hs_out <= '1';
	end if;

	if (vs > "0000000000") and (vs < "0000000011")then
	vs_out <= '0';
	else
	vs_out <= '1';
	end if;

	hs <= hs + "0000000001" ;

	if (hs= "1100100000") then    
	vs <= vs + "0000000001";       
	hs <= "0000000000";
	end if;
	if (vs= "1000001001") then                 
	vs <= "0000000000";
	end if;
	end if;
	
	end process;
end Behavioral;


