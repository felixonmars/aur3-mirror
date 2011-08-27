# Contributor: Peter Bengtsson <dev@lilltiger.se>
pkgname=knice
pkgver=1.0RC2
pkgrel=1
pkgdesc="KDE Priority handler (knice) is a tool to help you manage the nice levels of applications."
arch=(i686)
url="http://www.kde-apps.org/content/show.php?content=66266"
license=('GPL')
depends=('kdelibs')
makedepends=('kdelibs')
source=(http://www.lilltiger.se/${pkgname}/${pkgname}_${pkgver}.tar.gz)
md5sums=('c5d475834cb92d6335fbc98f1f728613')

build() {
  cd $startdir/src/$pkgname
  ./configure --enable-debug=full --prefix=/opt/kde
  make || return 1
  make prefix=$startdir/pkg/usr install
}