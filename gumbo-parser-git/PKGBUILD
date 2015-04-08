# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

_pkgname=gumbo-parser
pkgname=gumbo-parser-git
pkgver=0.9.3.r96.g140e6cc
pkgrel=1
epoch=1
pkgdesc='A pure-C HTML5 parser'
url='https://github.com/google/gumbo-parser'
license=('Apache')
source=('git://github.com/google/gumbo-parser.git')
md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('git')
provides=('gumbo-parser')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  chmod +x autogen.sh
  ./autogen.sh
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
