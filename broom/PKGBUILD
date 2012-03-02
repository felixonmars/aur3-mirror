# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=broom
pkgver=1.5.0
pkgrel=1
pkgdesc="A disk cleaning utility for developers."
arch=(any)
url="https://github.com/nicoulaj/broom"
license=(MIT)
depends=('bash>=4')
changelog=Changelog
conflicts=(${pkgname}-git)
source=("https://github.com/downloads/nicoulaj/broom/${pkgname}-${pkgver}.tar.gz")
md5sums=('5741ab26144ca9ed17ae4f34944f2846')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}" || return 1
}
