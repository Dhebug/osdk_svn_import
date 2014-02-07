/*
Tycho Blue
A Moon Adventure for the Oric Atmos by Neil Barnes
Chapter X. Introduction of Agents Green and Blue, the Agency Boss, 
Blondie and the Rebel Commander

SCENES:

SceneA: Debrief of Agent Blue about the failed mission to protect the US Confederate
ambassador to UK and the disappearance of Agent Green. Who? Why? What?
SceneB: Thermal Imaging of both The Assasination , The Chase and the disappearance of 
Agent Green near a mothballed US Air Base. Text of Blue's account.
SceneC: Agent Blue receives phone call from a shadowy figure known as the
Rebel Commander. "We have him. Don't get in our way" 
SceneD: Flashback: Pyong Yang: Rescue of Blue by Green from the Chinese Army of
Occupation. 

History
04/02/2014 Started work with first few vids and sorted out display routines
05/02/2014 added more vids
*/
#include <lib.h>
#define BLACK 0
#define RED	1
#define GREEN 2
#define YELLOW 3
#define BLUE 4
#define MAGENTA 5
#define CYAN 6
#define WHITE 7
/* Definition of Global variables */
extern unsigned char Tears[];		// video talking 
extern unsigned char LookRight[];	// video looking right
extern unsigned char Yabber[];		// video talking
extern unsigned char YouFuck[];		// video "you fuck"
extern unsigned char Whoops[];		// video whoops
extern unsigned char NodYes[];		// video nodding
extern unsigned char LeanForward[];	// video leaning forward
unsigned char Frame;				// Frame of video to play
int PauseTime,PauseCount;			// amount of time to Pause
unsigned char* PtrGraphic;			// pointer to byte values of loaded picture
unsigned char InkColor;
/* Listing of Functions */

void Pause();		// adds pause to video playback
void PlayChunk(unsigned char Chunk[]);	// play part of video
void PlayVideo();	// play all video


/* Main Program */

void main(){
	hires();
	InkColor=CYAN; VideoInkLeft();	// set ink to right of video
	PauseTime=900;
	for(;;){
		PlayVideo();
	}
}


/* Definition of Functions */

void PlayVideo(){
  PlayChunk(LookRight);
  PlayChunk(Yabber);
  PlayChunk(Tears);
  PlayChunk(YouFuck);
  PlayChunk(Whoops);
  PlayChunk(NodYes);
  PlayChunk(LeanForward);
}

void PlayChunk(unsigned char Chunk[]){
	for (Frame=0;Frame<6; Frame++){
		PtrGraphic=Chunk;
		DrawFrame();
		Pause();
	}
	for (Frame=5;Frame>0;Frame--){
		PtrGraphic=Chunk;
		DrawFrame();
		Pause();
	}
}

void Pause(){
  for (PauseCount=0; PauseCount<PauseTime;PauseCount++){};
}


