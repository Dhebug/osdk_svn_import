/*
 *	charset.S - Oric character set data
 *	FF sometime in 1994-1997
 */

/*
This file is copyright 1994-1997 Fabrice Franc�s.

This program is free software; you can redistribute it and/or modify it under
the terms of version 2 of the GNU General Public License as published by the
Free Software Foundation.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program; if not, write to the Free Software Foundation, Inc., 59 Temple
Place, Suite 330, Boston, MA 02111-1307, USA.
*/


	.global _charset,_charset2
	.global  charset, charset2
	.data
_charset:
charset:
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00
	.byte 0x08,0x08,0x08,0x08,0x08,0x00,0x08,0x00
	.byte 0x14,0x14,0x14,0x00,0x00,0x00,0x00,0x00
	.byte 0x14,0x14,0x3E,0x14,0x3E,0x14,0x14,0x00
	.byte 0x08,0x1E,0x28,0x1C,0x0A,0x3C,0x08,0x00
	.byte 0x30,0x32,0x04,0x08,0x10,0x26,0x06,0x00
	.byte 0x10,0x28,0x28,0x10,0x2A,0x24,0x1A,0x00
	.byte 0x08,0x08,0x08,0x00,0x00,0x00,0x00,0x00
	.byte 0x08,0x10,0x20,0x20,0x20,0x10,0x08,0x00
	.byte 0x08,0x04,0x02,0x02,0x02,0x04,0x08,0x00
	.byte 0x08,0x2A,0x1C,0x08,0x1C,0x2A,0x08,0x00
	.byte 0x00,0x08,0x08,0x3E,0x08,0x08,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x08,0x08,0x10
	.byte 0x00,0x00,0x00,0x3E,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x04,0x00,0x00
	.byte 0x00,0x02,0x04,0x08,0x10,0x20,0x00,0x00
	.byte 0x1C,0x22,0x26,0x2A,0x32,0x22,0x1C,0x00
	.byte 0x08,0x18,0x08,0x08,0x08,0x08,0x1C,0x00
	.byte 0x1C,0x22,0x02,0x04,0x08,0x10,0x3E,0x00
	.byte 0x3E,0x02,0x04,0x0C,0x02,0x22,0x1C,0x00
	.byte 0x04,0x0C,0x14,0x24,0x3E,0x04,0x04,0x00
	.byte 0x3E,0x20,0x3C,0x02,0x02,0x22,0x1C,0x00
	.byte 0x0C,0x10,0x20,0x3C,0x22,0x22,0x1C,0x00
	.byte 0x3E,0x02,0x04,0x08,0x10,0x10,0x10,0x00
	.byte 0x1C,0x22,0x22,0x1C,0x22,0x22,0x1C,0x00
	.byte 0x1C,0x22,0x22,0x1E,0x02,0x04,0x18,0x00
	.byte 0x00,0x00,0x08,0x00,0x00,0x08,0x00,0x00
	.byte 0x00,0x00,0x08,0x00,0x00,0x08,0x08,0x10
	.byte 0x04,0x08,0x10,0x20,0x10,0x08,0x04,0x00
	.byte 0x00,0x00,0x3E,0x00,0x3E,0x00,0x00,0x00
	.byte 0x10,0x08,0x04,0x02,0x04,0x08,0x10,0x00
	.byte 0x1C,0x22,0x04,0x08,0x08,0x00,0x08,0x00
	.byte 0x1C,0x22,0x2A,0x2E,0x2C,0x20,0x1E,0x00
	.byte 0x08,0x14,0x22,0x22,0x3E,0x22,0x22,0x00
	.byte 0x3C,0x22,0x22,0x3C,0x22,0x22,0x3C,0x00
	.byte 0x1C,0x22,0x20,0x20,0x20,0x22,0x1C,0x00
	.byte 0x3C,0x22,0x22,0x22,0x22,0x22,0x3C,0x00
	.byte 0x3E,0x20,0x20,0x3C,0x20,0x20,0x3E,0x00
	.byte 0x3E,0x20,0x20,0x3C,0x20,0x20,0x20,0x00
	.byte 0x1E,0x20,0x20,0x20,0x26,0x22,0x1E,0x00
	.byte 0x22,0x22,0x22,0x3E,0x22,0x22,0x22,0x00
	.byte 0x1C,0x08,0x08,0x08,0x08,0x08,0x1C,0x00
	.byte 0x02,0x02,0x02,0x02,0x02,0x22,0x1C,0x00
	.byte 0x22,0x24,0x28,0x30,0x28,0x24,0x22,0x00
	.byte 0x20,0x20,0x20,0x20,0x20,0x20,0x3E,0x00
	.byte 0x22,0x36,0x2A,0x2A,0x22,0x22,0x22,0x00
	.byte 0x22,0x22,0x32,0x2A,0x26,0x22,0x22,0x00
	.byte 0x1C,0x22,0x22,0x22,0x22,0x22,0x1C,0x00
	.byte 0x3C,0x22,0x22,0x3C,0x20,0x20,0x20,0x00
	.byte 0x1C,0x22,0x22,0x22,0x2A,0x24,0x1A,0x00
	.byte 0x3C,0x22,0x22,0x3C,0x28,0x24,0x22,0x00
	.byte 0x1C,0x22,0x20,0x1C,0x02,0x22,0x1C,0x00
	.byte 0x3E,0x08,0x08,0x08,0x08,0x08,0x08,0x00
	.byte 0x22,0x22,0x22,0x22,0x22,0x22,0x1C,0x00
	.byte 0x22,0x22,0x22,0x22,0x22,0x14,0x08,0x00
	.byte 0x22,0x22,0x22,0x2A,0x2A,0x36,0x22,0x00
	.byte 0x22,0x22,0x14,0x08,0x14,0x22,0x22,0x00
	.byte 0x22,0x22,0x14,0x08,0x08,0x08,0x08,0x00
	.byte 0x3E,0x02,0x04,0x08,0x10,0x20,0x3E,0x00
	.byte 0x1E,0x10,0x10,0x10,0x10,0x10,0x1E,0x00
	.byte 0x00,0x20,0x10,0x08,0x04,0x02,0x00,0x00
	.byte 0x3C,0x04,0x04,0x04,0x04,0x04,0x3C,0x00
	.byte 0x08,0x14,0x22,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x3F
	.byte 0x10,0x08,0x04,0x00,0x00,0x00,0x00,0x00
	.byte 0x00,0x00,0x1C,0x02,0x1E,0x22,0x1E,0x00
	.byte 0x20,0x20,0x3C,0x22,0x22,0x22,0x3C,0x00
	.byte 0x00,0x00,0x1E,0x20,0x20,0x20,0x1E,0x00
	.byte 0x02,0x02,0x1E,0x22,0x22,0x22,0x1E,0x00
	.byte 0x00,0x00,0x1C,0x22,0x3E,0x20,0x1E,0x00
	.byte 0x0C,0x12,0x10,0x3C,0x10,0x10,0x10,0x00
	.byte 0x00,0x00,0x1C,0x22,0x22,0x1E,0x02,0x1C
	.byte 0x20,0x20,0x3C,0x22,0x22,0x22,0x22,0x00
	.byte 0x08,0x00,0x18,0x08,0x08,0x08,0x1C,0x00
	.byte 0x04,0x00,0x0C,0x04,0x04,0x04,0x24,0x18
	.byte 0x20,0x20,0x22,0x24,0x38,0x24,0x22,0x00
	.byte 0x18,0x08,0x08,0x08,0x08,0x08,0x1C,0x00
	.byte 0x00,0x00,0x36,0x2A,0x2A,0x2A,0x22,0x00
	.byte 0x00,0x00,0x3C,0x22,0x22,0x22,0x22,0x00
	.byte 0x00,0x00,0x1C,0x22,0x22,0x22,0x1C,0x00
	.byte 0x00,0x00,0x3C,0x22,0x22,0x3C,0x20,0x20
	.byte 0x00,0x00,0x1E,0x22,0x22,0x1E,0x02,0x02
	.byte 0x00,0x00,0x2E,0x30,0x20,0x20,0x20,0x00
	.byte 0x00,0x00,0x1E,0x20,0x1C,0x02,0x3C,0x00
	.byte 0x10,0x10,0x3C,0x10,0x10,0x12,0x0C,0x00
	.byte 0x00,0x00,0x22,0x22,0x22,0x26,0x1A,0x00
	.byte 0x00,0x00,0x22,0x22,0x22,0x14,0x08,0x00
	.byte 0x00,0x00,0x22,0x22,0x2A,0x2A,0x36,0x00
	.byte 0x00,0x00,0x22,0x14,0x08,0x14,0x22,0x00
	.byte 0x00,0x00,0x22,0x22,0x22,0x1E,0x02,0x1C
	.byte 0x00,0x00,0x3E,0x04,0x08,0x10,0x3E,0x00
	.byte 0x0E,0x18,0x18,0x30,0x18,0x18,0x0E,0x00
	.byte 0x08,0x08,0x08,0x08,0x08,0x08,0x08,0x08
	.byte 0x38,0x0C,0x0C,0x06,0x0C,0x0C,0x38,0x00
	.byte 0x12,0x2A,0x24,0x00,0x00,0x00,0x00,0x00
	.byte 0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F

