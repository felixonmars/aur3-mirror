pkgname=gmbox-svn
pkgver=235
pkgrel=1
url="http://gmbox.googlecode.com"
pkgdesc="Google Music Downloader. "
arch=('i686' 'x86_64')
license=('GPL')
makedepends=()
depends=('pygtk')
provides=('gmbox')
conflicts=('gmbox')
optdepends=("python-pymedia: A Python library for accessing and manipulating multimedia files"
            "python-notify: Notify")
install=gmbox.install

_svntrunk=http://gmbox.googlecode.com/svn/trunk/gmbox-gtk
_svnmod=gmbox

build() { 
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn --config-dir ../ up -r $pkgver)
  else
    svn --config-dir ./ co $_svntrunk  -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Preparing..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  

  rm -r `find . -name ".svn"`
  
  #python 2 fix
  sed 's@#!/usr/bin/env python@#!/usr/bin/python2@g' -i *.py
  python2 -m compileall .
  
  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/gmbox/

  install -m 0755 gmbox-gtk.py $pkgdir/usr/share/gmbox/
  mv data gmbox googlemusic $pkgdir/usr/share/gmbox/
  install -Dm 0644 $srcdir/gmbox-build/debian/gmbox.desktop $pkgdir/usr/share/applications/gmbox.desktop	
  cd $pkgdir/usr/bin

  ln -sf ../share/gmbox/gmbox-gtk.py ./gmbox
}
