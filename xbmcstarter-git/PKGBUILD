# Maintainer: Matthias Larisch <mail@matthias-larisch.de>
_gitname=XbmcStarter
pkgname=xbmcstarter-git
pkgver=f942aad
pkgrel=1
pkgdesc="A remote starter for XBMC using xbmc compatible json request url"
arch=('x86' 'x86_64')
license=('GPL')
depends=('libmicrohttpd' 'xbmc')
makedepends=('git' 'cmake')
provides=($_gitname)
conflicts=($_gitname)
replaces=()
backup=()
options=()
url=('http://github.com/NerdyProjects/XbmcStarter')
source=("$_gitname"::git://github.com/NerdyProjects/XbmcStarter.git)
noextract=()
md5sums=(SKIP)

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir/$_gitname
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
}

package() {
  cd $srcdir/$_gitname/build
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
