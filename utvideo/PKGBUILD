# Maintainer: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=utvideo
pkgver=12.2.0
pkgrel=1
pkgdesc="Lossless video codec"
arch=('i686' 'x86_64')
url="http://umezawa.dyndns.info/wordpress/"
license=('GPL')
conflicts=('utvideo-git')
source=("http://umezawa.dyndns.info/archive/${pkgname}/${pkgname}-${pkgver}-src.zip"
	'remove-missing-format.patch'
)
sha1sums=('5f4afddfffdf35642ab4797accb5477b4cfaf508'
	  '095624dfb5b8bff358f072cfca85d4aa44870b2e'
)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  # Patches same issue as in fork: https://github.com/qyot27/libutvideo/issues/1
  patch -Np0 -i ${srcdir}/remove-missing-format.patch
  make prefix=/usr
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make prefix=/usr DESTDIR=${pkgdir} install
}
