entity Lab2_BASYS3 is 
	port ( 
			sw: in std_logic_vector(2 downto 0);
			an: out std_logic_vector(3 downto 0);
			btnL: in std_logic;
			btnR: in std_logic; 
			seg: out std_logic_vector(6 downto 0);
			led: out std_logic_vector(15 downto 0)
		);
		end Lab2_BASYS3;
		
architecture Lab2_BASYS3_ARCH of Lab2_BASYS3 is
	component Lab2 --ports that we have on our component like in TB
		port ( 
			--inputs
			switches: in std_logic_vector(2 downto 0);
			leftButton: in std_logic; 
			rightButton: in std_logic;
			--outputs
			segments: out std_logic_vector(6 downto 0); --7seg display
			leds: out std_logic_vector(15 downto 0) --leds
			); 
	end component;
begin
	an <= "1110"; --this means the right segment will light up
	--these are active low, 0=ON, 1=OFF
	SWITCH_DRIVER: Lab2 port map (  -- named driver just like in TB
		switches => sw(2 downto 0), -- attach to specific hardware
		leftButton => btnL,
		rightButton => btnR,
		segments => seg,
		leds => led
		);
end Lab2_BASYS3_ARCH;