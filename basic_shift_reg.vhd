-- Copyright (C) 2013-2018 Efinix Inc. All rights reserved.
--
-- Basic Shift Registers
--
-- *******************************
-- Revisions:
-- 0.0 Initial rev
-- *******************************

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all; 

-- this is the entity
entity basic_shift_reg is
  generic(
    WIDTH : in natural := 8);
  port ( 
    CLK : in std_logic;
    ENA : in std_logic;
    SR_IN : in std_logic;
    SR_OUT : out std_logic);
end entity basic_shift_reg;

-- this is the architecture
architecture RTL of basic_shift_reg is
  signal SR : unsigned(WIDTH-1 downto 0);
begin
  process(CLK, ENA) is
  begin
  if rising_edge(CLK) then
     if ENA = '1' then
        SR(WIDTH-1 downto 1) <= SR(WIDTH-2 downto 0);
        SR(0) <= SR_IN;
     end if;
  end if;
  end process;  

SR_OUT <= SR(WIDTH-1);

end architecture RTL;

