# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=maxview
pkgver=0.7.1
pkgrel=1
pkgdesc="Document management program similar to PaperPort."
arch=('i686')
url="http://maxview.sourceforge.net/"
license=('GPL')
makedepends=('deb2targz')
depends=('qt' 'sane' 'libtiff4' 'poppler-qt' 'libjpeg6')
source=(http://downloads.sourceforge.net/${pkgname}/ubuntu/hardy/${pkgname}_0.7-1_i386.deb)
md5sums=('d2644e6921dca3cb2bfc2d79384f0f4f')

build() {
	cd ${srcdir}

	deb2targz ${pkgname}_0.7-1_i386.deb
	tar -xvf ${pkgname}_0.7-1_i386.tar.gz

	cp -R ${srcdir}/usr ${pkgdir}
}
