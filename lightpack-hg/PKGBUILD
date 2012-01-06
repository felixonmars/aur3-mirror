# Maintainer: Arseniy Krasnov arseniy@krasnoff.org
pkgname=lightpack-hg
pkgver=789
pkgrel=1
pkgdesc="Lightpack is a monitor light device used for presence effect strengthening. "
arch=('i686' 'x86_64')
url="http://code.google.com/p/lightpack/"
license=('GPLv3')
depends=('qt')
makedepends=('mercurial')
source=()
md5sums=()
 
_hgroot='https://lightpack.googlecode.com/hg/'
_hgrepo='lightpack'

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."
  
  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    msg "123"
    hg clone "$_hgroot"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  cd "$srcdir/$_hgrepo/Software"
  sed -i 's/LIBS += -ludev/& -lX11 -lXext -lrt/' src/src.pro
  qmake Lightpack.pro 
  make
}

package() {
  mkdir -p $pkgdir/etc/udev/rules.d
  cp $srcdir/$_hgrepo/93-lightpack.rules $pkgdir/etc/udev/rules.d
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/$_hgrepo/Software/src/bin/Lightpack $pkgdir/usr/bin
}
post_install(){
  udevadm control --reload-rules
}
# vim:set ts=2 sw=2 et:
