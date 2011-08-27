# Maintainer: Jens Adam (byte/jra) <j_adam@web.de>

pkgname=efa
pkgver=1.3
pkgrel=1
pkgdesc="Unofficial efa.vrr.de command line client"
url="https://derf.homelinux.org/projects/efa/"
#url="http://freshmeat.net/projects/efa"
license=('custom:WTFPL')
arch=('any')
depends=('perl-www-mechanize' 'perl-xml-libxml')
source=("https://derf.homelinux.org/projects/efa/efa-$pkgver.tar.bz2"
        'http://sam.zoy.org/wtfpl/COPYING')
md5sums=('cf17f9b98a870df88c3be458919f7c7f'
         '389a9e29629d1f05e115f8f05c283df5')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make || return 1
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make PREFIX=${pkgdir}/usr install || return 1
  install -Dm644 ../COPYING ${pkgdir}/usr/share/licenses/efa/COPYING || return 1
}
