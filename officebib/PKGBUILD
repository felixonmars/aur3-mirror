# Contributor: system <system at tou dot de>
pkgname=officebib
pkgver=5.0.6
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.office-bibliothek.de/office-bibliothek/index.html"
if [ "$CARCH" = "x86_64" ]; then
        depends=('bash' 'deb2targz' 'lib32-libxmu' 'lib32-libxft' 'lib32-libxcursor' 'lib32-libxrandr' 'lib32-gcc-libs' 'lib32-libxi')
else
        depends=('bash' 'deb2targz' 'libxmu' 'libxft' 'libxcursor' 'libxrandr' 'gcc-libs' 'libxi')
fi
pkgdesc="Utility to view books from Duden, Brockhaus and some others"
source=(http://www.office-bibliothek.de/download/office_bibliothek/revision10/$pkgname-$pkgver-2-debian-ubuntu.deb)
noextrct=($pkgname-$pkgver-2-debian-ubuntu.deb)
license=('custom:officebib')
build() {
	deb2targz $startdir/src/$pkgname-$pkgver-2-debian-ubuntu.deb
	tar -xzvf $startdir/src/$pkgname-$pkgver-2-debian-ubuntu.tar.gz -C $startdir/pkg
        chown -R root:root $startdir/pkg
        rm $startdir/pkg/usr/share/applications/officebib.desktop~
}
md5sums=('76fc18522631601f980044b0a54151b4')
