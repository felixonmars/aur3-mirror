# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=scrotwm-cvs
pkgver=20101022
pkgrel=2
pkgdesc="A minimalistic dynamic tiling window manager that tries to stay out of the way."
arch=('i686' 'x86_64')
url="http://www.scrotwm.org"
license=('custom:ISC')
depends=('dmenu' 'libxrandr' 'profont')
backup=(etc/scrotwm.conf)
conflicts=('scrotwm')
provides=('scrotwm')
makedepends=('cvs' 'openssh')
optdepends=('scrot: screenshots' 'xlockmore: screenlocking' 'terminus-font: great font')
source=()
md5sums=()

#options=('makeflags')
#MAKEFLAGS="-g -O3"

#_cvsroot="anoncvs@anoncvs.freedaemon.com:/scrotwm"
_cvsroot="anoncvs@opensource.conformal.com:/anoncvs/scrotwm"
_cvsmod="scrotwm"

build() {
  cd "$srcdir"
  # yeah, this is not how you're supposed to do a cvs pkgbuild
  # but the openbsd servers are VERY picky
  export CVS_RSH=ssh

  msg "Connecting to anoncvs.freedaemon.com CVS server...."
  cvs -d $_cvsroot co $_cvsmod
  cd $_cvsmod

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  #cp -f ../../Makefile .
  
  # it is like a patch, only less fragile
  #sed -i 's|setenv(\"LD_PRELOAD\", SWM_LIB, 1);|//setenv(\"LD_PRELOAD\", SWM_LIB, 1);|' "$srcdir/scrotwm/scrotwm.c"
  sed -i 's|\"/usr/local/lib/libswmhack.so\"|\"libswmhack.so\"|' "$srcdir/scrotwm/scrotwm.c"
  sed -i 's/# modkey = Mod1/modkey = Mod4/' "$srcdir/scrotwm/scrotwm.conf"
  sed -i 's/-\*-terminus-medium-\*-\*-\*-\*-\*-\*-\*-\*-\*-\*-\*/-*-profont-*-*-*-*-12-*-*-*-*-*-*-*/' "$srcdir/scrotwm/scrotwm.conf"

  cd linux
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_cvsmod/linux"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  cd ..
  install -Dm644 scrotwm.conf "$pkgdir"/etc/scrotwm.conf
  install -Dm755 screenshot.sh "$pkgdir"/usr/share/scrotwm/screenshot.sh
  cd ../..
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 scrotwm.desktop "$pkgdir"/usr/share/xsessions/scrotwm.desktop
  install -Dm755 baraction.sh "$pkgdir"/usr/share/scrotwm/baraction.sh

  ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir"/usr/lib/libswmhack.so.0
  ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir"/usr/lib/libswmhack.so
}
