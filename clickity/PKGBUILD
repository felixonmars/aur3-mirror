# Maintainer: DonVla <donvla@users.sourceforge.net>

pkgname=clickity
pkgver=0.2.0
pkgrel=1
pkgdesc="Tray-icon program for simulating mouse clicks and drags."
arch=(any)
url="http://clickity.sourceforge.net"
license=('GPL')
depends=('pygtk')
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('3454a1ef651e65973ddc593d7161994e')
sha256sums=('d186b75c5d526a7b58cc2f67e6c5b3a63acad97a28232b4acc54511bbfde9f69')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root=${pkgdir} || return 1
}

# vim:set ts=2 sw=2 et:
