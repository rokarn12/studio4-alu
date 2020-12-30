----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2020 02:42:11 PM
-- Design Name: 
-- Module Name: adder - Structural
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

entity adder is
    PORT (
        -- inputs
        A_input : IN STD_LOGIC_VECTOR(3 downto 0);
        B_input : IN STD_LOGIC_VECTOR(3 downto 0);
        carry_in1 : IN STD_LOGIC;
        
        -- outputs
        sum_output : OUT STD_LOGIC_VECTOR(4 downto 0));
end adder;

architecture Structural of adder is
    -- Component
    COMPONENT bit_full_adder IS
        PORT (
        -- INPUTS
        A  : IN STD_LOGIC;
        B  : IN STD_LOGIC;
        carry_in  : IN STD_LOGIC;
        
        -- OUTPUTS
        sum  : OUT STD_LOGIC;
        carry_out  : OUT STD_LOGIC);
    END COMPONENT bit_full_adder;
    
    -- Signal Declaration
    -- sums
    SIGNAL s0: STD_LOGIC;
    SIGNAL s1: STD_LOGIC;
    SIGNAL s2: STD_LOGIC;
    SIGNAL s3: STD_LOGIC;
    
    -- carry-outs
    SIGNAL c0: STD_LOGIC;
    SIGNAL c1: STD_LOGIC;
    SIGNAL c2: STD_LOGIC;
    SIGNAL c3: STD_LOGIC;

begin

    -- Component Instantiation
    ZY: bit_full_adder
        PORT MAP (
            A => A_input(0),
            B => B_input(0),
            carry_in => carry_in1,
            sum => s0,
            carry_out => c0);
            
    XW: bit_full_adder
        PORT MAP (
            A => A_input(1),
            B => B_input(1),
            carry_in => c0,
            sum => s1,
            carry_out => c1);
            
    UV: bit_full_adder
        PORT MAP (
            A => A_input(2),
            B => B_input(2),
            carry_in => c1,
            sum => s2,
            carry_out => c2);
            
    ST: bit_full_adder
        PORT MAP (
            A => A_input(3),
            B => B_input(3),
            carry_in => c2,
            sum => s3,
            carry_out => c3);    

    sum_output(4) <= c3;
    sum_output(3) <= s3;
    sum_output(2) <= s2;
    sum_output(1) <= s1;
    sum_output(0) <= s0;
    
end Structural;
