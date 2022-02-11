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

-- DATE "02/10/2022 13:33:30"

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
	signF : BUFFER std_logic
	);
END top;

-- Design Ports Information
-- port[0]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[1]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[2]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[3]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[4]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[5]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[6]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- port[7]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- zeroF	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- signF	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
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
SIGNAL \extClk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\extClk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \extClk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X13_Y0_N16
\port[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][0]~q\,
	devoe => ww_devoe,
	o => \port[0]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\port[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][1]~q\,
	devoe => ww_devoe,
	o => \port[1]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\port[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][2]~q\,
	devoe => ww_devoe,
	o => \port[2]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\port[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][3]~q\,
	devoe => ww_devoe,
	o => \port[3]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\port[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][4]~q\,
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
	devoe => ww_devoe,
	o => \port[6]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\port[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ram|ram[0][7]~q\,
	devoe => ww_devoe,
	o => \port[7]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
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

-- Location: IOOBUF_X16_Y24_N23
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

-- Location: IOIBUF_X16_Y0_N1
\rst~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: LCCOMB_X16_Y4_N16
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

-- Location: FF_X16_Y4_N17
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

-- Location: LCCOMB_X16_Y4_N26
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

-- Location: FF_X16_Y4_N27
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

-- Location: LCCOMB_X16_Y4_N28
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

-- Location: FF_X16_Y4_N29
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

-- Location: LCCOMB_X16_Y4_N6
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

-- Location: FF_X16_Y4_N7
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

-- Location: LCCOMB_X16_Y4_N24
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

-- Location: FF_X16_Y4_N25
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

-- Location: LCCOMB_X16_Y4_N10
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

-- Location: FF_X16_Y4_N11
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

-- Location: LCCOMB_X16_Y4_N4
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

-- Location: FF_X16_Y4_N5
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

-- Location: LCCOMB_X16_Y4_N30
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

-- Location: FF_X16_Y4_N31
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

\ww_port\(0) <= \port[0]~output_o\;

\ww_port\(1) <= \port[1]~output_o\;

\ww_port\(2) <= \port[2]~output_o\;

\ww_port\(3) <= \port[3]~output_o\;

\ww_port\(4) <= \port[4]~output_o\;

\ww_port\(5) <= \port[5]~output_o\;

\ww_port\(6) <= \port[6]~output_o\;

\ww_port\(7) <= \port[7]~output_o\;

ww_zeroF <= \zeroF~output_o\;

ww_signF <= \signF~output_o\;
END structure;


