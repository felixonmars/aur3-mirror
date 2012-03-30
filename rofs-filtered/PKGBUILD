# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=rofs-filtered
pkgver=1.3
pkgrel=1
pkgdesc="Allows the user to mount a directory tree as read-only and filter the files shown in the read-only directory"
arch=("i686" "x86_64")
url="http://ebixio.com/rofs-filtered/"
license=("unknown")
depends=("fuse")
source=("http://ebixio.com/rofs-filtered/${pkgname}-${pkgver}.tar.bz2")
md5sums=('82f77731d162c941485e2dd0c9733c80')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d ${pkgdir}/usr/{bin,share/doc/${pkgname}}
  install -m755 rofs-filtered ${pkgdir}/usr/bin
  install -m644 README rofs-filtered.rc ${pkgdir}/usr/share/doc/${pkgname}
}
