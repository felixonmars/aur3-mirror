# Maintainer: Hubert Grzeskowiak <arch at nemesis13 dot de>

pkgname=panda3d-runtime-cvs
pkgver=20120320
pkgrel=1
pkgdesc='3D engine with Python bindings. Runtime and web plugin. CVS version'
url="http://www.panda3d.org"
depends=('openssl' 'shared-mime-info' 'desktop-file-utils')
makedepends=('python2' 'libpng' 'libjpeg' 'xulrunner' 'cvs' 'panda3d')
#makedepends=('python2' 'openssl' 'libpng' 'libjpeg')
arch=('i686' 'x86_64')
license=('BSD')
provides=('panda3d-runtime')
conflicts=('panda3d-runtime')
source=('panda3d-runtime.install')
install='panda3d-runtime.install'
md5sums=('781da785acb14d547624b505ef01e064')
_cvsroot=":pserver:anonymous@panda3d.cvs.sourceforge.net:/cvsroot/panda3d"
_cvsmod="panda3d"


build() {
  cd "$srcdir"
  if [ -d $_cvsmod/CVS ]; then
    msg "Found a dir, updating"
    (cd $_cvsmod && cvs -q up -AdP)
  else
    msg "Checking out."
    cvs -z3 -d $_cvsroot co -f $_cvsmod
  fi
  msg "CVS checkout done (or server timeout), copying for build"
  cd "${_cvsmod}"
  python2 makepanda/makepanda.py --everything --runtime --distributor cmu
}

package() {
  cd "$srcdir/${_cvsmod}"
  python2 makepanda/installpanda.py --destdir=$pkgdir --runtime --outputdir=built_cmu_rt --prefix=/usr
  #install -D -m755 $srcdir/$pkgname-$pkgver/doc/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  if [ "$CARCH" == "x86_64" ]; then
    mv $pkgdir/usr/lib{64,}
    rm $pkgdir/usr/lib/mozilla-firefox/plugins/nppanda3d.so $pkgdir/usr/lib/mozilla/plugins/nppanda3d.so $pkgdir/usr/lib/xulrunner-addons/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/mozilla-firefox/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/mozilla/plugins/nppanda3d.so
    ln -s /usr/lib/nppanda3d.so $pkgdir/usr/lib/xulrunner-addons/plugins/nppanda3d.so
  fi
}
