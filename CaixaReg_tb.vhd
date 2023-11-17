library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.std_logic_unsigned.all;

entity CaixaReg_tb is
end CaixaReg_tb;

architecture teste of CaixaReg_tb is

  component CaixaReg is
    port (
        reset : in STD_LOGIC;
        soma : in STD_LOGIC;
        subtrai : in STD_LOGIC;
        entrada : in STD_LOGIC_VECTOR(7 downto 0);
        OK : in STD_LOGIC;
        clock : in STD_LOGIC;
        valor : out STD_LOGIC_VECTOR(7 downto 0);
        increment : out STD_LOGIC_VECTOR(7 downto 0)
    );
  end component;

  constant PERIODO : time := 10 ns;

  signal reset_tb, soma_tb, subtrai_tb, ok_tb: std_logic;
  signal entrada_tb, valor_tb, increment_tb: STD_LOGIC_VECTOR(7 downto 0);
  signal clock_tb : std_logic := '0';

begin

  instancia_CaixaReg : CaixaReg port map(reset => reset_tb, clock => clock_tb, soma => soma_tb, subtrai => subtrai_tb, entrada => entrada_tb, OK => ok_tb, valor => valor_tb, increment => increment_tb);

  soma_tb <= '0', '1' after 1 ms, '0' after 2 ms;
  subtrai_tb <= '0';
  entrada_tb <= "00000000", "00000011" after 3 ms, "00000000" after 5 ms;
  ok_tb <= '0', '1' after 4 ms;
  clock_tb <= not clock_tb after PERIODO/2;
  reset_tb <= '0', '1' after 1 ns, '0' after 2 ns, '1' after 7 ms;

end teste;