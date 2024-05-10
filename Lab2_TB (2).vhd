library ieee;
use ieee.std_logic_1164.all;

entity Lab2_TB is
end Lab2_TB;

architecture Lab2_TB_ARCH of Lab2_TB is
    --UNIT UNDER TEST (UUT)
    component Lab2
        port(
            switches : in std_logic_vector(2 downto 0);
            leftButton : in std_logic;
            rightButton : in std_logic;
            leds : out std_logic_vector(15 downto 0);
            segments : out std_logic_vector(6 downto 0)
        );
    end component;

    --the signals w/ uut
    --inputs
    signal switches :std_logic_vector(2 downto 0);
    signal leftButton: std_logic;
    signal rightButton: std_logic;
    --outputs
    signal leds : std_logic_vector(15 downto 0);
    signal segments : std_logic_vector(6 downto 0);

begin
    --UUT section
    UUT: Lab2 port map (
        switches => switches, --assigning to the name to test, linking them together essentially per design diagram
        leftButton => leftButton,
        rightButton => rightButton,
        leds => leds,
        segments => segments
    );
    SWITCH_DRIVER: process
    begin
    
    --NO BUTTON PRESSED!
        --switches off and no button held down (0)
        switches <= "000"; leftButton <= '0'; rightButton <= '0'; 
        wait for 20 ns;
        
    --LEFT BUTTON PRESSED!
        --switches from left to right are "001" and the left button is pressed (1L)
        switches <= "001"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;

        --switches from left to right are "001" and the left button is pressed (2L)
        switches <= "010"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;

        --switches from left to right are "001" and the left button is pressed (3L)
        switches <= "011"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;


        --switches from left to right are "001" and the left button is pressed (4L)
        switches <= "100"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;


        --switches from left to right are "001" and the left button is pressed (5L)
        switches <= "101"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;


        --switches from left to right are "001" and the left button is pressed (6L)
        switches <= "110"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;


        --switches from left to right are "001" and the left button is pressed (7L)
        switches <= "111"; leftButton <= '1'; rightButton <= '0';
        wait for 20 ns;

    --RIGHT BUTTON PRESSED!

        --switches from left to right are "010" and the right button is pressed (1R)
        switches <= "001"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;

        --switches from left to right are "010" and the right button is pressed (2R)
        switches <= "010"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
        
        --switches from left to right are "011" and the right button is pressed (3R)
        switches <= "011"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
                
        --switches from left to right are "100" and the right button is pressed (4R)
        switches <= "100"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
                
        --switches from left to right are "010" and the right button is pressed (5R)
        switches <= "101"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
                
        --switches from left to right are "010" and the right button is pressed (6R)
        switches <= "110"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
                
        --switches from left to right are "010" and the right button is pressed (7R)
        switches <= "111"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
                
        --switches from left to right are "010" and the right button is pressed
        switches <= "010"; leftButton <= '0'; rightButton <= '1';
        wait for 20 ns;
        
        -- Test Case Last: All switches on, both buttons pressed
        switches <= "111"; leftButton <= '1'; rightButton <= '1';
        wait for 20 ns;
    --BOTH BUTTONS PRESSED?
        
        wait; -- suspend process forever
    end process;
end Lab2_TB_ARCH;
