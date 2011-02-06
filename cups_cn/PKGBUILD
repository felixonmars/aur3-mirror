pkgname=cups_cn
pkgver=1.4.2
pkgrel=1
pkgdesc="CUPS zh_CN UI"
arch=(any)
depends=('cups')
url="http://archlive-pkg.googlecode.com"
license=("GPL")
source=(http://archlive-pkg.googlecode.com/files/cups-cn-$pkgver.tar.bz2)
backup=(etc/rc.d/cups)

build()
{
	cd $srcdir/cups-cn-$pkgver
	mkdir -p $pkgdir/usr/share/{cups/templates/zh_CN,cups/doc/zh_CN,locale/zh_CN}
	mkdir -p $pkgdir/etc/rc.d
	install -m 0444 files/doc/index.html $pkgdir/usr/share/cups/doc/zh_CN
	install -m 0444 files/templates/* $pkgdir/usr/share/cups/templates/zh_CN
	install -m 0444 files/cups_zh_CN.po $pkgdir/usr/share/locale/zh_CN
	install -m 0755 files/cups $pkgdir/etc/rc.d
	cd $pkgdir/usr/share/cups/templates
	ln -sf zh_CN zh
	cd $pkgdir/usr/share/cups/doc/
	ln -sf zh_CN zh
}
md5sums=('93407ef4ffe2f306b773a216c606068a')
