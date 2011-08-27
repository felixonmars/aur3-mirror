# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Loya Liu <loya.liu@gmail.com>

pkgname=gpick-svn
pkgver=140
pkgrel=1
pkgdesc="An advanced color picker"
arch=(i686 x86_64)
url="http://gpick.googlecode.com/"
license=('BSD')
depends=('dbus-glib>=0.76' 'gtk2>=2.12.0' 'hicolor-icon-theme' 'lua>=5.1')
makedepends=('boost' 'scons' 'subversion')
provides=('gpick')
conflicts=('gpick')
install=gpick.install
source=(gpick.desktop LICENSE)
md5sums=('9bcf9591e2ff77dc34db093410aadb00'
         '8d148bfa61e38ba91b3a832dbb378320')

_svntrunk=http://gpick.googlecode.com/svn/trunk/
_svnmod=gpick

build() {
  cd "$srcdir"

  if [[ -d $_svnmod/.svn ]]; then
    cd $_svnmod && svn up -r $pkgver && cd ..
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  # quick patch for r140
  sed -i '19a\#include <cstddef>' source/Color{Action,List,Object}.cpp

  scons
}

package() {
  cd "$srcdir/$_svnmod-build"
  scons DESTDIR="$pkgdir/usr" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ../$_svnmod.desktop \
    "$pkgdir/usr/share/applications/$_svnmod.desktop"
}
