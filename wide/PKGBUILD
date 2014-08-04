# Maintainer: Alessandro Schillaci < http://slade.altervista.org >
# Contributor: Alessandro Schillaci < http://slade.altervista.org >
pkgname=wide
pkgver=1.2.2
pkgrel=1
pkgdesc="WxWidgets Inform 6 Development Environment"
arch=(i686 x86_64)
url="https://github.com/silverslade/wide"
license=('gpl')
depends=('glibc' 'wxgtk')
#makedepends=('unzip')
#provides=()
#conflicts=()
#replaces=()
#backup=()
groups=(inform)
#options=()
#install=
source=(https://github.com/silverslade/wide/archive/v${pkgver}.tar.gz)
#noextract=()
md5sums=(72856e457af9394c2d4ceb223fd2dfc8)

build() {
	cd ${srcdir}/$pkgname-$pkgver/src/
	make || return 1
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mkdir -p $pkgdir/usr/share/$pkgname/
	mkdir -p ~/.wide
	cp ${srcdir}/$pkgname-$pkgver/src/wide $pkgdir/usr/bin
	cp ${srcdir}/$pkgname-$pkgver/src/wide.ini ~/.wide/
	cp ${srcdir}/$pkgname-$pkgver/README.textile ~/.wide/
	chmod +x $pkgdir/usr/bin/wide
	echo -e "Configuration file at ~/.wide/wide.ini"
}
