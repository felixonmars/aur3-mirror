# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=gadmin-sshd
pkgver=0.0.1
pkgrel=1
pkgdesc="A GTK+ gui to administer SSHD"
arch=('i686' 'x86_64')
url="http://mange.dynalias.org/linux/gadmintools-webpage/app_pages/gadmin-sshd.html"
license=('GPL')
depends=('gtk2')
source=("http://mange.dynalias.org/linux/${pkgname}/${pkgname}-${pkgver}.tar.gz" "${pkgname}-menu" "${pkgname}.desktop")
md5sums=('7b082cfe2855899d7e8f68e10e770bbf'
         'eaa9f8a4b671947fb0288cbb99bc6e6c'
         '82ad387fc29c7b4b811fa54107fe3e3a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  install -Dm755 ${srcdir}/${pkgname}-menu ${pkgdir}/usr/sbin/${pkgname}-menu
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
