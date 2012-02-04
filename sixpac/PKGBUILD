# Contributor: Hayes Williams <hwpi31@gmail.com>

pkgname=sixpac
pkgver=1.1
pkgrel=0
pkgdesc="GTK package manager for archlinux based on gtkPacman"
license=("GPL")
arch=("i686" "x86_64")
depends=('pygtk' 'vte' 'bzip2')
source=("http://github.com/downloads/Nonpython/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('903c21533dd754b3a4fd29f7021ab67a')
url="http://github.com/Nonpython/SixPac"

build () {
	cd $startdir/src/SixPac-$pkgver
	python setup.py install --root=$startdir/pkg
}
