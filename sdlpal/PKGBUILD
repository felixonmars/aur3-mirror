# Maintainer:  Shaw <puxx@mail.ustc.edu.cn>

pkgname=sdlpal
pkgver=85584
pkgrel=2
pkgdesc="A SDL-based reimplemention of the classic Chinese-language RPG 'Xian Jian Qi Xia Zhuan'"
arch=('i686' 'x86_64')
url="http://sdlpal.codeplex.com/"
license=('GPL')
depends=('sdl' 'xdg-utils')
makedepends=('imagemagick')
install="$pkgname.install"
source=("$pkgname-$pkgver.zip::http://download-codeplex.sec.s-msft.com/Download/SourceControlFileDownload.ashx?ProjectName=sdlpal&changeSetId=$pkgver"
        $pkgname.sh
        $pkgname.desktop
        $pkgname.xpm)
md5sums=('SKIP'
         '76aec422cc29142624919e82d7da00aa'
         '3d08c1d5ad6c433620b1a8b61e6b9176'
         '02f75b1da809795f0dad3c97f51eea1f')

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	mkdir -p $pkgdir/usr/share/$pkgname
	# install executable files
	install -Dm755 $srcdir/$pkgname.sh $pkgdir/usr/bin/$pkgname
	install -Dm755 $srcdir/$pkgname/$pkgname $pkgdir/usr/share/$pkgname/$pkgname
	# install desktop file
	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	# install icons
	for size in 16 22 24 32 48 64; do
		mkdir -p $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps
		convert -resize $size $pkgname.xpm $pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png
	done
	install -Dm644 $pkgname.xpm $pkgdir/usr/share/icons/scalable/apps/$pkgname.xpm
}

