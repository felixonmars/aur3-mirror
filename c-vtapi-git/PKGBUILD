#Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=c-vtapi-git
pkgdesc="The official VirusTotal-API written in C"
pkgver=101.d42f95d
pkgrel=1
arch=('i686' 'x86_64')
url=('https://github.com/VirusTotal/c-vtapi')
license=('Apache')
makedepends=('git' 'automake' 'autoconf' 'libtool' 'gcc')
depends=('jansson' 'curl')
source=("git+http://github.com/VirusTotal/c-vtapi")
md5sums=('SKIP')

pkgver() {
  cd c-vtapi
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/c-vtapi
  autoreconf -fi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/c-vtapi"
  make DESTDIR=$pkgdir install
}
