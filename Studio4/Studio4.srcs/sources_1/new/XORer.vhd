----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2020 02:50:58 PM
-- Design Name: 
-- Module Name: XORer - Behavioral
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

entity XORer is
    PORT (
        -- inputs
        inputE : IN STD_LOGIC_VECTOR(3 downto 0);
        inputF : IN STD_LOGIC_VECTOR(3 downto 0);
        
        -- outputs
        output2 : OUT STD_LOGIC_VECTOR(3 downto 0));
end XORer;

architecture Behavioral of XORer is

begin

output2(0) <= inputE(0) XOR inputF(0);
output2(1) <= inputE(1) XOR inputF(1);
output2(2) <= inputE(2) XOR inputF(2);
output2(3) <= inputE(3) XOR inputF(3);

end Behavioral;
