#!/usr/bin/env python2

import wx
import argparse

class DarkscreenFrame(wx.Frame)  :

    def __init__(self)  :

        wx.Frame.__init__(self, None,
                           style=wx.STAY_ON_TOP | wx.NO_BORDER | wx.FRAME_NO_TASKBAR)
               
        self.SetBackgroundStyle(wx.BG_STYLE_COLOUR)
        self.SetBackgroundColour('black')
        self.SetTransparent(0)
        

        self.SetCursor(wx.StockCursor(wx.CURSOR_BLANK))

        self.Bind(wx.EVT_PAINT, self.onPaint)
        self.Bind(wx.EVT_CLOSE, self.OnClose)
        self.Bind(wx.EVT_LEFT_UP, self.__onClick)

        self.fade_value = 0
        
        
    
    def __onClick(self, event):
        if hasattr(self, "onClick"):
            self.onClick()
        pass
    
    
    def setMonitor(self, monitor):
        monitor_count = wx.Display_GetCount()
        if monitor >= 0 and monitor < monitor_count:
            
            display = wx.Display(monitor)
            x, y, width, height = display.GetGeometry()
            self.SetDimensions(x, y, width, height)
            
        else:
            raise RuntimeError("Monitor %u does not exist" % monitor)


        
    def onPaint(self, event):
        self.SetTransparent(self.fade_value)

        
    def fadeTo(self, target, stepsize = 2):
        self.fadeInit()
        self.fade_step_size = stepsize
        self.fade_target = target
        self.Bind(wx.EVT_TIMER, self.fadeStep)
    
    
    def fadeFinish(self):
        self.fade_timer.Stop()
        del self.fade_timer
        
        if hasattr(self, "onFadeFinish"):
            self.onFadeFinish(self.fade_value)
    
    def fadeInit(self):
        self.fade_timer = wx.Timer(self)
        self.fade_timer.Start(10)
        
        
    def fadeStep(self, evt):
        if self.fade_target > self.fade_value:
            
            if self.fade_value + self.fade_step_size < self.fade_target:
                self.fade_value += self.fade_step_size
            else:
                self.fade_value = self.fade_target
                self.fadeFinish()
                
        elif self.fade_target < self.fade_value:
            
            if self.fade_value - self.fade_step_size > self.fade_target:
                self.fade_value -= self.fade_step_size
            else:
                self.fade_value = self.fade_target
                self.fadeFinish()

        
        self.Refresh()
        self.Update()
        
        if self.fade_value == 0 and self.IsShown():
            self.Hide()
        elif self.fade_value > 0 and not self.IsShown():
            self.Show()
            self.ShowFullScreen(True)
        


    def OnClose(self, evt) :
        self.Destroy()


class Darkscreen:
    
    def __init__(self):
        
        self.wx_app = wx.App(False)
        self.frame = DarkscreenFrame()
        self.setMonitor(0)
        
        
        self.frame.onClick = self.onClick
        self.frame.onFadeFinish = self.onFadeFinish
        
    
    def setMonitor(self, monitor):
        self.frame.setMonitor(monitor)
        
        
    def fadeIn(self, target = 220):
        self.frame.fadeTo(target)
        
    def fadeOut(self):
        self.frame.fadeTo(0)
    
    def onClick(self):
        self.fadeOut()
        
    def shutdown(self):
        self.frame.Close()
        
    def onFadeFinish(self, value):
        if value == 0:
            self.shutdown()
        
    def mainloop(self):

        self.wx_app.MainLoop()


if __name__ == '__main__' :
    
    
    parser = argparse.ArgumentParser()
    parser.description = "A simple utility to darken one of your monitors."
    
    parser.add_argument("-m", "--monitor", type=int, default=0, help = "The monitor that should be darkened, 0 for first, 1 for second, etc.")
    parser.add_argument("-t", "--transparency", type=int, default = 220, help="The final transparency to which it will fade, range from 0 to 255")
    
    args = parser.parse_args()
    
    if args.transparency > 255:
        args.transparency = 255
    elif args.transparency < 0:
        args.transparency = 0
        
    
    dk = Darkscreen()
    
    dk.fadeIn(args.transparency)
    
    try:
        dk.setMonitor(args.monitor)
        
        dk.mainloop()
    except RuntimeError as e:
        print (e.message)
        
