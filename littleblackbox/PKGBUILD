# Maintainer: Marek Otahal <markotahal gmail>

pkgname=littleblackbox
pkgver=0.1.3
pkgrel=1
pkgdesc="security/penetration testing tool, search in a collection of thousands of private SSL keys extracted from various embedded devices"
arch=(any)
url="http://code.google.com/p/littleblackbox/wiki/FAQ"
license=('MIT')
depends=('openssl' 'libpcap' 'sqlite3')
makedepends=('tar')
source=("http://littleblackbox.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('b9e1c0090a2b67b6425bc680cd11e7ce0a7beb32')

build() {
msg "installing $pkgname ..."
cd $srcdir
tar xvf $pkgname-$pkgver.tar.gz 
cd $pkgname-$pkgver
rm -f bin/$pkgname 2>/dev/null
cd src
make distclean
./configure
make
}

package() {
cd $srcdir/$pkgname-$pkgver

install -m755 -d ${pkgdir}/usr/bin $pkgdir/usr/share/doc/$pkgname \
    $pkgdir/usr/share/licenses/$pkgname $pkgdir/usr/share/$pkgname

install -m755 bin/$pkgname ${pkgdir}/usr/bin
install -m644 bin/lbb.db $pkgdir/usr/share/$pkgname
ln -s /usr/share/$pkgname/lbb.db $pkgdir/usr/bin/lbb.db

install -m644 docs/LICENSE $pkgdir/usr/share/$pkgname

install -m644 docs/{FAQ,README,submission.txt} $pkgdir/usr/share/doc/$pkgname

msg "done"
}

# vim:set ts=2 sw=2 et:
