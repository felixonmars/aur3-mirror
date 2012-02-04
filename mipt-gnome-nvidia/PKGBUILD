pkgname=mipt-gnome-nvidia
pkgver=0
pkgrel=1.1
pkgdesc="Helper utilities for MIPT users."
url="http://mipt.ru"
license=('GPL')
arch=(any)
depends=(bash mc testdisk vim mplayer yaourt pacman js curl grep iputils python-libxml2dom python2 opencl-headers nvidia)
makedepends=(bzip2 gzip tar)
source=(http://dl.dropbox.com/u/4583032/mipt/mipt-$pkgver.$pkgrel.tgz)
md5sums=('4e4a0a57be6866df6dffc7142b2fb408')




build() {
	cd $startdir/src
	for i in *
		do
			[ -d $i ] && cp -Rp $i $startdir/pkg/
		done
}


