# Contributor: s1gma <s1gma@mindslicer.com>

_pkgname=metasm
pkgname=metasm-git
pkgver=2997.a94811e
pkgrel=1
pkgdesc="An assembly manipulation suite written in Ruby"
arch=('any')
url="http://metasm.cr0.org/"
license=('LGPL')
depends=('ruby')
optdepends=('ruby-gtk2: gui support')
provides=('metasm')
install=metasm.install
source=('git://github.com/jjyg/metasm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  
  msg "Starting make..."
  rm -rf "$srcdir/$_pkgname-build"
  cp -r "$srcdir/$_pkgname" "$srcdir/$_pkgname-build"
  cd "$srcdir/$_pkgname-build"
  
  # remove git files
  rm -rf .git/
}

package() {
  cd "$srcdir/$_pkgname-build"
  mkdir -p $pkgdir/opt/metasm
  cp -a * $pkgdir/opt/metasm
} 
