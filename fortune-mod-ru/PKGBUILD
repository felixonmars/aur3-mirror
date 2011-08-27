
# Contributor: Andreas Schwoll <aktogaj@gmail.com>

pkgname=fortune-mod-ru
pkgver=1.52
pkgrel=1
pkgdesc="Collection of Russian fortune cookie files"
arch=('i686' 'x86_64')
url="http://jack.kiev.ua/content/view/8/9/lang,ru/"
license=('GPL')
depends=( 'fortune-mod' )
groups=( 'fortune-mods' )
source=(http://jack.kiev.ua/filez/$pkgname-$pkgver.tar.bz2)
md5sums=( '2ef8eee73bb921e099f72ea688276a57' )
_installpath="usr/share/fortune/ru"

build() {
  cd $startdir/src/$pkgname-$pkgver
  install -m 755 -d $startdir/pkg/$_installpath
  install -m 644 acid_jack/*.u8 kaschey/*.u8 vekshin/*.u8 sony/*.u8 $startdir/pkg/$_installpath
  cd $startdir/pkg/$_installpath
  for _file in *.u8; do strfile $_file; done
}
