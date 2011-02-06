
#include "exa-base.h"
#include "exa-font.h"

#include "skin.h"

#include <math.h>

#include <sys/utsname.h> //for uname/hostname.

#include <string>
#include <vector>
#include <iostream>
using namespace std;

exaGLFont font;
string login_line;

int Mode; //login/pw/session/wait

static orthos_validate_login_func validate_login;
static orthos_do_login_func do_login;
static orthos_action_func action;
static orthos_get_config_func config;

static int x=0,y=0;

class Session {
public:
	string name,cmd;
	Session(const string&n,const string&c) {name=n;cmd=c;}
	Session(const char*n,const char*c) {name=n;cmd=c;}
};

vector<Session> sessions;
int selected_session;

class InputBox {
public:
	string text,cap;
	int cur;
	float cursor_flash;
	bool pw;
	float color[3],dstcolor[3];

	InputBox() {
		color[0]=color[1]=color[2]=
			dstcolor[0]=dstcolor[1]=dstcolor[2]=0.4;

		cur=0;
		cursor_flash=0;
		pw=false;
	}

	bool update(float time);
	void draw();
	void clear(){cap.clear();text.clear();cur=0;}
	void setcolor(float r,float g,float b)
		{dstcolor[0]=r;dstcolor[1]=g;dstcolor[2]=b;}
	void flash(float r,float g,float b)
		{color[0]=r;color[1]=g;color[2]=b;}
	void pwmask(bool b){pw=b;}
	template <class Str> void setcaption(Str s){cap=s;}
};

class SessionBox {
public:
	float pos,showpos,timeout;
	bool show;
	SessionBox() {
		pos=selected_session;
		show=false;
		showpos=0;
		timeout=0;
	}
	void update(float time);
	void draw();
};

class ShutdownBox {
public:
	bool show;
	float timeout;
	float showstate;
	bool unlocked[2];
	float color[2];

	ShutdownBox() {
		show=unlocked[0]=unlocked[1]=false;
		timeout=showstate=color[0]=color[1]=0;
	}

	void update(float time);
	void draw();
};

void ShutdownBox::update(float time)
{
	if(show)timeout+=time;
	if(timeout>5){
		show=false;
		color[0]=color[1]=0;
		unlocked[0]=unlocked[1]=false;
	}

	if(show)showstate+=2*time;
	else showstate-=time;
	if(showstate>1)showstate=1;
	if(showstate<0)showstate=0;

	if(exaIsKeyHit(EKEY_ESCAPE)||((!show)&&(exaIsKeyHit(EKEY_F1)||exaIsKeyHit(EKEY_F2)))){
		unlocked[0]=unlocked[1]=false;
		color[0]=color[1]=1;
		timeout=0;show=true;
	}
	else if(show){
		if(exaIsKeyHit(EKEY_F1)){
			if(unlocked[0]){
				action("/sbin/reboot");
				Mode=4;
			}
			unlocked[0]=true;
			timeout=0;
		}
		if(exaIsKeyHit(EKEY_F2)){
			if(unlocked[1]){
				action("/sbin/halt");
				Mode=4;
			}
			unlocked[1]=true;
			timeout=0;
		}
	}

	for(int i=0;i<2;++i) {
		if(unlocked[i]) color[i]=1-((1-color[i])*powf(0.2,time));
		else color[i]*=powf(0.2,time);
	}
}

static void write_rev(const char*s)
{
	glPushMatrix();
	glTranslatef(-font.getstrlen(s),0,0);
	font.write(s);
	glPopMatrix();
}

