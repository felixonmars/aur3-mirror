# Maintainer: ganymede
# Contributor: Nicolas Paris <nicolas.caen (AT) gmail.com>

pkgname=ekd-svn
pkgver=424
pkgrel=1
pkgdesc="Pictures and video post-production software, development version. Can be installed alongside ekd."
arch=('i686' 'x86_64')
url="http://ekd.tuxfamily.org/"
license=('GPL')
depends=('mplayer' 'ffmpeg2theora' 'imagemagick' 'python2-qt' 'pil' 'python-numpy' 'mjpegtools' 'sox' 'gmic' 'mencoder' 'patch')
makedepends=('make')
source=('Makefile.patch')
md5sums=('8174fffd255a566d2b0abdde346b4d84')

_svntrunk=http://svn.codingteam.net/ekd/trunk
_svnmod=ekd

build() {
  # Checkout Code
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_svnmod"

  cp $srcdir/Makefile.patch .
  patch -p0 < Makefile.patch

  make -f Makefile.in

  install -d $pkgdir/usr/bin/ $pkgdir/usr/share/$pkgname
  echo '#!/bin/sh'$'\n''cd /usr/share/ekd-svn && python2 ekd_gui.py' \
    > $pkgdir/usr/bin/$pkgname
  chmod 755 $pkgdir/usr/bin/$pkgname
  cp -r * $pkgdir/usr/share/$pkgname
  rm -rf $(find $pkgdir/usr/share/$pkgname/ -type d -name .svn -print)
}

