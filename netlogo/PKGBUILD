# Contributor: Grogi <roman@algofacil.info>

pkgname=netlogo
pkgver=5.2.0
pkgrel=1
pkgdesc="A multi-agent programmable modeling environment."
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && NARCH=amd64
[ "$CARCH" = "x86_64" ] && NARCH=x86
license=('LGPL' 'custom')
url="http://ccl.northwestern.edu/netlogo/"
depends=('java-runtime')
source=(http://ccl.northwestern.edu/netlogo/5.2.0/netlogo-5.2.0.tar.gz
		'netlogo'
		'hubnet'
		'netlogo-3D'
		'netlogo-headless')
md5sums=('b9085a9b3caca6113c661df81650e0f2'
         '6aa5963c9454a4e35fda52dc7dc7e3cc'
         'd66e6d07949e50f0af079f6c852cc64a'
         '57b493124e71631afe38662e40a5637f'
         '2404fc7bd1745a50b851f8871ebe8348')

package() {
  mkdir -p $pkgdir/usr/bin $pkgdir/opt/$pkgname
  cd $srcdir
  find $pkgname-$pkgver -type d -name Linux-$NARCH | xargs rm -r
  cp $pkgname-$pkgver/* $pkgdir/opt/$pkgname -r
  cp netlogo hubnet netlogo-3D netlogo-headless $pkgdir/usr/bin
}

