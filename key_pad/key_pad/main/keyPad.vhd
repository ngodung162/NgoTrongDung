----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:44:19 11/09/2019 
-- Design Name: 
-- Module Name:    keyPad - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity keyPad is
	port
	(
		CLK : IN STD_LOGIC;
		Row_Pins : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Col_Pins : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
		SEG_PIN	:	out std_logic_vector(7 downto 0);
		SEG_SCAN	:	out std_logic_vector(1 downto 0)
	);
end keyPad;

architecture Behavioral of keyPad is
	TYPE STT_COT IS (COT1,COT2,COT3,COT4);
	SIGNAL System_State : STT_COT:= COT1;
	SIGNAL LOCAL_KEYPAD : integer range 0  to 16 :=0;
	SIGNAL C :STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL A : std_logic_vector(7 downto 0);
	SIGNAL B : std_logic_vector(1 downto 0);
begin

	LED:process(CLK)
		variable stt : std_logic:='0';
	begin
		if(LOCAL_KEYPAD < 10) then
			stt := '0';
		else
			stt := not stt;
		end if;
		if(stt = '1') then
			B <= "01";
			A<=  "10011111";
		else
			B <= "10";	
			case LOCAL_KEYPAD is
				When 0 =>A<=  "00000011";
				When 1 =>A<=  "10011111";
				When 2 =>A<=  "00100101";
				When 3 =>A<=  "00001101";
				When 4 =>A<=  "10011001";
				When 5 =>A<=  "01001001";
				When 6 =>A<=  "01000001";
				When 7 =>A<=  "00011111";
				When 8 =>A<=  "00000001";
				When 9 =>A<=  "00001001";
				When 10 =>
					A<=  "00000011";
				When 11 =>
					A<=  "10011111";
				When 12 =>
					A<= "00100101";
				When 13 =>
					A<=  "00001101";
				When 14 =>
					A<=  "10011001";
				When 15 =>
					A<=  "00000011";
				when others => null;
			end case;
		end if;
	end process;
	SEG_PIN <= A;
	SEG_SCAN <= B;
	
	KEY_PAD:process(CLK)
	begin
		
			CASE System_State IS
				WHEN COT1=>
					Col_Pins <= "0001";
						CASE Row_Pins IS
						WHEN "1110"=>
							LOCAL_KEYPAD <= 0;
						WHEN "1101"=>
							LOCAL_KEYPAD <= 1;
						WHEN "1011"=>
							LOCAL_KEYPAD <= 2;
						WHEN "0111"=>
							LOCAL_KEYPAD <= 3;
							System_State <=COT2;
						WHEN OTHERS =>
							C <="1111";
						END CASE;

				WHEN COT2=>
						Col_Pins <= "0010";
						CASE Row_Pins IS
						WHEN "1110"=>
							LOCAL_KEYPAD <= 4;
						WHEN "1101"=>
							LOCAL_KEYPAD <= 5;
						WHEN "1011"=>
							LOCAL_KEYPAD <= 6;
						WHEN "0111"=>
							LOCAL_KEYPAD <= 7;
							System_State <=COT3;
						WHEN OTHERS =>
							C <="1111";
						END CASE;
					
				WHEN COT3=>
					Col_Pins <= "0100";
						CASE Row_Pins IS
						WHEN "1110"=>
							LOCAL_KEYPAD <= 8;
						WHEN "1101"=>
							LOCAL_KEYPAD <= 9;
						WHEN "1011"=>
							LOCAL_KEYPAD <= 10;
						WHEN "0111"=>
							LOCAL_KEYPAD <= 11;
							System_State <=COT4;
						WHEN OTHERS =>
							C <="1111";
						END CASE;
					
				WHEN COT4=>
					Col_Pins <= "1000";
						CASE Row_Pins IS
						WHEN "1110"=>
							LOCAL_KEYPAD <= 12;
						WHEN "1101"=>
							LOCAL_KEYPAD <= 13;
						WHEN "1011"=>
							LOCAL_KEYPAD <= 14;
						WHEN "0111"=>
							LOCAL_KEYPAD <= 15;
							System_State <=COT1;
						WHEN OTHERS =>
							C <="1111";
						END CASE;
				WHEN OTHERS =>
					C <="1111";
			END CASE;

	end process;

end Behavioral;

