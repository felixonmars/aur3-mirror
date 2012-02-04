pkgname=beholder
pkgver=0.8.9
pkgrel=1
pkgdesc="Wireless Tools"
arch=('i686' 'x86_64')
url="http://www.beholderwireless.org/"
license=('GPL')
depends=('wireless_tools')
source=("ftp://ftp.pangeia.com.br/pub/seg/pac/bh-${pkgver}.tgz")
md5sums=('5539132620e450a30493daf411b0d98f')

build() {
	make
	install -m655 -D ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname} || return 1


}
