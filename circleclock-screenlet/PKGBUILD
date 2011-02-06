# Contributor: twa022 <twa022@gmail.com>

pkgname=circleclock-screenlet
pkgver=0.7
pkgrel=1
pkgdesc="The name says it all"
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Circle+Clock?content=77159"
license=('GPL')
depends=('screenlets>=0.0.12')
source=(http://gnome-look.org/CONTENT/content-files/77159-CircleClock_0.7.tar.gz)
md5sums=('abad6255c0dee654e16a051d580de267')

build() {
  mkdir -p $pkgdir/usr/share/screenlets
  cp -r $srcdir/CircleClock $pkgdir/usr/share/screenlets/
}