void ShutdownBox::draw()
{
	glPushMatrix();
	glEnable(GL_BLEND);
	glBlendFunc(GL_ONE,GL_ONE);
	float t;
	glPushMatrix();
		glTranslatef(-0.3,0,0);
		t=(0.2+0.8*color[0])*showstate;
		glColor3f(t,t*0.7,0);
		write_rev("reboot");
		glTranslatef(0,-1,0);
		write_rev("F1");
	glPopMatrix();
	glPushMatrix();
		glTranslatef(0.3,0,0);
		t=(0.2+0.8*color[1])*showstate;

		glColor3f(t,t*0.2,t*0.1);
		glPushMatrix();
		font.write("halt");
		glPopMatrix();
		glTranslatef(0,-1,0);
		glPushMatrix();
		font.write("F2");
		glPopMatrix();
	glPopMatrix();
	glDisable(GL_BLEND);
	glPopMatrix();
}



void SessionBox::update(float time)
{
	if(show)showpos+=time*2;
	else showpos-=time;
	if(showpos<0)showpos=0;
	if(showpos>1)showpos=1;

	if(show)timeout+=time;
	if(timeout>2)show=false;
	
	if(exaIsKeyTyped(EKEY_UP))
	{
		if(selected_session>0)--selected_session;
		timeout=0;show=true;
	}
	if(exaIsKeyTyped(EKEY_DOWN))
	{
		if(selected_session<(int)sessions.size()-1)++selected_session;
		timeout=0;show=true;
	}
	if(exaIsKeyTyped(EKEY_PAGEUP))
	{
		selected_session=0;
		timeout=0;show=true;
	}
	if(exaIsKeyTyped(EKEY_PAGEDOWN))
	{
		selected_session=sessions.size()-1;
		timeout=0;show=true;
	}

	pos+=(selected_session-pos)*(1-powf(0.02,time));
}

void SessionBox::draw()
{
	glPushMatrix();
	glEnable(GL_BLEND);
	glBlendFunc(GL_ONE,GL_ONE);
	if(showpos==0){
		glPushMatrix();
		glTranslatef(1,0,0);
		glBegin(GL_TRIANGLES);
			glColor3f(0,0,0);
			glVertex2f(0.3,0);
			glVertex2f(-0.3,0);
			glColor3f(0.4,0.4,0.4);
			glVertex2f(0,-0.6);
			glVertex2f(0,1.6);
			glColor3f(0,0,0);
			glVertex2f(-0.3,1);
			glVertex2f(0.3,1);
		glEnd();
		glPopMatrix();
		glColor3f(0.2,0.2,0.2);
		glTranslatef(-0.2-font.getstrlen("session"),0,0);
		font.write("session");
		glTranslatef(0.4,0,0);
		font.write(sessions[selected_session].name.c_str());
	} else {
		float radius = 3*showpos;
		float shade;
		int start=(int)ceilf(pos-radius);
		glTranslatef(0,2*showpos,0);
		glPushMatrix();
			glColor3f(0.2,0.2,0.2);
			glTranslatef(-0.2-font.getstrlen("session"),0,0);
			font.write("session");
		glPopMatrix();
		glTranslatef(0.2,pos-start,0);
		for(int i=start;i<ceilf(pos+radius);++i){
			if((i<0)||(i>=(int)sessions.size())){
				glTranslatef(0,-1,0);
				continue;
			}
			shade=1-(fabs(pos-i)/radius);
			glColor3f(shade,shade,shade);
			glPushMatrix();
			font.write(sessions[i].name.c_str());
			glPopMatrix();
			glTranslatef(0,-1,0);
		}
	}

	glDisable(GL_BLEND);
	glPopMatrix();
}

bool InputBox::update(float time)
{
	cursor_flash-=time;
	while(cursor_flash<0)cursor_flash+=1;

	int *key;
	int n=exaGetKeyTypes(&key);
	for(int i=0;i<n;++i) switch(key[i]) {
	case EKEY_LEFT:
		if(cur>0)cur--;
		break;
	case EKEY_RIGHT:
		if(cur<(int)text.length())cur++;
		break;
	case EKEY_HOME:
		cur=0;
		break;
	case EKEY_END:
		cur=text.length();
		break;
	case EKEY_DELETE:
		if(exaIsKeyDown(EKEY_LSHIFT)||exaIsKeyDown(EKEY_RSHIFT)){
			cur=0; text.clear(); break;}
		if(cur<(int)text.length())text.erase(cur,1);
		break;
	case EKEY_BACKSPACE:
		if(exaIsKeyDown(EKEY_LSHIFT)||exaIsKeyDown(EKEY_RSHIFT)){
			cur=0; text.clear(); break;}
		if(cur>0)text.erase(--cur,1);
		break;
	default:
		if(exaIsPrintableEKEY(key[i]))
			text.insert(cur++,1,exaEKEY2char(key[i]));
		break;
	}

	float r=1-powf(0.2,time);
	for(int i=0;i<3;++i)
		color[i]+=(dstcolor[i]-color[i])*r;

	return false;
}

