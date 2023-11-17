library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CaixaReg is
    Port (
        reset : in STD_LOGIC;
        soma : in STD_LOGIC;
        subtrai : in STD_LOGIC;
        entrada : in STD_LOGIC_VECTOR(7 downto 0);
        OK : in STD_LOGIC;
        clock : in STD_LOGIC;
        valor : out STD_LOGIC_VECTOR(7 downto 0);
        increment : out STD_LOGIC_VECTOR(7 downto 0)
    );
end CaixaReg;

architecture Behavioral of CaixaReg is
    type state_type is (initial, hold, addition, reduction);
    signal state : state_type;
    signal temp_increment : STD_LOGIC_VECTOR(7 downto 0);
	 signal temp_valor : STD_LOGIC_VECTOR(7 downto 0);
	 signal is_done : boolean := false;
begin
    process(clock, reset)
    begin
		  
        if reset = '1' then
            state <= initial;
        elsif rising_edge(clock) then
            case state is
                when initial =>
						  valor <= "00000000";
						  increment <= "00000000";
                    state <= hold;

                when hold =>
						  if is_done = false then
								temp_valor <= temp_valor + temp_increment;
								valor <= temp_valor;
								is_done <= true;
						  end if;
                    if soma = '1' and subtrai = '0' then
								is_done <= false;
                        state <= addition;
                    elsif soma = '0' and subtrai = '1' then
								is_done <= false;
                        state <= reduction;
                    else
                        state <= hold;
                    end if;

                when addition =>
                    temp_increment <= entrada;
                    if OK = '1' then
                        state <= hold;
                    else
                        state <= addition;
                    end if;

                when reduction =>
                    temp_increment <= entrada;
                    if OK = '1' then
                        state <= hold;
                    else
                        state <= reduction;
                    end if;

                when others =>
                    state <= initial;
            end case;
        end if;
    end process;

end Behavioral;
