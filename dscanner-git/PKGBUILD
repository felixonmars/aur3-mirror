# Maintainer: Robert Welin
pkgname=dscanner-git
pkgver=r690.3a12f85
pkgrel=1
pkgdesc="Swiss-army knife for D source code"
arch=('i686' 'x86_64')
url="https://github.com/Hackerpilot/Dscanner"
license=('BSL-1.0')
depends=('glibc')
makedepends=('dmd' 'git' 'libphobos-devel')
provides=('dscanner')
source=("$pkgname"::"git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  git submodule update --init --recursive
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 "bin/dscanner" "$pkgdir/usr/bin/dscanner"
  install -D -m644 LICENSE_1_0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

