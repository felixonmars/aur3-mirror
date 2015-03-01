# Maintainer: Gadget3000 <gadget3000@msn.com>
pkgname=pspvc
pkgver=0.3
pkgrel=4
pkgdesc="Playstation Portable Video Converter"
arch=('x86_64' 'i686')
url="http://pspvc.sourceforge.net"
license=('GPL2')
depends=('faac' 'xvidcore' 'a52dec' 'gtk2' 'sdl' 'imlib2' 'v4l-utils')
makedepends=('yasm' 'nasm')
source=('http://prdownloads.sourceforge.net/pspvc/pspvc-install-0.3.tar.gz'
	'install.patch'
	'grab.patch')
md5sums=('7a5c7960c30da92c15426b14102cc3fb'
	 '9da854c157b3f659104ccb174e7e5542'
	 '707f5211482ca775ae071642243d8912')
options=(!makeflags)

build() {
cd $srcdir/${pkgname}-install-${pkgver}
patch install.sh ${srcdir}/install.patch
}

package() {
cd $srcdir/${pkgname}-install-${pkgver}
install -d ${pkgdir}/usr/
install -d ${pkgdir}/usr/share/applications/
echo "Compiling into package"
./install.sh ${pkgdir}/usr/ ${pkgdir}/usr/share/applications/
mv ${pkgdir}/usr/doc ${pkgdir}/usr/share/
}
