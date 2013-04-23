# Contributor: Nick Markwell <nick@duckinator.net>

_pkgname=uds
pkgname=uds-git
pkgver=0.4.d2de390
pkgrel=1
pkgdesc="Application to share files with in a peer-to-peer fashion"
arch=('i686' 'x86_64')
url="http://mayaposch.com/uds.php"
license=('BSD')
depends=('qt4' 'miniupnpc')
makedepends=('git')
provides=('uds')
conflicts=('uds')
source=('uds::git://github.com/MayaPosch/Universal_Data_Share.git')
md5sums=('SKIP')

# $_orig_executable should soon become WildFox
_orig_executable=Universal_Data_Share

pkgver() {
  cd $_pkgname
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/$_pkgname"

  qmake
  make
}

package() {
  cd $pkgdir
  mkdir -p usr/bin
  mkdir -p usr/share/$_pkgname
  
  install -m755 "$srcdir/$_pkgname/$_orig_executable" "usr/bin/$_pkgname"
  #install -m644 "$srcdir/$_gitname/LICENSE" "usr/share/$pkgname/LICENSE"
  #cd "$srcdir/$_gitname-build"
  #make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
