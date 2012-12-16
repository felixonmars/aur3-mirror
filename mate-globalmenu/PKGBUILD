# Maintainer: Philipp 'TamCore' B. <philipp@tamcore.eu>
# Contributor: Alessio Biancalana <dottorblaster@gmail.com>

pkgname=mate-globalmenu
pkgver=LATEST
pkgrel=1
pkgdesc="Global Menu Bar built for using with MATE desktop"
url="https://github.com/jasmineaura/mate-globalmenu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('mate-panel' 'libnotify')
makedepends=('intltool')
options=('!libtool')
install=${pkgname}.install
source=("https://github.com/jasmineaura/mate-globalmenu/archive/master.zip")
md5sums=('8b7c7f665810cdc81281213e573fac4d')

build() {
  cd ${srcdir}/${pkgname}-master

  autoconf
  sh ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib

  make || return 1
}

package(){
  cd ${srcdir}/${pkgname}-master
  make DESTDIR=${pkgdir} install || return 1

  install -d -m755 "${pkgdir}/usr/share/mateconf/schemas"
  mateconf-merge-schema "${pkgdir}/usr/share/mateconf/schemas/${pkgname}.schemas" ${pkgdir}/etc/mateconf/schemas/*.schemas || return 1
  rm -f ${pkgdir}/etc/mateconf/schemas/*.schemas
}
