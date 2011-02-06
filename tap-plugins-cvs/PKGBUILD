
# Based in tap-plugins by Sergej Pupykin <ps@lx-ltd.ru>
pkgname=tap-plugins-cvs
pkgver=20080921
pkgrel=1
pkgdesc="Tom's LADSPA Plugins (including bs2b)"
url="http://tap-plugins.sourceforge.net/"
license="GPL"
depends=()
arch=('x86' 'x86_64')
makedepends=('cvs')
conflicts=('tap-plugins')
provides=('tap-plugins')
replaces=()
install=
source=()
md5sums=()

_cvsroot=":pserver:anonymous@tap-plugins.cvs.sourceforge.net:/cvsroot/tap-plugins"
_cvsmod="tap-plugins"


build() {
  cd ${srcdir}

  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."

  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  sed 's|/usr/local/|$(DESTDIR)/usr/|' -i Makefile

  msg "Starting make..."

  make || return 1
  make DESTDIR=$startdir/pkg install
}
