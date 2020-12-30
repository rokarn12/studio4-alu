----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2020 03:40:43 PM
-- Design Name: 
-- Module Name: toplevel - Structural
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

entity toplevel is
    Port ( sw : in STD_LOGIC_VECTOR (8 downto 0);
           control : in STD_LOGIC_VECTOR(1 downto 0);
           clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end toplevel;

-- TWO SWITCHES UP - ADDER
-- LEFT DOWN, RIGHT UP - ORer
-- LEFT UP, RIGHT DOWN - XORer
-- TWO SWITCHES DOWN - ANDer

architecture Structural of toplevel is
    -- Components
    COMPONENT adder IS
        PORT (
            -- inputs
            A_input : IN STD_LOGIC_VECTOR(3 downto 0);
            B_input : IN STD_LOGIC_VECTOR(3 downto 0);
            carry_in1 : IN STD_LOGIC;
            
            -- outputs
            sum_output : OUT STD_LOGIC_VECTOR(4 downto 0));
    END COMPONENT adder;
    
    COMPONENT XORer IS
        PORT (
            -- inputs
            inputE : IN STD_LOGIC_VECTOR(3 downto 0);
            inputF : IN STD_LOGIC_VECTOR(3 downto 0);
            
            -- outputs
            output2 : OUT STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT XORer;
    
    COMPONENT ORer IS
        PORT (
            -- inputs
            inputC : IN STD_LOGIC_VECTOR(3 downto 0);
            inputD : IN STD_LOGIC_VECTOR(3 downto 0);
            
            -- outputs
            output1 : OUT STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT ORer;
    
    COMPONENT ANDer IS
        PORT (
            -- inputs
            inputA : IN STD_LOGIC_VECTOR(3 downto 0);
            inputB : IN STD_LOGIC_VECTOR(3 downto 0);
            
            -- outputs
            output0 : OUT STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT ANDer;
    
    COMPONENT LEDdisplay IS
        PORT (
              clk                    : IN  STD_LOGIC;
              seg0,seg1,seg2,seg3        : IN  STD_LOGIC_VECTOR(6 downto 0);
              seg               : OUT  STD_LOGIC_VECTOR(6  downto 0);
              an                    : OUT STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT LEDdisplay;
    
    COMPONENT display_driver IS
        Port ( 
            inputs : in  STD_LOGIC_VECTOR (3 downto 0);
            seg_out : out  STD_LOGIC_VECTOR (6 downto 0));
    END COMPONENT display_driver;
    
    COMPONENT function_select IS
        Port ( Input0 : in  STD_LOGIC_VECTOR (3 downto 0);
               Input1 : in  STD_LOGIC_VECTOR (3 downto 0);
               Input2 : in  STD_LOGIC_VECTOR (3 downto 0);
               Input3 : in  STD_LOGIC_VECTOR (4 downto 0);
               control : in  STD_LOGIC_VECTOR (1 downto 0);
               Output : out  STD_LOGIC_VECTOR (4 downto 0));
    END COMPONENT function_select;
    
    -- Signal Declaration
    SIGNAL ANDer_result: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL ORer_result: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL XORer_result: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL ADDER_result: STD_LOGIC_VECTOR(4 downto 0);
    
    SIGNAL sig_segments1: STD_LOGIC_VECTOR(6 downto 0);
    SIGNAL sig_segments2: STD_LOGIC_VECTOR(6 downto 0);
    
    SIGNAL FS_output: STD_LOGIC_VECTOR(4 downto 0);

begin

    -- Component Instantiation
    adder_output: adder
        PORT MAP (
            A_input(0) => sw(0),
            A_input(1) => sw(1),
            A_input(2) => sw(2),
            A_input(3) => sw(3),
            B_input(0) => sw(4),
            B_input(1) => sw(5),
            B_input(2) => sw(6),
            B_input(3) => sw(7),
            carry_in1 => sw(8),
            sum_output => ADDER_result);
            
    XORer_output: XORer
        PORT MAP (
            inputE(0) => sw(0),
            inputE(1) => sw(1),
            inputE(2) => sw(2),
            inputE(3) => sw(3),
            inputF(0) => sw(4),
            inputF(1) => sw(5),
            inputF(2) => sw(6),
            inputF(3) => sw(7),
            output2 => XORer_result);
            
    ORer_output: ORer
        PORT MAP (
            inputC(0) => sw(0),
            inputC(1) => sw(1),
            inputC(2) => sw(2),
            inputC(3) => sw(3),
            inputD(0) => sw(4),
            inputD(1) => sw(5),
            inputD(2) => sw(6),
            inputD(3) => sw(7),
            output1 => ORer_result);
            
    ANDer_output: ANDer
        PORT MAP (
            inputA(0) => sw(0),
            inputA(1) => sw(1),
            inputA(2) => sw(2),
            inputA(3) => sw(3),
            inputB(0) => sw(4),
            inputB(1) => sw(5),
            inputB(2) => sw(6),
            inputB(3) => sw(7),
            output0 => ANDer_result);
            
            
    FS: function_select
        PORT MAP (
            Input0 => ANDer_result,
            Input1 => ORer_result,
            Input2 => XORer_result,
            Input3 => ADDER_result,
            control => control,
            Output => FS_output);
            
    DD1: display_driver
        PORT MAP (
            inputs(0) => FS_output(0),
            inputs(1) => FS_output(1),
            inputs(2) => FS_output(2),
            inputs(3) => FS_output(3),
            seg_out => sig_segments1);
            
    DD2: display_driver
        PORT MAP (
            inputs(0) => FS_output(4),
            inputs(1) => '0',
            inputs(2) => '0',
            inputs(3) => '0',
            seg_out => sig_segments2);
            
    displayLED: LEDdisplay
        PORT MAP (
            clk => clk,
            seg0 => sig_segments1,
            seg1 => sig_segments2,
            seg2 => "0000000",
            seg3 => "0000000",
            seg => seg,
            an => an);
    
end Structural;
