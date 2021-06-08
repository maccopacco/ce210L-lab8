----------------------------------------------------------------------------------
-- Company:        Kettering University
-- Engineer:       David Foster
-- 
-- Create Date:    12/1/2019 
-- Design Name:    
-- Module Name:    jk_ff - Behavioral 
-- Project Name:   CE-430 gate
-- Target Devices: not intended for synthesis
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity jk_ff is
    Port ( j : in  STD_LOGIC;
           k : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clr : in  STD_LOGIC;
           q : out  STD_LOGIC;
           qnot : out  STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is

begin

process(j,k,clk,clr)
variable qproc : STD_LOGIC;
begin
	if clr = '1' then
        qproc := '0';
        q <= '0';
        qnot <= '1';		
	elsif clk'event and clk = '1' then
            if j = '1' then
                if k = '0' then  -- "set to 1"
                    q <= '1';
                    qnot <= '0'; 
                    qproc := '1';
                else -- "toggle"
                    q <= not qproc;
                    qnot <= qproc; 
                    qproc := not qproc;
                end if;
            else
                if k = '1' then -- "clear to 0"
                    q <= '0';
                    qnot <= '1'; 
                    qproc := '0';
                end if;   
                -- else "hold current"  
            end if;
--        else  -- FF is currently false
--            if j = '1' then
--                if k = '0' then
--                   q <= '1';
--                    qnot <= '0'; 
--                    qproc := '1';
--                else
--                    q <= not qproc;
--                    qnot <= qproc; 
--                    qproc := not qproc;
--                end if;
--            else
--                if k = '1' then
--                    q <= '0' after fall;
--                    qnot <= '1' after rise; 
--                    qproc := '0';
--                end if;     
--            end if;
--        end if;
    end if;	
end process;

end Behavioral;

