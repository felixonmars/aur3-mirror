# Contributor: Claudio Riva <firetux83@gmail.com>
# Contributor: helios91

# http://svn.sourceforge.net/viewcvs.cgi/emesene/trunk/

pkgname=emesene-svn
_realname=emesene
pkgver=2467
pkgrel=1
pkgdesc="An OS independent MSN Messenger client writed in python and GTK"
url="http://www.emesene.org/"
arch=('i686' 'x86_64')
license=('PSF' 'GPL' 'LGPL2')
makedepends=('subversion')
depends=('python2' 'pygtk')
optdepends=('gnome-python-extras: for spell-check plugin' \
	'gtkspell: for spell-check plugin' \
	'cabextract: for Wink preview plugin' \
	'gnash-common: for Wink preview plugin' \
	'gstreamer0.10-python: for webcam support')
provides=('emesene')
conflicts=('emesene')
source=('emesene.run' 'setup.patch')
md5sums=('6c9460b8f0add1316ae14c16e5e81dd8'
         '8d532a00e4e39532896d9d28869a2469')

_svnmod="emesene"
_svntrunk="https://emesene.svn.sourceforge.net/svnroot/emesene/trunk/emesene"

build() {
  cd $startdir/src

  msg "Getting sources..."
  svn co $_svntrunk $_svnmod -r $pkgver
  cd $_svnmod
  
  # python2 fix
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' Controller.py
  
  # enable installing in setup.py
  patch -Np0 -i ${srcdir}/setup.patch
  
  python2 setup.py install --prefix=${pkgdir}/usr
  
  #Support for webcam (libmimic)
  #python2 setup.py build_ext -i

  # Copying files
  mkdir -p $startdir/pkg/usr/{bin,share/${_realname}}
  cp -r * $startdir/pkg/usr/share/${_realname}
  rm -rf $startdir/pkg/usr/share/${_realname}/{docs,COPYING,emesene,emesene.bat,PSF,LGPL,GPL,libmimic}
  
  #Fix that enable about window to show license
  ln -s /usr/share/licenses/${_realname}/COPYING $pkgdir/usr/share/emesene/
  
  # install startup file
  install -Dm755 $startdir/src/emesene.run $startdir/pkg/usr/bin/${_realname}
  
  # install pixmap
  install -Dm644 misc/${_realname}.png $startdir/pkg/usr/share/pixmaps/${_realname}.png
  
  # install desktop file
  install -Dm644 misc/${_realname}.desktop $startdir/pkg/usr/share/applications/${_realname}.desktop
  
  # Removing .svn files
  rm -rf `find $startdir/pkg/ -type d -name .svn`
}
