# Maintainer: Facundo M. Acevedo <acv2facundo@gmail.com>
pkgname=gnome-fitness
pkgver=0.1.0
pkgrel=1
pkgdesc="a program which you can use to test your fitness level at home."
arch=('any')
url="http://mundogeek.net/gnome-fitness/"
license=('GPL')
depends=(python2 pygtk)
source=(http://launchpadlibrarian.net/17361930/${pkgname}_${pkgver}-1.tar.gz)
md5sums=('1d5db22282c8d910ea7a326eed48ca54')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|python|python2|" ${pkgname}
  make DESTDIR="$pkgdir/" install
}