_charset2:
charset2:
	.byte 0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x3F,0x00
	.byte 0x3F,0x01,0x01,0x01,0x01,0x01,0x3F,0x00
	.byte 0x3F,0x20,0x30,0x30,0x30,0x20,0x3F,0x00
	.byte 0x3F,0x20,0x3F,0x3F,0x3F,0x20,0x3F,0x00
	.byte 0x3F,0x01,0x3D,0x3D,0x3D,0x01,0x3F,0x00
	.byte 0x0C,0x12,0x25,0x29,0x29,0x25,0x12,0x0C
	.byte 0x01,0x03,0x07,0x0F,0x07,0x03,0x01,0x00
	.byte 0x04,0x0C,0x1C,0x3C,0x1C,0x0C,0x04,0x00
	.byte 0x08,0x0C,0x0E,0x0F,0x0E,0x0C,0x08,0x00
	.byte 0x20,0x30,0x38,0x3C,0x38,0x30,0x20,0x00
	.byte 0x02,0x02,0x02,0x02,0x02,0x02,0x02,0x00
	.byte 0x0C,0x1E,0x3F,0x3F,0x3F,0x1E,0x0C,0x00
	.byte 0x0C,0x12,0x21,0x21,0x21,0x12,0x0C,0x00
	.fill 8*67
