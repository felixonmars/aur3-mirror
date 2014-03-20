# Mantainer: dmiranda at gmail dot com

pkgname=gtk-theme-flattastic
pkgver=2014.03.19
pkgrel=1
pkgdesc="Another colorful and flat GTK 3, GTK 2, Xfwm, Metacity, Unity and Openvbox theme suite."
arch=('any')
url="http://fc04.deviantart.net/fs70/f/2014/070/6/d/flattastic_11_03_2014_by_nale12-d70zd5z.zip"
license=('GPL3')
depends=('gtk-engine-murrine')
_sourcefile=flattastic_11_03_2014_by_nale12-d70zd5z.zip
source=(http://fc04.deviantart.net/fs70/f/2014/070/6/d/flattastic_11_03_2014_by_nale12-d70zd5z.zip)
md5sums=('bd96726ed9457c6331db41e0f8d0ef13')

noextract=("${source[@]%%::*}")
_foldername=flattastic_11_03_2014_by_nale12-d70zd5z

package() {
	mkdir -p ${pkgdir}/usr/share/themes/
	mkdir "${_foldername}"
	unzip "${_sourcefile}" -d ${_foldername}
	cp -rv ${srcdir}/${_foldername}/* ${pkgdir}/usr/share/themes/
}
