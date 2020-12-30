----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2020 02:44:01 PM
-- Design Name: 
-- Module Name: ORer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ORer is
    PORT (
        -- inputs
        inputC : IN STD_LOGIC_VECTOR(3 downto 0);
        inputD : IN STD_LOGIC_VECTOR(3 downto 0);
        
        -- outputs
        output1 : OUT STD_LOGIC_VECTOR(3 downto 0));
end ORer;

architecture Behavioral of ORer is

begin

output1(0) <= inputC(0) OR inputD(0);
output1(1) <= inputC(1) OR inputD(1);
output1(2) <= inputC(2) OR inputD(2);
output1(3) <= inputC(3) OR inputD(3);

end Behavioral;
