# Maintainer: cuihao <cuihao.leo@gmail.com>
# Contributor: Figo.zhang <figo1802@gmail.com>
# Contributor: Zhang Li <msfxzi at sina.com>

pkgname=wxflashget
pkgver=1.0.3
pkgrel=4
pkgdesc="A famous file downloader in China, beta version."
arch=('i686' 'x86_64')
url="http://bbs.flashget.com/forumdisplay.php?fid=31"
license=('custom')
if [ "$CARCH" = "x86_64" ]; then
	depends=('lib32-expat' 'lib32-libpng' 'lib32-gtk2' 'lib32-libxext' 'lib32-libsm' 'lib32-libxxf86vm')
elif [ "$CARCH" = "i686" ]; then
	depends=('expat' 'libpng' 'gtk2' 'libxext' 'libsm' 'libxxf86vm')
fi
install='wxflashget.install'
source=('http://bbs.flashget.com/download/flashget-1.0.3-0_cn.tar.gz')
md5sums=('1eb848cbd8294cdeb3257550514b01b8')

build() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/flashget
	mkdir -p $pkgdir/usr/share/applications

	install -m 755 $srcdir/flashget-$pkgver/flashget $pkgdir/usr/bin/
	install -m 644 $srcdir/flashget-$pkgver/flashget.png $pkgdir/usr/share/flashget/
	install -m 644 $srcdir/flashget-$pkgver/flashget.desktop $pkgdir/usr/share/applications/

	if [ "$CARCH" = "x86_64" ]; then
		mkdir -p ${pkgdir}/usr/lib32/
		ln -s /usr/lib32/libexpat.so ${pkgdir}/usr/lib32/libexpat.so.0
	else
		mkdir -p ${pkgdir}/usr/lib/
		ln -s /usr/lib/libexpat.so ${pkgdir}/usr/lib/libexpat.so.0
	fi
}

