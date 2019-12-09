library ieee;
use ieee.std_logic_1164.all;

entity tb_VGA is
end tb_VGA;

architecture tb of tb_VGA is

    component VGA
        port (Clk50_in : in std_logic;
              Red      : out std_logic;
              Green    : out std_logic;
              Blue     : out std_logic;
              Hs_out   : out std_logic;
              Vs_out   : out std_logic);
    end component;

    signal Clk50_in : std_logic;
    signal Red      : std_logic;
    signal Green    : std_logic;
    signal Blue     : std_logic;
    signal Hs_out   : std_logic;
    signal Vs_out   : std_logic;

    constant TbPeriod : time := 1000 ns; --Periodo de tiempo
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : VGA
    port map (Clk50_in => Clk50_in,
              Red      => Red,
              Green    => Green,
              Blue     => Blue,
              Hs_out   => Hs_out,
              Vs_out   => Vs_out);

    --Generar clock
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --Main clock is Clk_in
    Clk50_in <= TbClock;

    stimuli : process
    begin
    --Inicialización
        Red <= '0';
	    Blue <= '0';	
	    Green <= '0';
        wait for 100 ns;
        --Estimulos
        Red <= '1';
        Green <= '1';
        Blue <= '1';
        wait for 100 ns;
        
        Red <= '0';
        Green <= '1';
        Blue <= '1';
        wait for 100 ns;
        
        Red <= '1';
        Green <= '0';
        Blue <= '0';
        wait for 100 ns;
        
        Red <= '0';
        Green <= '1';
        Blue <= '0';
        wait for 100 ns;
        
        Red <= '0';
        Green <= '0';
        Blue <= '0';
        wait for 100 ns;
        
        wait for 100 * TbPeriod;
        

        --Parar reloj y para estímulos
        TbSimEnded <= '1';
        wait;
    end process;

end tb;