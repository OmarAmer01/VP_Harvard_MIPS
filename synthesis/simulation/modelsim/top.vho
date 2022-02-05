-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "02/05/2022 16:35:27"

-- 
-- Device: Altera EP4CE6E22C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	top IS
    PORT (
	extClk : IN std_logic;
	rst : IN std_logic;
	\port\ : BUFFER std_logic_vector(7 DOWNTO 0);
	zeroF : BUFFER std_logic;
	signF : BUFFER std_logic;
	regA : BUFFER std_logic_vector(31 DOWNTO 0);
	regB : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END top;

-- Design Ports Information
-- zeroF	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signF	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[0]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[1]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[2]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[3]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[4]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[5]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[6]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[7]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[8]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[9]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[10]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[11]	=>  Location: PIN_144,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[12]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[13]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[14]	=>  Location: PIN_143,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[15]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[16]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[17]	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[18]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[19]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[20]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[21]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[22]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[23]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[24]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[25]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[26]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[27]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[28]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[29]	=>  Location: PIN_1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[30]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regA[31]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[0]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[1]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[2]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[3]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[4]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[5]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[6]	=>  Location: PIN_138,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[7]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[8]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[9]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[10]	=>  Location: PIN_2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[11]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[12]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[13]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[14]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[15]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[16]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[17]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[18]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[19]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[20]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[21]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[22]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[23]	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[24]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[25]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[26]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[27]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[28]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[29]	=>  Location: PIN_3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[30]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regB[31]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[0]	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[1]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[2]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[3]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[4]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[5]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[6]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[7]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- extClk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_extClk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL \ww_port\ : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_zeroF : std_logic;
SIGNAL ww_signF : std_logic;
SIGNAL ww_regA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_regB : std_logic_vector(31 DOWNTO 0);
SIGNAL \extClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \port[0]~input_o\ : std_logic;
SIGNAL \port[1]~input_o\ : std_logic;
SIGNAL \port[2]~input_o\ : std_logic;
SIGNAL \port[3]~input_o\ : std_logic;
SIGNAL \port[4]~input_o\ : std_logic;
SIGNAL \port[5]~input_o\ : std_logic;
SIGNAL \port[6]~input_o\ : std_logic;
SIGNAL \port[7]~input_o\ : std_logic;
SIGNAL \port[0]~output_o\ : std_logic;
SIGNAL \port[1]~output_o\ : std_logic;
SIGNAL \port[2]~output_o\ : std_logic;
SIGNAL \port[3]~output_o\ : std_logic;
SIGNAL \port[4]~output_o\ : std_logic;
SIGNAL \port[5]~output_o\ : std_logic;
SIGNAL \port[6]~output_o\ : std_logic;
SIGNAL \port[7]~output_o\ : std_logic;
SIGNAL \zeroF~output_o\ : std_logic;
SIGNAL \signF~output_o\ : std_logic;
SIGNAL \regA[0]~output_o\ : std_logic;
SIGNAL \regA[1]~output_o\ : std_logic;
SIGNAL \regA[2]~output_o\ : std_logic;
SIGNAL \regA[3]~output_o\ : std_logic;
SIGNAL \regA[4]~output_o\ : std_logic;
SIGNAL \regA[5]~output_o\ : std_logic;
SIGNAL \regA[6]~output_o\ : std_logic;
SIGNAL \regA[7]~output_o\ : std_logic;
SIGNAL \regA[8]~output_o\ : std_logic;
SIGNAL \regA[9]~output_o\ : std_logic;
SIGNAL \regA[10]~output_o\ : std_logic;
SIGNAL \regA[11]~output_o\ : std_logic;
SIGNAL \regA[12]~output_o\ : std_logic;
SIGNAL \regA[13]~output_o\ : std_logic;
SIGNAL \regA[14]~output_o\ : std_logic;
SIGNAL \regA[15]~output_o\ : std_logic;
SIGNAL \regA[16]~output_o\ : std_logic;
SIGNAL \regA[17]~output_o\ : std_logic;
SIGNAL \regA[18]~output_o\ : std_logic;
SIGNAL \regA[19]~output_o\ : std_logic;
SIGNAL \regA[20]~output_o\ : std_logic;
SIGNAL \regA[21]~output_o\ : std_logic;
SIGNAL \regA[22]~output_o\ : std_logic;
SIGNAL \regA[23]~output_o\ : std_logic;
SIGNAL \regA[24]~output_o\ : std_logic;
SIGNAL \regA[25]~output_o\ : std_logic;
SIGNAL \regA[26]~output_o\ : std_logic;
SIGNAL \regA[27]~output_o\ : std_logic;
SIGNAL \regA[28]~output_o\ : std_logic;
SIGNAL \regA[29]~output_o\ : std_logic;
SIGNAL \regA[30]~output_o\ : std_logic;
SIGNAL \regA[31]~output_o\ : std_logic;
SIGNAL \regB[0]~output_o\ : std_logic;
SIGNAL \regB[1]~output_o\ : std_logic;
SIGNAL \regB[2]~output_o\ : std_logic;
SIGNAL \regB[3]~output_o\ : std_logic;
SIGNAL \regB[4]~output_o\ : std_logic;
SIGNAL \regB[5]~output_o\ : std_logic;
SIGNAL \regB[6]~output_o\ : std_logic;
SIGNAL \regB[7]~output_o\ : std_logic;
SIGNAL \regB[8]~output_o\ : std_logic;
SIGNAL \regB[9]~output_o\ : std_logic;
SIGNAL \regB[10]~output_o\ : std_logic;
SIGNAL \regB[11]~output_o\ : std_logic;
SIGNAL \regB[12]~output_o\ : std_logic;
SIGNAL \regB[13]~output_o\ : std_logic;
SIGNAL \regB[14]~output_o\ : std_logic;
SIGNAL \regB[15]~output_o\ : std_logic;
SIGNAL \regB[16]~output_o\ : std_logic;
SIGNAL \regB[17]~output_o\ : std_logic;
SIGNAL \regB[18]~output_o\ : std_logic;
SIGNAL \regB[19]~output_o\ : std_logic;
SIGNAL \regB[20]~output_o\ : std_logic;
SIGNAL \regB[21]~output_o\ : std_logic;
SIGNAL \regB[22]~output_o\ : std_logic;
SIGNAL \regB[23]~output_o\ : std_logic;
SIGNAL \regB[24]~output_o\ : std_logic;
SIGNAL \regB[25]~output_o\ : std_logic;
SIGNAL \regB[26]~output_o\ : std_logic;
SIGNAL \regB[27]~output_o\ : std_logic;
SIGNAL \regB[28]~output_o\ : std_logic;
SIGNAL \regB[29]~output_o\ : std_logic;
SIGNAL \regB[30]~output_o\ : std_logic;
SIGNAL \regB[31]~output_o\ : std_logic;
SIGNAL \extClk~input_o\ : std_logic;
SIGNAL \extClk~inputclkctrl_outclk\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \ram|ram[0][0]~0_combout\ : std_logic;
SIGNAL \ram|ram[0][0]~q\ : std_logic;
SIGNAL \ram|ram[0][1]~1_combout\ : std_logic;
SIGNAL \ram|ram[0][1]~q\ : std_logic;
SIGNAL \ram|ram[0][2]~2_combout\ : std_logic;
SIGNAL \ram|ram[0][2]~q\ : std_logic;
SIGNAL \ram|ram[0][3]~3_combout\ : std_logic;
SIGNAL \ram|ram[0][3]~q\ : std_logic;
SIGNAL \ram|ram[0][4]~4_combout\ : std_logic;
SIGNAL \ram|ram[0][4]~q\ : std_logic;
SIGNAL \ram|ram[0][5]~5_combout\ : std_logic;
SIGNAL \ram|ram[0][5]~q\ : std_logic;
SIGNAL \ram|ram[0][6]~6_combout\ : std_logic;
SIGNAL \ram|ram[0][6]~q\ : std_logic;
SIGNAL \ram|ram[0][7]~7_combout\ : std_logic;
SIGNAL \ram|ram[0][7]~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_extClk <= extClk;
ww_rst <= rst;
\port\ <= \ww_port\;
zeroF <= ww_zeroF;
signF <= ww_signF;
regA <= ww_regA;
regB <= ww_regB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\extClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \extClk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X16_Y24_N23
\port[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][0]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[0]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\port[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][1]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[1]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\port[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][2]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[2]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\port[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][3]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\port[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][4]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[4]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\port[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][5]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[5]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\port[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][6]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[6]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\port[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][7]~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \port[7]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\zeroF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \zeroF~output_o\);

