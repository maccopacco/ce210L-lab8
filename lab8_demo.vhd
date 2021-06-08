-- Need heacer!!!!!!!!!!!!

library IEEE;
use IEEE.std_logic_1164.all;

entity lab8_demo is
   port (SW : in std_logic_vector(9 downto 0);
         LEDR : out std_logic_vector(9 downto 0);
         KEY : in std_logic_vector(0 downto 0)
         );

end lab8_demo;

architecture fsm of lab8_demo is

   signal Q2, Q2n, Q1, Q1n, Q0, Q0n : std_logic;  -- flip-flop outputs
   signal J2, K2, J1, K1, J0, K0 : std_logic;     -- flip-flop inputs

   COMPONENT jk_ff
       Port ( j    : in  STD_LOGIC;
              k    : in STD_LOGIC;
              clk  : in  STD_LOGIC;
              clr  : in  STD_LOGIC;
              q    : out  STD_LOGIC;
              qnot : out  STD_LOGIC);
   END COMPONENT;

   alias Coin : std_logic is SW(0);
   alias CLR : std_logic is SW(9);
   alias Disp : std_logic is LEDR(4);
   alias CLK : std_logic is KEY(0);

begin

    -- add equations for the flip-flop inputs
   J2 <= ; 
   K2 <= ;
   J1 <= ;
   K1 <= ;
   J0 <= ;
   K0 <= ;

   jkff_q2 : jk_ff port map (J2, K2, CLK, CLR, Q2, Q2n);
   jkff_q1 : jk_ff port map (J1, K1, CLK, CLR, Q1, Q1n);
   jkff_q0 : jk_ff port map (J0, K0, CLK, CLR, Q0, Q0n);

    -- monitor internal state variables for debugging/verification
   LEDR(7) <= Q2;
   LEDR(6) <= Q1;
   LEDR(5) <= Q0;
   LEDR(0) <= Coin;
   
    -- add equations for the output variable
   Disp <= ;

end fsm;