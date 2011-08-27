# Contributor: Mike Melnikov <make.programs@gmail.com>

pkgname=tuxguitar-stable
pkgver=1.2
pkgrel=10
pkgdesc="An open source tablature editor."
arch=('i686' 'x86_64')
url="http://tuxguitar.herac.com.ar/"
license=('GPL')
depends=('swt')
provides=('tuxguitar')
conflicts=('tuxguitar')

case $CARCH in
  'i686')
    md5sums=('810f558ccfb5f4c0da735b7922b6a55c')
    __arch=x86 ;;
  'x86_64')
    md5sums=('04af87fd1e5628c043eca4b5dd245c82')
    __arch=x86-64 ;;
esac

source=(http://sourceforge.net/projects/tuxguitar/files/TuxGuitar/TuxGuitar-$pkgver/tuxguitar-$pkgver-linux-${__arch}.tar.gz)

package() {
  cd "$srcdir"/tuxguitar-$pkgver-linux-${__arch}

  install -dm755 "$pkgdir/opt/tuxguitar" "$pkgdir/usr/bin"
  cp -r doc lib share tuxguitar{,.jar} "$pkgdir/opt/tuxguitar"
  cp -f "$srcdir/../tuxguitar" "$pkgdir"/usr/bin/tuxguitar
}