void InputBox::draw()
{
	glPushMatrix();
	glTranslatef(0,-0.5,0);
	glEnable(GL_BLEND);
	glBlendFunc(GL_ONE,GL_ONE);
	glBegin(GL_TRIANGLE_STRIP);
		glColor3f(0,0,0);
		glVertex2f(-20,-0.5);
		glVertex2f(-20,1.5);
		glColor3f(color[0]*0.1,color[1]*0.1,color[2]*0.1);
		glVertex2f(-10,-0.5);
		glVertex2f(-10,1.5);
		glColor3fv(color);
		glVertex2f(0,-0.5);
		glVertex2f(0,1.5);
		glColor3f(0,0,0);
		glVertex2f(10,-0.5);
		glVertex2f(10,1.5);
	glEnd();
	glBegin(GL_LINE_STRIP);
		glColor3f(0,0,0);
		glVertex2f(20,-0.5);
		glColor3f(0.6,0.6,0.6);
		glVertex2f(0,-0.5);
		glVertex2f(0,1.5);
		glColor3f(0,0,0);
		glVertex2f(20,1.5);
	glEnd();


	glBlendFunc(GL_ZERO,GL_ONE_MINUS_SRC_COLOR);

	glColor3f(1,1,1);
	glPushMatrix();
	//glScalef(0.9,0.9,0.9);
	glTranslatef(-font.getstrlen(cap.c_str())-0.2,0,0);
	font.write(cap.c_str());
	glPopMatrix();

	//glBlendFunc(GL_ONE,GL_ONE);
	glPushMatrix();
	glTranslatef(0.4,0,0);
	if(!pw){
		glColor3f(1,1,1);
		font.write(text.substr(0,cur).c_str());
		glBegin(GL_LINES);
			glColor3f(cursor_flash,cursor_flash,cursor_flash);
			glVertex2f(0,-0.1);
			glVertex2f(0,1.1);
		glEnd();
		glColor3f(1,1,1);
		font.write(text.substr(cur).c_str());
	} else {
		glBegin(GL_LINES);
			glColor3f(cursor_flash,cursor_flash,cursor_flash);
			glVertex2f(0,0.5);
			glColor3f(0,0,0);
			glVertex2f(3,0.5);
		glEnd();
	}
	glPopMatrix();

	glPopMatrix();
	glDisable(GL_BLEND);
}

InputBox box;
SessionBox sess;
ShutdownBox shut;

int parse_sessions(const char*s)
{
	sessions.clear();
	sessions.push_back(Session("custom",""));
	selected_session=1;
	string a,n;
	bool first=true;
	while(*s){ if(*s==':'){
			if(first){ n=a; a.clear(); }
			else { sessions.push_back(Session(n,a));
				n.clear(); a.clear(); }
			first=!first;
		} else a.append(1,*s);
		++s;
	}
	if(!first) sessions.push_back(Session(n,a));

	return 0;
}

