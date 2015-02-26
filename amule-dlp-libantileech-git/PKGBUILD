# Maintainer: Fuhd
pkgname=amule-dlp-libantileech-git
pkgver=r8.3e8cbf8
pkgrel=1
pkgdesc="A library for amule-dlp-git, with Strict DLP Chinese"
arch=('i686' 'x86_64')
url="https://github.com/persmule/amule-dlp.antiLeech"
license=('gpl')
depends=('amule-dlp-git')
makedepends=(git)
source=("$pkgname::git://github.com/persmule/amule-dlp.antiLeech.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"

  ./autogen.sh
  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make DESTDIR=${pkgdir} install
}
