
#include "exa-base.h"
#include <stdlib.h>
#include <string.h>

#ifndef WIN32
# include <unistd.h>
#endif

#ifndef EXA_KEY_BUFFER_SIZE
#define EXA_KEY_BUFFER_SIZE 64
#endif


static int rx = 1024, ry = 768, bpp = 32, depthbpp = 24, stencilbpp = 0, accumbpp = 0;
static bool isinit = false, iconified = false;
static SDL_Surface *surface;

static int keyhit[EXA_KEY_BUFFER_SIZE], keydown[EXA_KEY_BUFFER_SIZE], nkeyhits = 0, nkeydowns = 0;
static int mousex = 0, mousey = 0;
static unsigned char mbuttondown = 0, mbuttonhit = 0;
static bool wheelup = false, wheeldown = false;
static bool typerepeats;
static float keytime[EXA_KEY_BUFFER_SIZE], typedelay, typerepeat;
static int keytypes[EXA_KEY_BUFFER_SIZE], nkeytypes = 0;

int exaSetParams (int x, int y, int screenbpp, int depth, int stencil, int accum)
{
	if ( (x <= 0) || (y <= 0) || ( (screenbpp != 24) && (screenbpp != 32) ) ) return 1;
	rx = x;
	ry = y;
	bpp = screenbpp;
	depthbpp = depth;
	stencilbpp = stencil;
	accumbpp = accum;
	return 0;
}

bool exaIsInit()
{
	return isinit;
}

bool exaInit()
{
	printf("exaInit: started!\n");
	int vidflags;
	const SDL_VideoInfo *videoinfo;

	if (isinit) return true; //suppose it's ok

	if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_TIMER) < 0) {
		printf ("exaInit: SDL_Init failed: %s\n", SDL_GetError() );
		return false;
	}
	printf("exaInit: sdl_init done\n");

	videoinfo = SDL_GetVideoInfo();
	if (!videoinfo) {
		printf ("exaInit: SDL_GetVideoInfo failed: %s\n", SDL_GetError() );
		return false;
	}
	printf("exaInit: sdl_getvideoinfo done\n");

	vidflags = SDL_OPENGL | SDL_GL_DOUBLEBUFFER | SDL_HWPALETTE | SDL_FULLSCREEN;
	if (videoinfo->hw_available)
		vidflags |= SDL_HWSURFACE;
	else
		vidflags |= SDL_SWSURFACE;
	if (videoinfo->blit_hw)
		vidflags |= SDL_HWACCEL;

	SDL_GL_SetAttribute (SDL_GL_DOUBLEBUFFER, 1);
	SDL_GL_SetAttribute (SDL_GL_BUFFER_SIZE, bpp);
	SDL_GL_SetAttribute (SDL_GL_DEPTH_SIZE, depthbpp);
	SDL_GL_SetAttribute (SDL_GL_STENCIL_SIZE, stencilbpp);
	SDL_GL_SetAttribute (SDL_GL_ACCUM_RED_SIZE, accumbpp);
	SDL_GL_SetAttribute (SDL_GL_ACCUM_GREEN_SIZE, accumbpp);
	SDL_GL_SetAttribute (SDL_GL_ACCUM_BLUE_SIZE, accumbpp);

	surface = SDL_SetVideoMode (rx, ry, bpp, vidflags);
	if (!surface) {
		printf ("exaInit: SDL_SetVideoMode failed: %s\n", SDL_GetError() );
		return false;
	}

	//and now something completely GL different;)

	glViewport (0, 0, rx, ry);

	//following opengl stuff is a subject to change (delete),
	//because in most cases is gonna be overriden by user(=developer) settings
	glMatrixMode (GL_PROJECTION);
	glLoadIdentity();
	gluPerspective (45.0f, (float) rx / (float) ry, 0.1f, 100.0f);
	glMatrixMode (GL_MODELVIEW);
	glLoadIdentity();

	SDL_WM_GrabInput (SDL_GRAB_ON);
	SDL_ShowCursor (SDL_DISABLE);
	//SDL_WM_ToggleFullScreen(surface);

	iconified = false;
	isinit = true;
	nkeydowns = 0;
	nkeyhits = 0;
	mousex = 0;
	mousey = 0;
	mbuttondown = 0;
	mbuttonhit = 0;
	wheelup = wheeldown = false;
	typerepeats = false; //by default, do not compute them

	//Everything is OK
	return true;
}

bool exaShutdown()
{
	if (!isinit) return true;
	SDL_ShowCursor (SDL_ENABLE);
	SDL_WM_GrabInput (SDL_GRAB_OFF);
	//SDL_WM_ToggleFullScreen(surface);
	SDL_Quit();
	isinit = false;
	return true;
}


