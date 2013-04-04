

pkgname=guibuilder-git
pkgver=20130404
pkgrel=1
pkgdesc="GUI Builder is A drag and drop interface to create WebElement User Interface (WUI) templates"
arch=('i686' 'x86_64')
url="http://opendesktop.org/content/show.php/GUI+Builder?content=157414"
license='GPL'
depends=('qt4' 'python2-pyside' 'python2' 'python-shiboken' 'webelements-git')
makedepends=('git')
conflicts=()

_gitname=GuiBuilder
_gitroot=git://github.com/timothycrosley/GuiBuilder.git

build() {
  cd $srcdir

  msg "Connecting to GIT server...."
   if [ -d ${_gitname} ] ; then
     cd ${_gitname} && git pull origin
     msg "The local files are updated."
     cd $srcdir
   else
     git clone ${_gitroot} ${_gitname}
   fi
   msg "GIT checkout done or server timeout"

  msg "Starting make..." 
   cd $srcdir  
   #rm -rf ${_gitname}-build
   #mkdir ${_gitname}-build
   #cd ${_gitname}
   #qmake-qt4 qxmpp.pro -r -config release
   #make 
}

package() {
  cd $srcdir/${_gitname}
  sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_' ./GuiBuilder/GuiBuilder.py
  sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_' ./GuiBuilder/WebElementDocs.py
  sed -i 's_#!/usr/bin/python_#!/usr/bin/env python2_' ./GuiBuilder/__init__.py
  python2 setup.py install --prefix=/usr --root="$pkgdir"/ --optimize=1
  #make INSTALL_ROOT=$pkgdir install
}
