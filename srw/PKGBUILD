# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: N30N <archlinux@alunamation.com>

pkgname=srw
pkgver=0.7
_revision=14f0a3c1f3bb
pkgrel=1
pkgdesc="A simple read wrapper."
url="https://bitbucket.org/emg/srw/overview"
license=("MIT")
arch=("i686" "x86_64")
depends=()
makedepends=()
source=("https://bitbucket.org/emg/srw/get/${pkgver}.tar.gz")
md5sums=('df29f2069455981adef560277f5a2d11')

build() {
  cd emg-$pkgname-$_revision
  make
}

package() {
  cd emg-$pkgname-$_revision
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}

# vim:set ts=2 sw=2 et:
