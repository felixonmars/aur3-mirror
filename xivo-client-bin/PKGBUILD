# Maintainer: Pi3R1k <pierrick.brun>

pkgname=xivo-client-bin
pkgver=15.06
pkgrel=1
pkgdesc="Client for the IPBX Xivo"
arch=('i686' 'x86_64')
url="https://projects.xivo.io/projects/xivo/news"
license=('GPLv3')
#optdepends=('')
conflicts=('xivo-client-qt-git')
provides=('xivo-client')
replaces=('xivo-client-qt-git')

case $CARCH in
	'x86_64')
		_arch='amd64'
		md5sums=('92175a6ebb20d7fbc392f2ef5a0bec5c')
		;;
	'i686')
		_arch='i386'
		md5sums=('25a9b1b6f8978f1b4e69b6dfb1be6578')
		;;
esac

source=("http://mirror.xivo.fr/iso/archives/xivo-${pkgver}/xivoclient-${pkgver}.1-${_arch}.deb")

package() {
	cd "$srcdir"

	rm control.tar.gz debian-binary

	tar -zxf data.tar.gz -C "${pkgdir}"
}

 


