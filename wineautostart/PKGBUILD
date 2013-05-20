# Contributer: giacomogiorgianni@gmail.com

pkgname=wineautostart
pkgver=0.8.5
pkgrel=1
pkgdesc="A simple collection of scripts which will enable the autorun of windows .exe (executable) files on a disk"
arch=('any')
url="https://launchpad.net/wineautostart"
license=('GPL')
depends=('wine' 'zenity' 'grep' 'vorbis-tools' 'python' 'libnotify') 
#makedepends=('')
source=("https://launchpad.net/wineautostart/unstable/0.8.5/+download/${pkgname}_${pkgver}-ubuntu1_all.deb")

md5sums=('5684f38830c37f9865b73b053e6a2570')

build() {
	cd ${startdir}/src
	tar -zxf ${startdir}/src/data.tar.gz 
	cp -rp usr $pkgdir
	cp -rp etc $pkgdir
}
