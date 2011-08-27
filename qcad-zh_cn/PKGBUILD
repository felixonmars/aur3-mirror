# Maintainer: xifs <imxifs@gmail.com>

pkgname=qcad-zh_cn
pkgver=2.0.5.0
pkgrel=5
pkgdesc="zh_CN Locale of QCAD"
license=('GPL2')
depends=('qcad')
url="http://www.ribbonsoft.com/qcad.html"
md5sums=('f83e1b2fe9740667224f6e3265a922ac')
source=(http://code.google.com/p/axr/qcad2_zh.tar.gz)
arch=('any')

build() {
	cd $startdir/src/qcad2_zh
	mkdir -p $startdir/pkg/usr/share/qcad/qm/
	install -m 644 qcad_zh.qm   $startdir/pkg/usr/share/qcad/qm/
	install -m 644 qcadactions_zh.qm       $startdir/pkg/usr/share/qcad/qm/
	install -m 644 qcadguiqt_zh.qm       $startdir/pkg/usr/share/qcad/qm/
	install -m 644 qcadlib_zh.qm       $startdir/pkg/usr/share/qcad/qm/
	install -m 644 qcadprof_zh.qm       $startdir/pkg/usr/share/qcad/qm/
}
