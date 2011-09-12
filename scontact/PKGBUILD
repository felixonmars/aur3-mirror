# Program author: fantastic001 <snstefan5@gmail.com>
# AUR package maintainer: marko-v <markovojvodic84@gmail.com>
pkgname=scontact
pkgver=2.0.4
pkgrel=2
pkgdesc="SContact is person manager written in Qt"
url="http://sourceforge.net/projects/scontact/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
#install='scontact.install'
source=("http://sourceforge.net/projects/scontact/files/2.0/${pkgname}-${pkgver}.tar.xz/download")
sha1sums=('f5e3c15c8d45f4e9e262f5b7ca90f89dfd9d1042')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure
  cd src/
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 src/scontact "$pkgdir/usr/bin/scontact"
  install -Dm755 etc/qde/scontact/scontactrc "$pkgdir/etc/qde/scontact/scontactrc"
  install -Dm755 usr/share/pixmaps/scontact.png "$pkgdir/usr/share/pixmaps/scontact.png"
  install -Dm755 usr/share/scontact/pixmaps/icons/fax.png "$pkgdir/usr/share/scontact/pixmaps/icons/fax.png"
  install -Dm755 usr/share/scontact/pixmaps/icons/mobile.png "$pkgdir/usr/share/scontact/pixmaps/icons/mobile.png"
  install -Dm755 usr/share/scontact/pixmaps/icons/office.png "$pkgdir/usr/share/scontact/pixmaps/icons/office.png"
  install -Dm755 usr/share/scontact/pixmaps/icons/home.png "$pkgdir/usr/share/scontact/pixmaps/icons/home.png"
}
