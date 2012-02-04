# Maintainer: Mamut Ghiunhan <venerix@blug.ro>
pkgname=tvmaxe
pkgver=0.06.2
pkgrel=1
pkgdesc="Free television for your Linux system"
arch=('i686' 'x86_64')
url="http://code.google.com/p/tv-maxe/"
license=('GPL')
depends=('python2' 'pygtk' 'vlc' 'mplayer' 'libstdc++5' 'sopcast')
[ "$CARCH" == "x86_64" ] && depends=('python2' 'pygtk' 'vlc' 'mplayer' 'libstdc++5' 'bin32-sopcast')
optdepends=('lirc' 'mencoder')
install=('tvmaxe.install')
source=(http://tv-maxe.googlecode.com/files/$pkgname-$pkgver.tar.gz $pkgname $pkgname.desktop)
md5sums=('d7c3f4e80bd51c78d2b4ba82e4c6f691'
         'f607a19b0467671f534a199c3b8004ed'
         'aa685803a87702e9a363e491a958e3b1')
build() {
	cd $srcdir/$pkgname-$pkgver
	install -m 755 -d $pkgdir/usr/share/$pkgname
	install -m 755 -D $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
	install -m 644 -D $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	cp -R * $pkgdir/usr/share/$pkgname
}
