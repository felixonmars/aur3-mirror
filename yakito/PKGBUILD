# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Alfonso Saavedra "Son Link" <sonlink.dourden@gmail.com
pkgname=yakito
pkgver=0.1.2
pkgrel=2
epoch=
pkgdesc="Yakito is a multimedia converter. Is write in Java and avaliable in English, Spanish, Catala, Portuguese (BR), French, German and Romanian "
arch=(any)
url="http://www.yakiboo.net/yakito"
license=('GPL')
groups=(multimedia)
depends=(jre)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.yakiboo.net/yakito/downloads/$pkgname-$pkgver-linux.sh")
noextract=()
md5sums=(b70f7aec420a66576b11436727bfa47a) #generate with 'makepkg -g'

package() {
	chmod +x $pkgname-$pkgver-linux.sh
	./$pkgname-$pkgver-linux.sh --noexec --target "$srcdir/$pkgname-$pkgver"
	cd "$srcdir/$pkgname-$pkgver"

	wget -r -np -nd http://www.yakiboo.net/yakito/languages/ -P lang
	
	mkdir -p $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/applications
	cp -r ./* $pkgdir/usr/share/$pkgname
	chmod 777 -R $pkgdir/usr/share/yakito/
	ln -s $pkgdir/usr/share/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
	cp $pkgname.desktop $pkgdir/usr/share/applications/
}
