# Contributor: Christian Holme <cholme at gmx dot com>

pkgname=feff
pkgver=1.9.2
pkgrel=1
pkgdesc="Qt frontend for FFmpeg"
arch=('i686' 'x86_64')
url=("http://qt-apps.org/content/show.php/Feff?content=140298")
license=('GPL3')
depends=('qt4' 'ffmpeg')
source=('http://qt-apps.org/CONTENT/content-files/140298-feff_source.tar.gz')

build() {
  	cd "$srcdir"
    [[ -e "$pkgname_$pkgver" ]] && rm -rf "$pkgname_$pkgver"
    mv feff_source "$pkgname-$pkgver"
  	cd "$srcdir/$pkgname-$pkgver"
   	qmake-qt4
   	make
}

package() {
	install -Dm 755 $srcdir/$pkgname-$pkgver/Bin/feff $pkgdir/usr/bin/feff
}

md5sums=('d0e3b1d0f49417416ff3e1dfcc982b3e')
