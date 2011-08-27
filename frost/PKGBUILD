# Maintainer : Nathan Owe <ndowens.aur at gmail dot com>

pkgname=frost
pkgver=20110305
_realpkgver=2011-03-05
pkgrel=1
pkgdesc="A Freenet 0.7 client that provides newsgroup-like messaging, private encrypted messages, file upload and download functionality and a file sharing system."
arch=('any')
url="http://jtcfrost.sourceforge.net/"
#depends=('freenet')
makedepends=('unzip')
license=('GPL')
install=frost.install
source=("http://downloads.sourceforge.net/jtcfrost/frost/$_realpkgver/${pkgname}_$_realpkgver.zip" "frost.desktop" "$pkgname.sh")
md5sums=('f2403c58c390ec82d4c638300e758d8c'
         '58c1f4d26d48bc13a675c97892379155'
         'b99583ebdf7227487d99c68a7a542382')

package() {
	cd "$srcdir/$pkgname"
	install -d $pkgdir/{usr/{bin,share/applications},opt/$pkgname/{config,doc,help,lib}}
	cp -r config doc help lib \
		$pkgdir/opt/$pkgname/

	cp -a {frost.jar,jtc.ico,readme.*,release_nodes.txt} \
		$pkgdir/opt/$pkgname

	install -Dm644 $srcdir/frost.desktop \
		$pkgdir/usr/share/applications/frost.desktop

	install -Dm755 $srcdir/$pkgname.sh \
		$pkgdir/usr/bin/$pkgname
	
}