-- Location: IOOBUF_X3_Y24_N23
\signF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \signF~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\regA[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[0]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\regA[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[1]~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\regA[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[2]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\regA[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[3]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\regA[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[4]~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\regA[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[5]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\regA[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[6]~output_o\);

-- Location: IOOBUF_X7_Y24_N2
\regA[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[7]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\regA[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[8]~output_o\);

-- Location: IOOBUF_X34_Y2_N16
\regA[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[9]~output_o\);

-- Location: IOOBUF_X0_Y21_N9
\regA[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[10]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\regA[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[11]~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\regA[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[12]~output_o\);

-- Location: IOOBUF_X34_Y3_N23
\regA[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[13]~output_o\);

-- Location: IOOBUF_X1_Y24_N2
\regA[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[14]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\regA[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[15]~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\regA[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[16]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\regA[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[17]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\regA[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[18]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\regA[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[19]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\regA[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[20]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\regA[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[21]~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\regA[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[22]~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\regA[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[23]~output_o\);

-- Location: IOOBUF_X34_Y17_N23
\regA[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[24]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\regA[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[25]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\regA[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[26]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\regA[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[27]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\regA[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[28]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\regA[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[29]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\regA[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[30]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\regA[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regA[31]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\regB[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[0]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\regB[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[1]~output_o\);

-- Location: IOOBUF_X0_Y18_N16
\regB[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[2]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\regB[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[3]~output_o\);

-- Location: IOOBUF_X0_Y9_N9
\regB[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[4]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\regB[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[5]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\regB[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[6]~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\regB[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[7]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\regB[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[8]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\regB[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[9]~output_o\);

-- Location: IOOBUF_X0_Y23_N9
\regB[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[10]~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\regB[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[11]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\regB[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[12]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\regB[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[13]~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\regB[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[14]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\regB[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[15]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\regB[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[16]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\regB[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[17]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\regB[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[18]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\regB[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[19]~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\regB[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[20]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\regB[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[21]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\regB[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[22]~output_o\);

-- Location: IOOBUF_X0_Y5_N16
\regB[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[23]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\regB[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[24]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\regB[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[25]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\regB[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[26]~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\regB[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[27]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\regB[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[28]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\regB[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[29]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\regB[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[30]~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\regB[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \regB[31]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\extClk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_extClk,
	o => \extClk~input_o\);

-- Location: CLKCTRL_G2
\extClk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \extClk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \extClk~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y24_N1
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X16_Y23_N0
\ram|ram[0][0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][0]~0_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][0]~0_combout\);

-- Location: FF_X16_Y23_N1
\ram|ram[0][0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][0]~q\);

-- Location: LCCOMB_X16_Y23_N10
\ram|ram[0][1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][1]~1_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][1]~1_combout\);

-- Location: FF_X16_Y23_N11
\ram|ram[0][1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][1]~q\);

-- Location: LCCOMB_X16_Y23_N4
\ram|ram[0][2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][2]~2_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][2]~2_combout\);

-- Location: FF_X16_Y23_N5
\ram|ram[0][2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][2]~q\);

-- Location: LCCOMB_X16_Y23_N22
\ram|ram[0][3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][3]~3_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][3]~3_combout\);

-- Location: FF_X16_Y23_N23
\ram|ram[0][3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][3]~q\);

-- Location: LCCOMB_X16_Y23_N24
\ram|ram[0][4]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][4]~4_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][4]~4_combout\);

-- Location: FF_X16_Y23_N25
\ram|ram[0][4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][4]~q\);

-- Location: LCCOMB_X16_Y23_N2
\ram|ram[0][5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][5]~5_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][5]~5_combout\);

-- Location: FF_X16_Y23_N3
\ram|ram[0][5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][5]~q\);

-- Location: LCCOMB_X16_Y23_N12
\ram|ram[0][6]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][6]~6_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][6]~6_combout\);

-- Location: FF_X16_Y23_N13
\ram|ram[0][6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][6]~q\);

-- Location: LCCOMB_X16_Y23_N14
\ram|ram[0][7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \ram|ram[0][7]~7_combout\ = !\rst~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \rst~input_o\,
	combout => \ram|ram[0][7]~7_combout\);

-- Location: FF_X16_Y23_N15
\ram|ram[0][7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \extClk~inputclkctrl_outclk\,
	d => \ram|ram[0][7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ram|ram[0][7]~q\);

-- Location: IOIBUF_X16_Y24_N22
\port[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(0),
	o => \port[0]~input_o\);

-- Location: IOIBUF_X13_Y24_N15
\port[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(1),
	o => \port[1]~input_o\);

-- Location: IOIBUF_X11_Y24_N15
\port[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(2),
	o => \port[2]~input_o\);

-- Location: IOIBUF_X18_Y24_N15
\port[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(3),
	o => \port[3]~input_o\);

-- Location: IOIBUF_X18_Y24_N22
\port[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(4),
	o => \port[4]~input_o\);

-- Location: IOIBUF_X16_Y24_N15
\port[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(5),
	o => \port[5]~input_o\);

-- Location: IOIBUF_X16_Y24_N8
\port[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(6),
	o => \port[6]~input_o\);

-- Location: IOIBUF_X13_Y24_N22
\port[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => \port\(7),
	o => \port[7]~input_o\);

ww_zeroF <= \zeroF~output_o\;

ww_signF <= \signF~output_o\;

ww_regA(0) <= \regA[0]~output_o\;

ww_regA(1) <= \regA[1]~output_o\;

ww_regA(2) <= \regA[2]~output_o\;

ww_regA(3) <= \regA[3]~output_o\;

ww_regA(4) <= \regA[4]~output_o\;

ww_regA(5) <= \regA[5]~output_o\;

ww_regA(6) <= \regA[6]~output_o\;

ww_regA(7) <= \regA[7]~output_o\;

ww_regA(8) <= \regA[8]~output_o\;

ww_regA(9) <= \regA[9]~output_o\;

ww_regA(10) <= \regA[10]~output_o\;

ww_regA(11) <= \regA[11]~output_o\;

ww_regA(12) <= \regA[12]~output_o\;

ww_regA(13) <= \regA[13]~output_o\;

ww_regA(14) <= \regA[14]~output_o\;

ww_regA(15) <= \regA[15]~output_o\;

ww_regA(16) <= \regA[16]~output_o\;

ww_regA(17) <= \regA[17]~output_o\;

ww_regA(18) <= \regA[18]~output_o\;

ww_regA(19) <= \regA[19]~output_o\;

ww_regA(20) <= \regA[20]~output_o\;

ww_regA(21) <= \regA[21]~output_o\;

ww_regA(22) <= \regA[22]~output_o\;

ww_regA(23) <= \regA[23]~output_o\;

ww_regA(24) <= \regA[24]~output_o\;

ww_regA(25) <= \regA[25]~output_o\;

ww_regA(26) <= \regA[26]~output_o\;

ww_regA(27) <= \regA[27]~output_o\;

ww_regA(28) <= \regA[28]~output_o\;

ww_regA(29) <= \regA[29]~output_o\;

ww_regA(30) <= \regA[30]~output_o\;

ww_regA(31) <= \regA[31]~output_o\;

ww_regB(0) <= \regB[0]~output_o\;

ww_regB(1) <= \regB[1]~output_o\;

ww_regB(2) <= \regB[2]~output_o\;

ww_regB(3) <= \regB[3]~output_o\;

ww_regB(4) <= \regB[4]~output_o\;

ww_regB(5) <= \regB[5]~output_o\;

ww_regB(6) <= \regB[6]~output_o\;

ww_regB(7) <= \regB[7]~output_o\;

ww_regB(8) <= \regB[8]~output_o\;

ww_regB(9) <= \regB[9]~output_o\;

ww_regB(10) <= \regB[10]~output_o\;

ww_regB(11) <= \regB[11]~output_o\;

ww_regB(12) <= \regB[12]~output_o\;

ww_regB(13) <= \regB[13]~output_o\;

ww_regB(14) <= \regB[14]~output_o\;

ww_regB(15) <= \regB[15]~output_o\;

ww_regB(16) <= \regB[16]~output_o\;

ww_regB(17) <= \regB[17]~output_o\;

ww_regB(18) <= \regB[18]~output_o\;

ww_regB(19) <= \regB[19]~output_o\;

ww_regB(20) <= \regB[20]~output_o\;

ww_regB(21) <= \regB[21]~output_o\;

ww_regB(22) <= \regB[22]~output_o\;

ww_regB(23) <= \regB[23]~output_o\;

ww_regB(24) <= \regB[24]~output_o\;

ww_regB(25) <= \regB[25]~output_o\;

ww_regB(26) <= \regB[26]~output_o\;

ww_regB(27) <= \regB[27]~output_o\;

ww_regB(28) <= \regB[28]~output_o\;

ww_regB(29) <= \regB[29]~output_o\;

ww_regB(30) <= \regB[30]~output_o\;

ww_regB(31) <= \regB[31]~output_o\;

\port\(0) <= \port[0]~output_o\;

\port\(1) <= \port[1]~output_o\;

\port\(2) <= \port[2]~output_o\;

\port\(3) <= \port[3]~output_o\;

\port\(4) <= \port[4]~output_o\;

\port\(5) <= \port[5]~output_o\;

\port\(6) <= \port[6]~output_o\;

\port\(7) <= \port[7]~output_o\;
END structure;


