----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2020 02:43:33 PM
-- Design Name: 
-- Module Name: ANDer - Behavioral
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

entity ANDer is
    PORT (
        -- inputs
        inputA : IN STD_LOGIC_VECTOR(3 downto 0);
        inputB : IN STD_LOGIC_VECTOR(3 downto 0);
        
        -- outputs
        output0 : OUT STD_LOGIC_VECTOR(3 downto 0));
end ANDer;

architecture Behavioral of ANDer is

begin

output0(0) <= inputA(0) AND inputB(0);
output0(1) <= inputA(1) AND inputB(1);
output0(2) <= inputA(2) AND inputB(2);
output0(3) <= inputA(3) AND inputB(3);

end Behavioral;
