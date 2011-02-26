#include "gestlib.h"
#include <vector>
#include <iostream>
using namespace cv; 

int layer, dCount;

class brick
{
private:
	int x, y, x_;
public:
	brick(int a, int b)
	{
		x = a;
		y = b;
	}

	brick()
	{
	}

	bool isCollide(int a, int b)
	{
		if(layer == x)
			if((a>x) && (a<x+10))
				if((b>y) && (b<y+40))
					return true;
		return false;
	}
	
	void destroy()
	{
		dCount++;
		x_ = x;
		x = 400;
	}

	Point coords()
	{
		return Point(x, y);
	}
	
	Point coords2()
	{
		return Point(x+10, y+40);
	}

	void reset()
	{
		x = x_;
	}
};
std::vector<brick> brix;

Scalar colr(int x)
{
	switch(x)
	{
	case 280:
		return Scalar(0x00, 0xff, 0xff);
	case 290:
		return Scalar(0xff, 0xff, 0x00);
	case 300:
		return Scalar(0x00, 0xff, 0x00);
	case 310:
		return Scalar(0xff, 0xff, 0xff);
	}
	return Scalar(0xff, 0xff, 0xff);
}

int main(int argc, char *argv[])
{
    
	camera c(0);
	tracker tr;
	
	cvNamedWindow("foreground",1);
	
	Mat image, test;
	int x, y, dx, dy;
	int i, j;
	char k_;
    
	x = 150;
	y = 60;

	dx=0;
	dy=0;

	layer = 280;
	dCount = 0;

	brix.push_back(brick(280, 0));
	brix.push_back(brick(280, 40));
	brix.push_back(brick(280, 80));
	brix.push_back(brick(280, 120));
	brix.push_back(brick(280, 160));
	brix.push_back(brick(280, 200));

	brix.push_back(brick(290, 0));
	brix.push_back(brick(290, 40));
	brix.push_back(brick(290, 80));
	brix.push_back(brick(290, 120));
	brix.push_back(brick(290, 160));
	brix.push_back(brick(290, 200));

	brix.push_back(brick(300, 0));
	brix.push_back(brick(300, 40));
	brix.push_back(brick(300, 80));
	brix.push_back(brick(300, 120));
	brix.push_back(brick(300, 160));
	brix.push_back(brick(300, 200));

	brix.push_back(brick(310, 0));
	brix.push_back(brick(310, 40));
	brix.push_back(brick(310, 80));
	brix.push_back(brick(310, 120));
	brix.push_back(brick(310, 160));
	brix.push_back(brick(310, 200));

	

	//Game Loop
    while(1)
    {
		c.read();
		tr.getForeground();
		tr.findHand();

		image = tr.read();
		rectangle(image, Point(x, y),Point(x+20, y+20), Scalar(0xff, 0x00, 0x00), 3);

		//Draw bricks

		for(std::vector<brick>::iterator b=brix.begin(); b!=brix.end(); b++)
		{
			rectangle(image, b->coords(), b->coords2(), colr(b->coords().x), 1);
		}	
		
		test.create(Size(1280, 800), image.type());
		resize(image, test, test.size());
		
		imshow("foreground", test);
		//imshow("foreground", image);
		
		for(i=x; i < x+20; i++)
		{
			if (tr.collide(i, y-2))
			{
				if(y < 200)
					dy=20;
				break;
			}
		}

		for(i=x; i < x+20; i++)
		{
			if (tr.collide(i, y+22))
			{
				if(y > 20)
					dy=-20;
				break;
			}
		}

		for(i=y; i < y+20; i++)
		{
			if (tr.collide(x-2, i))
			{
				if(x < layer-40)
					dx=25;
				break;
			}
		}

		for(i=y; i < y+20; i++)
		{
			for(std::vector<brick>::iterator b=brix.begin(); b!=brix.end(); b++)
			{
				for(j=x; j<x+20; j++)
					if(b->isCollide(j, i))
						b->destroy();
			}

			if (tr.collide(x+22, i))
			{
				if(x > 20)
					dx=-25;
				break;
			}
		}
		
		x+=dx;
		y+=dy;

		if(x<20)
		{
			if(dx<0)
				dx*=-1;
			else if(dx==0)
				dx = 10;
		}

		if(x > layer)
		{
			if(dx>0)
				dx*=-1;
			else if(dx==0)
				dx = -10;
		}

		if(y<20)
		{
			if(dy<0)
				dy*=-1;
			else if(dy==0)
				dy = 10;
		}

		if(y>200)
		{
			if(dy>0)
				dy*=-1;
			else if(dy==0)
				dy = -10;
		}

		if(dx!=0)
			dx = (dx<0) ? dx+1:dx-1;
		if(dy!=0)
			dy = (dy<0) ? dy+1:dy-1;

		if(dCount == 6)
		{
			dCount = 0;
			layer += 10;
		}

		k_ = waitKey(30);
		if(k_ == 'q')
			break;
		if(layer == 320)
		{
			for(std::vector<brick>::iterator b=brix.begin(); b!=brix.end(); b++)
			{
				b->reset();
			}	
			layer = 280;
			dCount = 0;
			//std::cout<<"You Win!!!"<<std::endl;
			//break;
		}
    }

	cvDestroyWindow("foreground");
    return 0;
}
