# Contributor: Pablo Lezaeta <prflr88 @ gmail.com>

pkgname=rox-clib
pkgver=2.1.10
pkgrel=2
pkgdesc="Shared code which can be used by other ROX applications. This is rox Clib"
group=('rox-desktop')
arch=('i686' 'x86_64')
url="http://roscidus.com/desktop/ROX-Clib"
license=('LGPL')
depends=(gtk2 libxml2)
source=(http://downloads.sourceforge.net/project/rox/ROX-CLib/$pkgver/ROX-CLib-$pkgver.tar.gz
	ROX-CLib_es.diff)

build() {
	cd "$srcdir/ROX-CLib"
	patch -Np1 -i ../ROX-CLib_es.diff
	cd "$srcdir/ROX-CLib"
	$srcdir/ROX-CLib/AppRun --compile
}

package () {
	cd "${srcdir}/ROX-CLib"
	install -d "${pkgdir}/usr/lib"
	cp -a ${srcdir}/ROX-CLib ${pkgdir}/usr/lib
}
md5sums=('07e65446827e1b11127b506f0743d12e'
	'ce28b8600853ab9916e09eb287dc8f1f')

