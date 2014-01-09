# Contributor: freaknils <freaknils@gmail.com>
pkgname=ftplicity
pkgver=1.2
pkgrel=1
pkgdesc="PGP encrypted FTP backup script based on duplicity"
arch=('i686' 'x86_64')
url="http://heise.de/-270834"
license=('GPL')
depends=('duplicity')
source=('ftp://ftp.heise.de/pub/ct/listings/0613-216.tar.gz')
sha256sums=('14c654a3e280b04088e46be48293eb3c4b194164bf820e8a6ad13d2f4848d45f')

package()
{
cd "$pkgdir/"
mkdir -p usr/bin
mkdir -p usr/share/doc/ftplicity

cd "$srcdir/$pkgname-$pkgver"
cp "ftplicity" "$pkgdir/usr/bin"
cp "gpl.txt" "$pkgdir/usr/share/doc/$pkgname"
cp "readme.txt" "$pkgdir/usr/share/doc/$pkgname"
}
