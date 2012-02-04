# Contributor: Corali Signs Co. <coralisigns[at]gmail(dot)com>
pkgname=python-whiteboard
pkgver=20100605
pkgrel=1
pkgdesc="This program allows you to build and operate an electronic whiteboard using gnu/linux, a wiimote and an IR pen.."
arch=(i686 x86_64)
license=('LGPL')
depends=('python' 'python-xlib' 'python-numpy' 'pygtk')
url="http://github.com/pnegre/python-whiteboard"
source=()
conflicts=()
provides=('python-whiteboard')
md5sums=()

_gitroot=git://github.com/pnegre/python-whiteboard.git
_gitname=python-whiteboard

build() {
    cd $startdir/src
  
    msg "Connecting to pnegre GIT server...."
    
    if [ -d $startdir/src/$_gitname ] ; then
        cd $_gitname && git pull
        msg "The local files are updated."
    else
        git clone -b whiteboard $_gitroot
        cd $_gitname
    fi
    
    install -D -m755 python-whiteboard $startdir/pkg/usr/bin/python-whiteboard
    install -D -m644 dist/pywb_pixmap.xpm $startdir/pkg/usr/share/pixmaps/pywb_pixmap.xpm
    install -D -m644 dist/python-whiteboard.desktop $startdir/pkg/usr/share/applications/python-whiteboard.desktop
    install -D -m644 stuff/calibration2.ui $startdir/pkg/usr/lib/python-whiteboard/calibration2.ui
    install -D -m644 stuff/calibration.py $startdir/pkg/usr/lib/python-whiteboard/calibration.py
    install -D -m644 stuff/cursor.py $startdir/pkg/usr/lib/python-whiteboard/cursor.py
    install -D -m644 stuff/Globals.py $startdir/pkg/usr/lib/python-whiteboard/Globals.py
    install -D -m644 stuff/icon.xpm $startdir/pkg/usr/lib/python-whiteboard/icon.xpm
    install -D -m644 stuff/mainwindow.ui $startdir/pkg/usr/lib/python-whiteboard/mainwindow.ui
    install -D -m644 stuff/pbar.ui $startdir/pkg/usr/lib/python-whiteboard/pbar.ui
    install -D -m644 stuff/pywhiteboard.py $startdir/pkg/usr/lib/python-whiteboard/pywhiteboard.py
    install -D -m644 stuff/screen.png $startdir/pkg/usr/lib/python-whiteboard/screen.png
    install -D -m644 stuff/threads.py $startdir/pkg/usr/lib/python-whiteboard/threads.py
    install -D -m644 stuff/wiimote.py $startdir/pkg/usr/lib/python-whiteboard/wiimote.py
}