int orthos_skin_start()
{
	//----
	
	exaSetParams(x,y,24);
	if(!exaInit())return 1;

	exaKeyRepeat(0.4,0.05);

	const char*font_fn=config("font");

	font.loadfromfreetype(font_fn?font_fn:
		"/usr/share/fonts/ttf-bitstream-vera/VeraMono.ttf",20);

	box.setcaption(login_line);
	
	glClearColor(0,0,0,0);
	glShadeModel(GL_SMOOTH);
	glDisable(GL_DEPTH_TEST);

	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glFrustum(-0.16,0.16,-0.1,0.1,0.1,100);
	glMatrixMode(GL_MODELVIEW);


	Mode=0;
	box.setcaption(login_line);
	box.pwmask(false);
	box.setcolor(0.4,0.4,0.4);
	box.flash(0,0,0);
	exaGetElapsedTime();
	return 0;
}


float rot;
string login,pw,session;

int orthos_skin_update()
{
	exaUpdate();
	float time=0;

	while(time<0.02){
		time+=exaGetElapsedTime();
		exaUSleep(2000);
	}

	rot+=time;
	box.update(time);
	sess.update(time);
	shut.update(time);

	if(exaIsKeyHit(EKEY_RETURN))
		switch(Mode){
		case 0:
			login=box.text;
			Mode=1;
			box.clear();
			box.setcaption("password");
			box.setcolor(0.2,0.2,0.2);
			box.pwmask(true);
			break;
		case 1:
			pw=box.text;
			box.clear();
			if(selected_session) {
				if(validate_login(login.c_str(),pw.c_str())){
					Mode=0;
					box.setcaption(login_line);
					box.setcolor(0.4,0.4,0.4);
					box.flash(1,0,0);
					box.pwmask(false);
				} else Mode=3;
			} else {
				Mode=2;
				box.setcaption("session");
				box.setcolor(0.1,0.1,0.4);
				box.pwmask(false);
			}
			break;
		case 2:
			session=box.text;
			box.clear();
			if(validate_login(login.c_str(),pw.c_str())) {
				Mode=0;
				box.setcaption(login_line);
				box.setcolor(0.4,0.4,0.4);
				box.flash(1,0,0);
				box.pwmask(false);
			} else Mode=3;
			break;
		case 3:
		case 4:
			break;
		default:
			Mode=0;
			box.clear();
			box.setcaption(login_line);
			box.pwmask(false);
			box.setcolor(0.4,0.4,0.4);
			box.flash(0,0,0);
			break;
		}

	glClear(GL_COLOR_BUFFER_BIT);
	glLoadIdentity();

	glTranslatef(0,0,-5);
	glRotatef(rot,0,0,1);
	for(int i=0;i<10;++i){
		glBegin(GL_TRIANGLE_STRIP);
			glColor3f(0,0,0);
			glVertex3f(1,5,5);
			glVertex3f(-1,5,5);
			glColor3f(0,0.1,0.3);
			glVertex3f(1,5,-1);
			glVertex3f(-1,5,-1);
			glColor3f(0,0,0);
			glVertex3f(1,5,-20);
			glVertex3f(-1,5,-20);
		glEnd();
		glRotatef(36,0,0,1);
	}
	
	glLoadIdentity();
	glTranslatef(0,0,-25);
	box.draw();
	glTranslatef(0,2,0);
	sess.draw();
	glTranslatef(0,-6,0);
	shut.draw();
	
	exaglSwapBuffers();
	switch (Mode) {
	case 3:
		do_login(login.c_str(),selected_session?sessions[selected_session].cmd.c_str():session.c_str());
		return 0;
	case 4:
		return 0;
	}
	return 1;
}

int orthos_skin_init (int X, int Y,
	orthos_validate_login_func f1,
	orthos_do_login_func f2,
	orthos_action_func f3,
	orthos_get_config_func f4)
{
	x=X;y=Y;
	validate_login=f1;
	do_login=f2;
	action=f3;
	config=f4;
	
	parse_sessions(config("sessions"));

	//login_line=string(getenv("HOSTNAME"))+" login";
	struct utsname u;
	uname(&u);
	login_line=string(u.nodename)+" login";
	return 0;
}

int orthos_skin_fini()
{

	return 0;
}

int orthos_skin_stop()
{
	font.unload();
	exaShutdown();
	return 0;
}