bool exaIsIconified()
{
	if (!isinit) return false;
	return iconified;
}

float exaGetUptime()
{
	if (!isinit) return false;
	return 0.001f*SDL_GetTicks();
}

float exaGetElapsedTime()
{
	if (!isinit) return 0;
	static unsigned int lasttime = 0;
	unsigned int t = SDL_GetTicks();
	register float eltime = 0.001f * (t - lasttime);
	lasttime = t;
	return eltime;
}

void exaDelay (float secs)
{
	if (!isinit) return;
	SDL_Delay ( (unsigned int) (secs*1000) );
	//WARNING. SDL_Delay consumes 100% cpu
}

void exaUSleep (unsigned long usec)
{
#ifndef WIN32
	usleep (usec);
#else
	if (!isinit) return;
	SDL_Delay (usec / 1000);
#endif
}

void _Keydown (SDL_keysym*k)
{
	if (nkeyhits < EXA_KEY_BUFFER_SIZE) {
		keyhit[nkeyhits] = k->sym;
		++nkeyhits;
	}

	if (typerepeats) if (nkeytypes < EXA_KEY_BUFFER_SIZE) {
			keytypes[nkeytypes] = k->sym;
			++nkeytypes;
		}

	if (nkeydowns < EXA_KEY_BUFFER_SIZE) {
		keydown[nkeydowns] = k->sym;
		if (typerepeats) keytime[nkeydowns] = typerepeat - typedelay;
		++nkeydowns;
	}
	return;
}

void _Keyup (SDL_keysym*k)
{
	int i;
	if (nkeydowns <= 0) return;
	for (i = 0; (i < nkeydowns) && ( (k->sym) != keydown[i]);++i); //find that key to i
	keydown[i] = keydown[nkeydowns-1];
	keytime[i] = keytime[nkeydowns-1];
	--nkeydowns;    //delete key for keydowns
	return;
}

void _UpdateTypedKeys()
{
	static unsigned int lasttime = 0;
	unsigned int t = SDL_GetTicks();
	float eltime = 0.001f * (t - lasttime);
	lasttime = t;
	int i;
	for (i = 0;i < nkeydowns;++i) {
		keytime[i] += eltime;
		while (keytime[i] > typerepeat) {
			if (nkeytypes < EXA_KEY_BUFFER_SIZE) {
				keytypes[nkeytypes] = keydown[i];
				++nkeytypes;
			}
			keytime[i] -= typerepeat;
		}
	}
}

void _Clearkeys()
{
	nkeyhits = 0;
	nkeytypes = 0;
}

void _ProcessMouse()
{
	int x, y;
	unsigned char t = SDL_GetRelativeMouseState (&x, &y);
	register unsigned char b = t;
	register int i;
	mousex += x;
	mousey += y;
	mbuttonhit = 0;
	for (i = 0;i < 8;++i)  //bitwise process button hits
	{
		mbuttonhit >>= 1;
		if ( (b&1) && (! (mbuttondown&1) ) ) mbuttonhit |= 0x80;
		b >>= 1;
		mbuttondown >>= 1;
	}
	mbuttondown = t;
	wheeldown = wheelup = false;
}

void exaKeyRepeat (float delay, float repeat)
{
	if ( (repeat == 0) || (delay == 0) ) {
		typerepeats = false;
		return;
	}
	typerepeats = true;
	typedelay = delay;
	typerepeat = repeat;
}

int exaGetKeyHits (int**keys)
{
	*keys = keyhit;
	return nkeyhits;
}

int exaGetKeyDowns (int**keys)
{
	*keys = keydown;
	return nkeydowns;
}

int exaGetKeyTypes (int**keys)
{
	*keys = keytypes;
	return nkeytypes;
}

bool exaIsKeyHit (int key)
{
	for (int i = 0;i < nkeyhits;++i) if (keyhit[i] == key) return true;
	return false;
}

bool exaIsKeyDown (int key)
{
	for (int i = 0;i < nkeydowns;++i) if (keydown[i] == key) return true;
	return false;
}

bool exaIsKeyTyped (int key)
{
	for (int i = 0;i < nkeytypes;++i) if (keytypes[i] == key) return true;
	return false;
}

int exaGetMouseMove (int*x, int*y)
{
	*x = mousex;
	*y = mousey;
	mousex = mousey = 0;
	return 0;
}

bool exaIsMouseButtonHit (unsigned char button)
{
	if (SDL_BUTTON (button) &mbuttonhit) return true;
	return false;
}


bool exaIsMouseButtonDown (unsigned char button)
{
	if (SDL_BUTTON (button) &mbuttondown) return true;
	return false;
}

