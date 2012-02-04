# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: axlrose <3444542@163.com>
# Maintainer: Yang Hamo Bai <hamo.by@gmail.com>

pkgname=west-chamber
pkgver=0.0.1
pkgrel=5
pkgdesc="a project whose name came from the Romance_of_the_West_Chamber"
arch=(i686 x86_64)
url="http://code.google.com/p/scholarzhang"
license=('GPL')
backup=(etc/conf.d/west-chamber)
groups=()
depends=(iptables kernel26-headers)
options=(!libtool)
install=west-chamber.install
source=("http://scholarzhang.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        "west-chamber"
        "west-chamber.confd"
        )
md5sums=('5b848136eed38cee23761571deff53aa'
         '09efc65c7fe03b564a9ec6c6461a4d0f'
         'e0d8b861db793e939f5864d8093983cb')
build() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg "start autogen.sh"
  ./autogen.sh

  msg "start configure"
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib/iptables \
              --sysconfdir=/etc \
              --with-xtlibdir=/usr/lib/iptables

  msg "start make"
  make || return 1
}

package()
{
  cd "$srcdir/${pkgname}-$pkgver"
  msg "start make install"
  make DESTDIR="$pkgdir" install || return 1

  mkdir -p ${pkgdir}/etc/west-chamber || return 1
  cp -f examples/* ${pkgdir}/etc/west-chamber || return 1
  install -Dm755 ${startdir}/${pkgname} ${pkgdir}/etc/rc.d/${pkgname} || return 1
  install -Dm755 ${startdir}/${pkgname}.confd ${pkgdir}/etc/conf.d/${pkgname} || return 1
}
# vim:set ts=2 sw=2 et:
