--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:53:52 11/10/2019
-- Design Name:   
-- Module Name:   C:/Users/Nhan_Ma/Desktop/key_pad/main/tb1.vhd
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
 
ENTITY tb1 IS
END tb1;
 
ARCHITECTURE behavior OF tb1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT keyPad
    PORT(
         CLK : IN  std_logic;
         Row_Pins : IN  std_logic_vector(3 downto 0);
         Col_Pins : OUT  std_logic_vector(3 downto 0);
         SEG_PIN : OUT  std_logic_vector(7 downto 0);
         SEG_SCAN : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal Row_Pins : std_logic_vector(3 downto 0) := "0000";
   signal Col_Pins : std_logic_vector(3 downto 0) := "0001";

 	--Outputs
   signal SEG_PIN : std_logic_vector(7 downto 0);
   signal SEG_SCAN : std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
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
	
	 A_process :process
   begin
		wait for CLK_period/2;
		Row_Pins <= "1110";
		wait for CLK_period/2;
		Row_Pins <= "1101";
		wait for CLK_period/2;
		Row_Pins <= "1011";
		wait for CLK_period/2;
		Row_Pins <= "0111";
   end process;


END;
