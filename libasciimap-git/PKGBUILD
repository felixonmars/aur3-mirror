# Maintainer: Zatherz <zatherz[at]linux[dot]com>
pkgname=libasciimap-git
pkgver=r0.gf28c8f3
pkgrel=1
pkgdesc="Silly library for displaying silly fancy ASCII art (+ ASCIIMapReader)."
url="http://github.com/Zatherz/libasciimap/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('liborbos-string')
makedepends=('git')
source=("git://github.com/Zatherz/libasciimap")
md5sums=("SKIP")

pkgver() {
  cd "libasciimap"
  git describe --long --all | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/heads\/master.//g'
}

build() {
  cd "libasciimap"
  make
}

package() {
  cd "libasciimap"
  make DESTDIR="$pkgdir" install
}
