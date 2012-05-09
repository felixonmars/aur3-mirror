#Contributor: Madek <gonzaloseguel@gmail.com>
#Maintainer: der_feniX <derfenix@gmail.com>

pkgname=yawc
pkgver=0.4
pkgdesc="Yet another Window Control"
pkgrel=1
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php?content=139916"
license=(GPL)
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
options=()
source=(http://kde-look.org/CONTENT/content-files/139916-${pkgname}-${pkgver}.tar.gz)
md5sums=('d7a7e36690667b176cc3eeeb01dbe231')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  #sed -i "s/0.1/${pkgver}/" plasma-applet-yawc.desktop

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` . || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
