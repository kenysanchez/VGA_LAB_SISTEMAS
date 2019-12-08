
--VGA CON DIBUJO DE COLORES 

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
	if Hs >= "0010010011" and Hs <= "0011100101" and Vs >= "0000000001" and Vs <= "0111100100" then
	--BLANCO
	Red <= '1';
	Blue <= '1';
	Green <= '1';
	elsif Hs >= "0011100110" and Hs <= "0100110111" and Vs >= "0000000001" and Vs <= "0111100100" then
	--AMARILLO
	Red <= '1';
	Blue <= '0';
	Green <= '1';
	elsif Hs >= "0100111000" and Hs <= "0110001001" and Vs >= "0000000001" and Vs <= "0111100100" then
	--AZUL CLARITO
	Red <= '0';
	Blue <= '1';
	Green <= '1';
	elsif Hs >= "0110001010" and Hs <= "0111011011" and Vs >= "0000000001" and Vs <= "0111100100" then
	--VERDE
	Red <= '0';
	Blue <= '0';
	Green <= '1';
	elsif Hs >= "0111011100" and Hs <= "1000101101" and Vs >= "0000000001" and Vs <= "0111100100" then
	--ROSA
	Red <= '1';
	Blue <= '1';	
	Green <= '0';
	elsif Hs >= "1000101110" and Hs <= "1001111111" and Vs >= "0000000001" and Vs <= "0111100100" then
	--ROJO
	Red <= '1';
	Blue <= '0';
	Green <= '0';
	elsif Hs >= "1010000000" and Hs <= "1011010000" and Vs >= "0000000001" and Vs <= "0111100100" then
	--AZUL
	Red <= '0';
	Blue <= '1';
	Green <= '0';
	elsif Hs >= "1011010001" and Hs <= "1100100000" and Vs >= "0000000001" and Vs <= "0111100100" 
	-- NEGRO
	then
	Red <= '0';
	Blue <= '0';
	Green <= '0';
	else 
	--NEGRO
	Red <= '0';
	Blue <= '0';
	Green <= '0';
	end if;
	--Termina el dibujo

	
	if (Hs > "0000000000") and (Hs < "0001100001") then
	Hs_out <= '0';
	else
	Hs_out <= '1';
	end if;

	if (Vs > "0000000000") and (Vs < "0000000011")
	then
	Vs_out <= '0';
	else
	Vs_out <= '1';
	end if;
	Hs <= Hs + "0000000001" ;

	if (Hs= "1100100000") then    
	Vs <= Vs + "0000000001";       
	Hs <= "0000000000";
	end if;
	
	if (Vs= "1000001001") then                 
	Vs <= "0000000000";
	end if;
	end if;
	
	end process;
	end Behavioral;