# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=nitfol
pkgver=0.6
pkgversuffixe=pre4
pkgrel=1
pkgdesc="A Z-code, Glulx, BTZ interpreter and debugger."
arch=(i686 x86_64)
url="http://nitfol.sourceforge.net/"
license=('GPL')
depends=('glpk' 'mono' 'gtk2')
source=(http://downloads.sourceforge.net/sourceforge/nitfol/nitfol-0.6-pre4.tar.bz2)
md5sums=('c9d1509d830a148f7226a9fd2c3f5f60')

build() {
mkdir -p $pkgdir/usr/share/${pkgname}
mkdir -p $pkgdir/usr/bin/

cp -fr $srcdir/${pkgname}-${pkgver}-${pkgversuffixe}/build/* $pkgdir/usr/share/${pkgname}/
cp -fr $srcdir/${pkgname}-${pkgver}-${pkgversuffixe}/doc $pkgdir/usr/share/${pkgname}/
cp -fr $srcdir/${pkgname}-${pkgver}-${pkgversuffixe}/INSTALL $pkgdir/usr/share/${pkgname}/

echo "mono /usr/share/nitfol/Nitfol.exe \$1" > $pkgdir/usr/bin/nitfol

chmod +x $pkgdir/usr/bin/nitfol

}

