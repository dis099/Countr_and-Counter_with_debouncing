library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
entity Counter is
    Port ( clock_100MHz : in STD_LOGIC;
           reset : in STD_LOGIC;
           button : in STD_LOGIC;
           enable_pulse : out STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (3 downto 0));
end Counter;
 
architecture Behavioral of Counter is
-- signal decalrations
signal Q: std_logic_vector(3 downto 0); 
signal button_buf1 : std_logic;
signal button_buf2 : std_logic;
signal button_pulse : std_logic;

begin
--button detection
button_buf1 <= button when rising_edge(clock_100MHz);
button_buf2 <= button_buf1 when rising_edge(clock_100MHz);
button_pulse <= button_buf1 and not button_buf2;

enable_pulse <= button_pulse;

--counting section
process (clock_100MHz)

 begin
    if clock_100MHz'event and clock_100MHz = '1' then
       if reset = '1' then
         Q <= (others => '0');
       elsif button_pulse = '1' then
         Q <= std_logic_vector(unsigned(Q) + 1);
       end if;
    end if;
    C_out <= Q;
end process;

end Behavioral;