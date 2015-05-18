# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=tk_happy
pkgver=0.3
pkgrel=3
pkgdesc="An easy way to create Tkinter GUI applications"
arch=('any')
url="http://tk-happy.sourceforge.net/"
license=('BSD')
depends=('python>=2.6' 'tk')
source=(http://downloads.sourceforge.net/tk-happy/$pkgname-$pkgver.tar.gz \
        $pkgname.sh \
        LICENSE)
md5sums=('0be3f397fbfe01c0cd41c7ebdd311bf8'
         '196fbbd57bd9dc126931e421eff554cc'
         'cb48120ade09bd3e8e3f59c85ba6370d')
package() {
    install -Dm755 ../$pkgname.sh $pkgdir/usr/bin/$pkgname
    install -Dm644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    cp -rf $srcdir/${pkgname}-${pkgver}/build/usr/* ${pkgdir}/usr/
}
build() {
  mkdir -p $srcdir/${pkgname}-${pkgver}/build
  # mkdir -p $pkgdir/usr/bin/
  cd ${srcdir}/${pkgname}-${pkgver}
  python2 $srcdir/${pkgname}-${pkgver}/setup.py install\
     --root build || return 1

}
