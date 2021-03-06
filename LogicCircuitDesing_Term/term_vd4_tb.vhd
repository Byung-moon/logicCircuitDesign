LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY term_vd4_tb IS
END term_vd4_tb;
 
ARCHITECTURE behavior OF term_vd4_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT term_vd_mod
    PORT(
         coin_50 : IN  std_logic;
         coin_100 : IN  std_logic;
         coin_500 : IN  std_logic;
         coffee : IN  std_logic;
         clk : IN  std_logic;
         money_out : IN  std_logic;
         rst : IN  std_logic;
         coffee_out : OUT  std_logic;
         nomoney : OUT  std_logic;
         cout_50 : OUT  std_logic;
         cout_100 : OUT  std_logic;
         cout_500 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal coin_50 : std_logic := '0';
   signal coin_100 : std_logic := '0';
   signal coin_500 : std_logic := '0';
   signal coffee : std_logic := '0';
   signal clk : std_logic := '0';
   signal money_out : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal coffee_out : std_logic;
   signal nomoney : std_logic;
   signal cout_50 : std_logic;
   signal cout_100 : std_logic;
   signal cout_500 : std_logic;

   -- Clock period definitions
  -- constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: term_vd_mod PORT MAP (
          coin_50 => coin_50,
			 cout_50 => cout_50,
          coin_100 => coin_100,
			 cout_100 => cout_100,
          coin_500 => coin_500,
			 cout_500 => cout_500,
          coffee => coffee,
			 coffee_out => coffee_out,
			 money_out => money_out,
          clk => clk,
          rst => rst,    
          nomoney => nomoney
          
        );


 pro1 : process
  begin
   clk <='0';wait for 10ns;
	clk <='1';wait for 10ns;
	
	end process pro1;
	
 pro2 : process
  begin
	coin_500 <='0'; wait for 40ns;
	
	coin_500 <='1'; wait for 20ns;
	coin_500 <='0'; wait for 1ms;

	end process pro2;
	
 pro3 : process
	begin
	coin_100 <='0'; wait for 80ns;
	
	coin_100 <='1'; wait for 20ns;
	coin_100 <='0'; wait for 20ns;
	
	coin_100 <='1'; wait for 20ns;
	coin_100 <='0'; wait for 1ms;
		
	end process pro3;
 
 pro4 : process
   begin
	coin_50 <='0'; wait for 160ns;
	
	coin_50 <='1'; wait for 20ns;
	coin_50 <='0'; wait for 1ms;
	end process pro4;
	
 pro5 : process
   begin
   rst <='0'; wait for 200ns;
	
	rst <='1'; wait for 5ns;
	rst <='0'; wait for 1ms;
	
   end process pro5;	
	
 pro6 : process
   begin
   coffee <='0'; wait for 240ns;
	
	coffee <='1'; wait for 20ns;
	coffee <='0'; wait for 1ms;
	
   end process pro6;	
	

 
 
 END;