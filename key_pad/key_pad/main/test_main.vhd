--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:53:16 11/09/2019
-- Design Name:   
-- Module Name:   C:/Users/Nhan_Ma/Desktop/key_pad/main/test_main.vhd
-- Project Name:  main
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: keyPad
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_main IS
END test_main;
 
ARCHITECTURE behavior OF test_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyPad
    PORT(
         CLK : IN  std_logic;
         Row_Pins : IN  std_logic_vector(3 downto 0);
         Col_Pins : IN  std_logic_vector(3 downto 0);
         SEG_PIN : OUT  std_logic_vector(7 downto 0);
         SEG_SCAN : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Row_Pins : std_logic_vector(3 downto 0) := (others => '0');
	SIGNAL LOCAL_KEYPAD : integer range 0  to 16 :=0;
 	--Outputs
   signal Col_Pins : std_logic_vector(3 downto 0);
   signal SEG_PIN : std_logic_vector(7 downto 0);
   signal SEG_SCAN : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: keyPad PORT MAP (
          CLK => CLK,
          Row_Pins => Row_Pins,
          Col_Pins => Col_Pins,
          SEG_PIN => SEG_PIN,
          SEG_SCAN => SEG_SCAN
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		Col_Pins<= "0001";
		Row_Pins <="1110";		
		wait for 100 ns;
		Col_Pins <= "0010";
		Row_Pins <="1101";
		wait for 100 ns;
		Col_Pins <= "0100";
		Row_Pins<="1011";
		wait for 100 ns;
		Col_Pins <= "1000";	
		Row_Pins <="0111";
		wait for 100 ns;
   end process;

END;
