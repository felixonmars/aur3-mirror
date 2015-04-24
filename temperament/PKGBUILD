# Author: Alexander Shuklin <jasuramme@mail.ru>


pkgname=temperament
pkgver=1
pkgrel=0
pkgdesc="python script made MIDI bridge for microtonal music and musical temperaments sampling"
arch=('any')
url="http://jasuramme.blogspot.ru"
license=(GPL)
depends=('python2' 'python2-pygame')
optdepends=('mf2t: Create midi files while play digital piano')
backup=('etc/yaourtrc')
source=(http://jasuramme.esy.es/tempy-1-0.tar.gz)
md5sums=('4bd5a1f24082b6ec3afea1e7ec9e1663')


package() {
  mkdir $pkgdir/etc/temperament -p
  mkdir $pkgdir/usr/bin -p
  cp "$srcdir/$pkgname-$pkgver-$pkgrel/"* $pkgdir/etc/temperament
  ln $pkgdir/etc/temperament/temperament.sh $pkgdir/usr/bin/temperament
}

# vim:set ts=2 sw=2 et:
