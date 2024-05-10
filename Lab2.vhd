--******************************************************************************
--*
--* Name: Lab2
--* Designer: Michaela Crego
--*
--*     This component will take inputs of the first three switches on the board (the three right ones)
--*     The switches are representative of binary. (000)=0 (111)=7
--*     The the amount of LEDs lit up is dependent on the value of the 3 switches
--*     The position/side of the LEDs is dependent on which button is pressed (right or left)
--*     Lastly, the 7-segment display will light up the decimal number represented by the switch
--*             -Example: if right button is pressed and all three switches are up, will light up 7 right LEDs & 7-seg will display num "7"
--*     
--******************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; -- For unsigned type and arithmetic operations

entity Lab2 is
    port (
        switches: in std_logic_vector(2 downto 0); --switch inputs (active high)
        leftButton: in std_logic; --left button input 
        rightButton: in std_logic; --right button input
        
        leds: out std_logic_vector(15 downto 0); -- LED outputs, corrected to 16 LEDs
        segments: out std_logic_vector(6 downto 0) --7-segment display (1=off, 0=on)
    );
end Lab2;

architecture Lab2_ARCH of Lab2 is
    signal segs: std_logic_vector(6 downto 0); --[internal]signal for binary (switch) to decimal (7-seg display)
begin
    --THE 2 LEDS WE ARE NOT USING:
    leds(8 downto 7) <= "00"; --these two LEDs will always be 0 since we are not using them
    --LEFTLEDS
    LEFT_LEDS: process(switches, leftButton)
    begin
        if leftButton='1' then
            case switches is
                when "000" => leds(15 downto 9) <= "0000000"; -- 0
                when "001" => leds(15 downto 9) <= "1000000"; -- 1 START WITH MSB BECAUSE LEFT LEDS
                when "010" => leds(15 downto 9) <= "1100000"; -- 2
                when "011" => leds(15 downto 9) <= "1110000"; -- 3 
                when "100" => leds(15 downto 9) <= "1111000"; -- 4
                when "101" => leds(15 downto 9) <= "1111100"; -- 5
                when "110" => leds(15 downto 9) <= "1111110"; -- 6
                when others => leds(15 downto 9)  <= "1111111"; -- 7
            end case;
            else
                 leds(15 downto 9) <= "0000000"; -- OFF

           end if;
       end process;

    --RIGHTLEDS
    RIGHT_LEDS: process(switches, rightButton) --separate processes so if both buttons pushed, these if statements would both be true.
    begin
        if rightButton='1' then
            case switches is
                when "000" => leds(6 downto 0) <= "0000000"; -- 0
                when "001" => leds(6 downto 0) <= "0000001"; -- 1 START WITH LSB BECAUSE RIGHT LEDS
                when "010" => leds(6 downto 0) <= "0000011"; -- 2
                when "011" => leds(6 downto 0) <= "0000111"; -- 3
                when "100" => leds(6 downto 0) <= "0001111"; -- 4
                when "101" => leds(6 downto 0) <= "0011111"; -- 5
                when "110" => leds(6 downto 0) <= "0111111"; -- 6
                when others => leds(6 downto 0)  <= "1111111"; -- 7
             end case;
             else
               leds(6 downto 0) <= "0000000"; -- OFF
         end if;
      end process;


    --SEVENSEG
    process(switches) --7-seg is gfedcba and when 0=on when 1=off per the manual, so I mirrored here essentially
    begin
            case switches is
                when "000" => segments <= "1000000"; -- 0 all are on except g
                when "001" => segments <= "1111001"; -- 1 
                when "010" => segments <= "0100100"; -- 2
                when "011" => segments <= "0110000"; -- 3
                when "100" => segments <= "0011001"; -- 4
                when "101" => segments <= "0010010"; -- 5
                when "110" => segments <= "0000010"; -- 6
                when "111" => segments <= "1111000"; -- 7
                when others => segments <= "1111111"; --OFF WHEN OTHERSS
            end case;
    end process;


    
end Lab2_ARCH;

