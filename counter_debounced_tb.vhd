library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_debounced_tb is
--  Port ( );
end counter_debounced_tb;

architecture Behavioral of counter_debounced_tb is

component counter_debounced is
    Port ( 
           clock_100MHz : in STD_LOGIC;
           reset : in std_logic;
           button : in STD_LOGIC;
           C_out : out STD_LOGIC_VECTOR (3 downto 0);
           enable_pulse : out STD_LOGIC
           );  
end component;
      
     signal enable_pulse_tb : std_logic;
     signal C_out_tb : STD_LOGIC_VECTOR (3 downto 0);
     signal clock_100MHz_tb : STD_LOGIC;
     signal reset_tb : STD_LOGIC;
     signal button_tb : STD_LOGIC;
     
begin

uut: counter_debounced
port map( clock_100MHz => clock_100MHz_tb,
          reset => reset_tb,
          button =>button_tb,
          enable_pulse => enable_pulse_tb,
          C_out => C_out_tb);
          
          
        
clock : process
begin          
clock_100MHz_tb <= '0';
wait for 10 ns;
clock_100MHz_tb <= '1';
wait for 10 ns;
end process;

button: process
begin
--button off
button_tb <= '0';
wait for 10 ms;

--adding noise
button_tb <= '0';
wait for 1 ms;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 3 us;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 2 us;
button_tb <= '1';
wait for 1 us;

button_tb <= '1';
wait for 2 us;
button_tb <= '0';
wait for 1 ms;
button_tb <= '1';
wait for 3 us;
button_tb <= '0';
wait for 1 us;
button_tb <= '1';
wait for 2 us;
button_tb <= '0';
wait for 1 ms;

--button ON
button_tb <= '1';
wait for 10 ms;

--adding noise
button_tb <= '0';
wait for 1 ms;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 3 us;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 2 us;
button_tb <= '1';
wait for 1 us;

button_tb <= '0';
wait for 1 ms;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 3 us;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 2 us;
button_tb <= '1';
wait for 1 us;

button_tb <= '0';
wait for 1 ms;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 3 us;
button_tb <= '1';
wait for 1 us;
button_tb <= '0';
wait for 2 us;
button_tb <= '1';
wait for 1 us;

end process;

reset_proc: process
begin
reset_tb <= '1';
wait for 30 ns;
reset_tb <= '0';
wait for 160 ms;
wait;    
end process;         
end Behavioral;
