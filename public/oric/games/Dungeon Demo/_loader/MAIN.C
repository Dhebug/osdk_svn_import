//
//
//
//
//
//			    ����� ����� �� �� �����
//			    �� �� ����� ��� � ����
//			    ����� ��  � ��  � �����
//
//		      �     ����� ����� ����� ����� �����
//		      ��    ��	� ����� ��  � ����  �����
//		      ����� ����� ��  � ����  ����� ��	�
//
//
//
//

//
//  Ce petit module est destin� � assurer la liaison entre les
// diff�rents morceaux du jeu.
//
//  Le premier test sera de savoir si on peu lancer plusieurs
// ex�cutables, les uns � la suite des autres !!!
//



#include    "lib.h"

#include    "defines.h"


void cload(char *name)
{
    poke(0x24d,0);  // rapide
    poke(0x2ae,1);  // Asm
    poke(0x25e,0);  // No V�rifi
    poke(0x25a,0);  // NoMerge
    strcpy((char*)0x293,name);
    strcpy((char*)0x27f,name);
    call(0xe874);
    /*
    call(0xe76a);   // Inhibe kbd
    call(0xe57d);   // Searching
    call(0xe4ac);
    call(0xe59b);
    call(0xe4e0);
    call(0xe93d);
    */
    //call(0x600);
}

void main()
{

    hires();
    while (TRUE)
    {
	cload("NEXT.HIR");
	cload("PAUSE.HIR");
	cload("HELP.HIR");
	//sedoric("!LOAD \"GAME.COM\"");
    }
}


