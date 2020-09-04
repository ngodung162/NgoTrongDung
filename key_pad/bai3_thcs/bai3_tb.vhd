USE ieee.std_logic_1164.ALL;
 USE ieee.std_logic_Unsigned.ALL;
 USE ieee.std_logic_Arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testbent IS
END testbent;
 
ARCHITECTURE behavior OF testbent IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fir_filter_4
    PORT(
         i_clk : IN  std_logic;
         i_rstb : IN  std_logic;
         i_coeff_0 : IN  std_logic_vector(7 downto 0);
         i_coeff_1 : IN  std_logic_vector(7 downto 0);
         i_coeff_2 : IN  std_logic_vector(7 downto 0);
         i_coeff_3 : IN  std_logic_vector(7 downto 0);
         i_data : IN  std_logic_vector(7 downto 0);
         o_data : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i_clk : std_logic := '0';
   signal i_rstb : std_logic := '0';
   signal i_coeff_0 : std_logic_vector(7 downto 0) := (others => '0');
   signal i_coeff_1 : std_logic_vector(7 downto 0) := (others => '0');
   signal i_coeff_2 : std_logic_vector(7 downto 0) := (others => '0');
   signal i_coeff_3 : std_logic_vector(7 downto 0) := (others => '0');
   signal i_data : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal o_data : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant i_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fir_filter_4 PORT MAP (
          i_clk => i_clk,
          i_rstb => i_rstb,
          i_coeff_0 => i_coeff_0,
          i_coeff_1 => i_coeff_1,
          i_coeff_2 => i_coeff_2,
          i_coeff_3 => i_coeff_3,
          i_data => i_data,
          o_data => o_data
        );
	process
		begin
	i_clk <= not i_clk after 10 ns;
	for i in 0 to 7 loop
		wait for 10 ns;
		i_coeff_0 <= i_coeff_0 + 1 ;
	i_coeff_1 <= i_coeff_1 + 1 ;
	i_coeff_2 <= i_coeff_2 + 1 ;
	i_coeff_3 <= i_coeff_3 + 1 ;
	end loop;
	end process;
END;
