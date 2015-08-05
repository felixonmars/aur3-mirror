# Maintainer: Heiher <r@hev.cc>

pkgname=ibus-table-zhengma
pkgver=1.4.2
pkgrel=1
pkgdesc="This is a ZhengMa table engine for IBus Table."
arch=("any")
url="http://code.google.com/p/ibus/"
license=('LGPL')
depends=('ibus-table')
source=($pkgname-$pkgver.tar.gz)
md5sums=('929f368cef2f4b010e2ec2bacebc6776')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}

	/usr/bin/ibus-table-createdb -n zhengma.db -s zhengma.txt
}

package()
{
	cd ${srcdir}/${pkgname}-${pkgver}

	install -d ${pkgdir}/usr/share/ibus-table/icons/
	install -d ${pkgdir}/usr/share/ibus-table/tables/
	install -m0644 zhengma.svg ${pkgdir}/usr/share/ibus-table/icons/
	install -m0644 zhengma.db ${pkgdir}/usr/share/ibus-table/tables/
}
