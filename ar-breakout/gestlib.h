#include <cv.h>
#include <cvaux.h>
#include <highgui.h>

cv::Mat currentFrame;			//Stores the current frame read from capture device

class camera
{
private:
	cv::VideoCapture cameraDevice;
public:
	camera(int deviceNumber=0)
	{
		cameraDevice.open(0);			//Open specified camera device
		cameraDevice.set(CV_CAP_PROP_FRAME_HEIGHT, 240);
		cameraDevice.set(CV_CAP_PROP_FRAME_WIDTH, 320);
	}

	camera(std::string filename)
	{
		cameraDevice.open(filename);				//Open video file
	}

	void read()
	{
		cameraDevice >> currentFrame;
		cv::flip(currentFrame, currentFrame, 1);
	}

	~camera()
	{
		cameraDevice.release();
		currentFrame.release();
	}
};


class tracker
{
private:
	cv::Mat foreground;
	cv::Mat tempFrame, hsvFrame, grayFrame;
	cv::Scalar skin_hsv_min, skin_hsv_max;
	CvMemStorage *storage;
	CvSeq *conts;
	CvSeq Hand;


public:
	tracker()
	{
		//Set range for skin color
		skin_hsv_min = cvScalar(0, 20, 50, 0);
		skin_hsv_max = cvScalar(30, 200, 255, 0);
		storage = cvCreateMemStorage(0);
		conts = 0;
	}

	void getForeground()
	{
		//Convert to hsv color for skin detection
		cv::cvtColor(currentFrame, hsvFrame, CV_BGR2HSV);
		cv::cvtColor(currentFrame, grayFrame, CV_BGR2GRAY);

		//Detect skin colored pixels in image
		cv::inRange(hsvFrame, skin_hsv_min, skin_hsv_max, foreground);


		//Noise Removal
		cv::dilate(foreground, foreground, cv::Mat());
		cv::erode(foreground, foreground, cv::Mat());

		foreground.copyTo(tempFrame);

		cvFindContours(&(foreground.operator IplImage()), storage, &conts, sizeof(CvContour), CV_RETR_EXTERNAL, CV_CHAIN_APPROX_NONE, cvPoint(0,0));

		currentFrame.copyTo(foreground);
	}

	cv::Mat read()
	{
		return foreground;
	}

	int collide(int x, int y)
	{
		return pointIsInsideContour((CvContour*)&Hand, x, y);;
	}

	void findHand()
	{
		CvSeq *cont = conts;
		double area, tmp;
		area = 0;

		while(cont!=NULL)			//Find contour with largest area
		{
			tmp = cvContourArea(cont);
			if(tmp > area)
			{
				area = tmp;
				Hand = *cont;
				currentFrame.copyTo(foreground);
			}

			cont = cont->h_next;
		}
		cvDrawContours(&(foreground.operator IplImage()), &Hand, CV_RGB(255,0,0), CV_RGB(0,255,0), 0, 10, CV_AA, cvPoint(0,0));
		return;
	}

	~tracker()
	{
		foreground.release();
	}

protected:
	char pointIsInsideContour(CvContour *contour, int x, int y)
	{
		char found_left=0, found_top=0, found_right=0, found_bottom=0;
		int count, i;
		CvPoint *contourPoint;

		if(!contour)
			return 0;

		count = contour->total;

		for(i=0;i<count;i++)
		{
			contourPoint = (CvPoint *)CV_GET_SEQ_ELEM(CvPoint,contour,i);	//Get i'th point in the contour

			if(contourPoint->x == x)
			{
				if(contourPoint->y < y)
					found_top = 1;
				else
					found_bottom = 1;
			}
			if(contourPoint->y == y)
			{
				if(contourPoint->x < x)
					found_left = 1;
				else
					found_right = 1;
			}
		}

		return found_left && found_top && found_right && found_bottom;	//Returns true if four points around (x,y) are in the contour;
	}
};
