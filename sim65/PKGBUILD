# Maintainer: Marq Schneider <queueRAM@gmail.com>

pkgname=sim65
pkgver=1
pkgrel=1
pkgdesc="65c02 simulation system"
arch=('i686' 'x86_64')
url="http://www.wsxyz.net/sim65/"
license=('custom')
depends=('wxgtk')
source=(http://www.wsxyz.net/${pkgname}/${pkgname}.tar.gz
        http://www.wxwidgets.org/about/licence3.txt)
md5sums=('b83a86302e55763e280638676715c391'
         '8b3f4d426b97ea335b053353f9f220b2')

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  install -D -m644 ${srcdir}/licence3.txt ${pkgdir}/usr/share/licenses/sim65/LICENSE
  install -D -m755 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 et:
