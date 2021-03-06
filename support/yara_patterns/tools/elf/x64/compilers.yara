/*
 * YARA rules for x64 ELF compiler detection.
 * Copyright (c) 2017 Avast Software, licensed under the MIT license
 */

import "elf"

rule gcc_470_rhel
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.7.0"
		extra = "RHEL"
		pattern = "31ED4989D15E4889E24883E4F0505449C7C0?0????0?48C7C1?0????0?48C7C7??????0?E8????????F466904883EC08488B05??????0?4885C07402FFD04883C408C3"
	strings:
		$1 = { 31 ED 49 89 D1 5E 48 89 E2 48 83 E4 F0 50 54 49 C7 C0 ?0 ?? ?? 0? 48 C7 C1 ?0 ?? ?? 0? 48 C7 C7 ?? ?? ?? 0? E8 ?? ?? ?? ?? F4 66 90 48 83 EC 08 48 8B 05 ?? ?? ?? 0? 48 85 C0 74 02 FF D0 48 83 C4 08 C3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_463_ubuntu
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.6.3"
		extra = "Ubuntu"
		pattern = "31ED4989D15E4889E24883E4F0505449C7C0?0????0048C7C1?0????0048C7C7????4000E8????????F49090????????488????????????????0????????4883C408C3"
	strings:
		$1 = { 31 ED 49 89 D1 5E 48 89 E2 48 83 E4 F0 50 54 49 C7 C0 ?0 ?? ?? 00 48 C7 C1 ?0 ?? ?? 00 48 C7 C7 ?? ?? 40 00 E8 ?? ?? ?? ?? F4 90 90 ?? ?? ?? ?? 48 8? ?? ?? ?? ?? ?? ?? ?? ?0 ?? ?? ?? ?? 48 83 C4 08 C3 }
	condition:
		$1 at elf.entry_point
}

rule gcc_472
{
	meta:
		tool = "C"
		name = "GCC"
		version = "4.7.2"
		pattern = "31ED5E89E183E4F050545268?0??0?0868?0??0?08515668????0?08E8????????F46690"
	strings:
		$1 = { 31 ED 5E 89 E1 83 E4 F0 50 54 52 68 ?0 ?? 0? 08 68 ?0 ?? 0? 08 51 56 68 ?? ?? 0? 08 E8 ?? ?? ?? ?? F4 66 90 }
	condition:
		$1 at elf.entry_point
}

rule tcc_0_9_26
{
	meta:
		tool = "C"
		name = "Tiny C Compiler"
		version = "0.9.26"
		source = "Made by Retdec Team"
		pattern = "31ED4989D15E4889E24883E4F0505449C7C0?0??0?0848C7C1?0??0?0848C7C7????0?08E8?7??0?00F490904883EC08488B05?9??0?004885C07402FFD04883C408C3554889E54881EC?00?0000"
	strings:
		$1 = { 31 ED 49 89 D1 5E 48 89 E2 48 83 E4 F0 50 54 49 C7 C0 ?0 ?? 0? 08 48 C7 C1 ?0 ?? 0? 08 48 C7 C7 ?? ?? 0? 08 E8 ?7 ?? 0? 00 F4 90 90 48 83 EC 08 48 8B 05 ?9 ?? 0? 00 48 85 C0 74 02 FF D0 48 83 C4 08 C3 55 48 89 E5 48 81 EC ?0 0? 00 00 }
	condition:
		$1 at elf.entry_point
}


rule gc_1
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D7708488B3F488D0502000000FFE0488D05?9C?FFFFFFE0??????????????488B7C24088B7424108B5424144C8B5424184C8B442420B8C60100000F0589442428C3??????????????????????????488B7C24088B742410B8C70100000F05C3"
	strings:
		$1 = { 48 8D 77 08 48 8B 3F 48 8D 05 02 00 00 00 FF E0 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 48 8B 7C 24 08 8B 74 24 10 8B 54 24 14 4C 8B 54 24 18 4C 8B 44 24 20 B8 C6 01 00 00 0F 05 89 44 24 28 C3 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8B 7C 24 08 8B 74 24 10 B8 C7 01 00 00 0F 05 C3 }
	condition:
		$1 at elf.entry_point
}

rule gc_2
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D742408488B3C24488D0510000000FFE0????????????????????????????488D05?9C?FFFFFFE0??????????????488B7C2408488B742410488B542418B8350100000F05730348F7D889442420C3"
	strings:
		$1 = { 48 8D 74 24 08 48 8B 3C 24 48 8D 05 10 00 00 00 FF E0 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 48 8B 7C 24 08 48 8B 74 24 10 48 8B 54 24 18 B8 35 01 00 00 0F 05 73 03 48 F7 D8 89 44 24 20 C3 }
	condition:
		$1 at elf.entry_point
}

rule gc_3
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D742408488B3C24488D0510000000FFE0????????????????????????????488D05?9C?FFFFFFE0??????????????4883EC2?4?8???24??4?8??C24?04C8B?4244?4?8B?C24?84?8B?424?0?8"
	strings:
		$1 = { 48 8D 74 24 08 48 8B 3C 24 48 8D 05 10 00 00 00 FF E0 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 48 83 EC 2? 4? 8? ?? 24 ?? 4? 8? ?C 24 ?0 4C 8B ?4 24 4? 4? 8B ?C 24 ?8 4? 8B ?4 24 ?0 ?8 }
	condition:
		$1 at elf.entry_point
}

rule gc_4
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D742408488B3C24488D0510000000FFE0????????????????????????????488D05?9C?FFFFFFE0??????????????4883EC1048896C2408488D6C2408488B6C24084883C410C3"
	strings:
		$1 = { 48 8D 74 24 08 48 8B 3C 24 48 8D 05 10 00 00 00 FF E0 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 48 83 EC 10 48 89 6C 24 08 48 8D 6C 24 08 48 8B 6C 24 08 48 83 C4 10 C3 }
	condition:
		$1 at elf.entry_point
}

rule gc_5
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D742408488B3C24488D0510000000FFE0????????????????????????????488D05?9C?FFFFFFE0??????????????8B7C2408B8E70000000F05C3????????488B7C24088B7424108B542414B8020000000F05483D01F0FFFF7605B8FFFFFFFF89442418C3"
	strings:
		$1 = { 48 8D 74 24 08 48 8B 3C 24 48 8D 05 10 00 00 00 FF E0 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 8B 7C 24 08 B8 E7 00 00 00 0F 05 C3 ?? ?? ?? ?? 48 8B 7C 24 08 8B 74 24 10 8B 54 24 14 B8 02 00 00 00 0F 05 48 3D 01 F0 FF FF 76 05 B8 FF FF FF FF 89 44 24 18 C3 }
	condition:
		$1 at elf.entry_point
}

rule gc_6
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D7708488B3F488D0502000000FFE0488D05?9C?FFFFFFE0??????????????488B7C24088B7424108B542414B8D50100000F05730348F7D889442418C3????488B7C24"
	strings:
		$1 = { 48 8D 74 24 08 48 8B 3C 24 48 8D 05 10 00 00 00 FF E0 ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 8B 7C 24 08 B8 E7 00 00 00 0F 05 C3 ?? ?? ?? ?? 48 8B 7C 24 }
	condition:
		$1 at elf.entry_point
}

rule gc_7
{
	meta:
		tool = "C"
		name = "gc"
		language = "Go"
		pattern = "488D7708488B3F488D0502000000FFE0488D05?9C?FFFFFFE0??????????????488B7C24088B7424108B542414B8D50100000F05730348F7D889442418C3????488B7C24088B742410B8D60100000F05730348F7D889442418C3????????????488B7C24"
	strings:
		$1 = { 48 8D 77 08 48 8B 3F 48 8D 05 02 00 00 00 FF E0 48 8D 05 ?9 C? FF FF FF E0 ?? ?? ?? ?? ?? ?? ?? 48 8B 7C 24 08 8B 74 24 10 8B 54 24 14 B8 D5 01 00 00 0F 05 73 03 48 F7 D8 89 44 24 18 C3 ?? ?? 48 8B 7C 24 08 8B 74 24 10 B8 D6 01 00 00 0F 05 73 03 48 F7 D8 89 44 24 18 C3 ?? ?? ?? ?? ?? ?? 48 8B 7C 24 }
	condition:
		$1 at elf.entry_point
}
