# Contributor: rabyte <rabyte__gmail>

pkgname=kazama
pkgver=20110118
pkgrel=1
pkgdesc="A fighting game engine similar to MUGEN, with online capabilities"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('python-pygame')
[ "$CARCH" = "i686" ] && optdepends=('psyco (improved loading times)')
source=(http://downloads.sourceforge.net/$pkgname/kazama_source_$pkgver.zip \
	$pkgname.sh)
md5sums=('ecd8476d4f462c5afb8ce25317826ca5'
         'e98d12f398aa459ed2d4a0cec692a513')

build() {
  cd $srcdir

  mkdir -p $pkgdir/usr/share/$pkgname
  cp -rf keymap.py main.py settings.ini chars/ kazama/ stages/ \
	$pkgdir/usr/share/$pkgname/
  install -m755 -D $pkgname.sh $pkgdir/usr/bin/$pkgname

  cd $pkgdir/usr/share/$pkgname
  rm -f $pkgname/compile.py
  find -type f -exec chmod 644 {} \;
}