bool exaIsMouseWheelUp()
{
	return wheelup;
}
bool exaIsMouseWheelDown()
{
	return wheeldown;
}

bool exaUpdate()
{
	if (!isinit) return 1;
	SDL_Event event;

	_Clearkeys();
	if (typerepeats) _UpdateTypedKeys();
	_ProcessMouse();

	while (SDL_PollEvent (&event) ) {
		switch (event.type) {
		case SDL_ACTIVEEVENT:
			if (event.active.gain == 0) {
				iconified = true;
				SDL_WM_GrabInput (SDL_GRAB_OFF);
			} else {
				iconified = false;
				SDL_WM_GrabInput (SDL_GRAB_ON);
			}
			break;
		case SDL_VIDEORESIZE:
			break;
		case SDL_QUIT:
			return false;  //return 1 means the app shouldn't work anymore!!!
		case SDL_KEYDOWN:
			_Keydown (& event.key.keysym); //process key events
			break;
		case SDL_KEYUP:
			_Keyup (& event.key.keysym);
			break;
		case SDL_MOUSEBUTTONDOWN:
			if (event.button.button == SDL_BUTTON_WHEELUP) wheelup = true;
			if (event.button.button == SDL_BUTTON_WHEELDOWN) wheeldown = true;

			break;
		default:
			break;
		}
	}

	return true;
}

int exaIconifyWindow()
{
	SDL_WM_GrabInput (SDL_GRAB_OFF);
	return !SDL_WM_IconifyWindow();
}

int exaSetWindowCaption (const char* caption)
{
	SDL_WM_SetCaption (caption, NULL);
	return 0;
}

char exaEKEY2char (int ekey, bool shift, bool capslock)
{
	if (ekey >= 256) {
		if (ekey <= 272) return * ( (ekey - 256) + "0123456789./*-+\n=");
		return ' ';
	}

	if ( (ekey >= 128) ) return ' ';
	//we do not support non-base-ascii chars..yet;)
	if (ekey <= 32) return ekey;

	//TODO -- possibly all in one string;)
	//and maybe SDL has a function fir this

	if (! (shift || capslock) ) return ekey;
	//it's ok when we don't have sh/capslk

	if (ekey >= 'a') if (ekey <= 'z') {
			if (shift || capslock) return ekey -32;
			else return (char) ekey;
		} //chars

	if (!shift) return ekey;
	//capslock doesn't modify anything else than real chars

	//now we are "sure" that shift is true!

	if (ekey >= '\'') if (ekey <= '9')
			return * ( (ekey - '\'') + "\"    <_>?)!@#$%^&*(");
	if (ekey >= '[') return * ( (ekey - '[') + "{|}  ~");

	return * ( (ekey - ';') + ": +");

	return (char) ekey;
}

bool exaIsPrintableEKEY (int ekey)
{
	return ( (ekey >= 32) && (ekey < 127) ) || ( (ekey >= 256) && (ekey <= 270) );
}


int exaGetKBChars (char* charbuf) //TODO marked for deletion
{
	int i;
	for (i = 0;i < nkeyhits;++i)
		charbuf[i] = exaEKEY2char (keyhit[i]);
	return nkeyhits;
}

#pragma pack(push,1)

typedef struct
{
	unsigned short id;
	unsigned int fileSize;
	unsigned short reserved[2];
	unsigned int headerSize;
	unsigned int infoSize;
	unsigned int width;
	unsigned int height;
	unsigned short biPlanes;
	unsigned short bits;
	unsigned int biCompression;
	unsigned int biSizeImage;
	unsigned int biXPelsPerMeter;
	unsigned int biYPelsPerMeter;
	unsigned int biClrUsed;
	unsigned int biClrImportant;
}
BMPHEADER;

#pragma pack(pop)

bool exaScreenshot (int*x, int*y, int*bytes, char**d, bool bgr)
{
	char*data;
	data = (char*) malloc (rx * ry * 3);
	if (!data) return false;
#ifndef WIN32
	glReadPixels (0, 0, rx, ry, bgr ? GL_BGR : GL_RGB, GL_UNSIGNED_BYTE, data);
#else
#warning "Win32 -- GL_BGR replaced with B-R swap. Too bad, do something."
	glReadPixels (0, 0, rx, ry, GL_RGB, GL_UNSIGNED_BYTE, data);
	if (bgr) {
		char t;
		for (int i = 0;i < rx*ry;++i) {
			t = data[3*i];
			data[3*i] = data[3*i+2];
			data[3*i+2] = t;
		}
	}
#endif
	*x = rx;
	*y = ry;
	*bytes = 3;
	*d = data;
	return true;
}

