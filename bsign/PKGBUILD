# Contributor: Nathan Owe. <ndowens.aur at gmail dot com>
pkgname=bsign
pkgver=0.4.5
pkgrel=2
pkgdesc="This package embeds secure hashes (SHA1) and digital signatures (GNU Privacy Guard) into files for verification and authentication."
arch=('i686')
url="http://packages.debian.org/sid/bsign"
license=('GPL')
buildenv=('fakeroot')
depends=('sh')
source=(http://ftp.de.debian.org/debian/pool/main/b/bsign/bsign_0.4.5.tar.gz)
md5sums=('57984eb43bacd5cfd497cbf36912a14d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
  make bindir=${pkgdir}/usr/bin mandir=${pkgdir}/usr/share/man docdir=${pkgdir}/usr/share/doc install
}
