# Maintainer: Joni Lapilainen <joni.lapilainen@gmail.com>
pkgname=tidsp-binaries
pkgver=23.i3.8
pkgrel=2
pkgdesc="TI DSP Binaries"
arch=('any')
url="http://code.google.com/p/gst-dsp/"
license=('Custom')
options=('!strip')
source=(http://gst-dsp.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('0c4eaaec54ffd33a0489fa65c3d0c58a')
_dspdir="usr/lib/dsp"
package() {

	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/${_dspdir}
	install -m 644 baseimage.dof *.dll64P ${pkgdir}/${_dspdir}
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
        install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
	rm -rf ${srcdir}
}
