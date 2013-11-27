# Maintainer: Andry Widya Putra <andrywidyaputra@gmail.com>
pkgname=scim-javanese-tables
pkgver=1
pkgrel=2
pkgdesc="A Javanese Script input method table for scim"
arch=('any')
url="http://www.computer-issue.blogspot.com"
license=('GPL')
depends=('scim' 'scim-tables')
optdepends=('ttf-tuladha-jejeg')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz)
md5sums=('a9f9edcc1a465d38ba583944a96a395c') #generate with 'makepkg -g'

package() {
	mkdir -p $pkgdir/usr/share/scim/tables/
	mkdir -p $pkgdir/usr/share/scim/icons/
	cp "$srcdir/$pkgname-$pkgver/Javanese.bin" "$pkgdir/usr/share/scim/tables"
	cp "$srcdir/$pkgname-$pkgver/Javanese.png" "$pkgdir/usr/share/scim/icons"
}
