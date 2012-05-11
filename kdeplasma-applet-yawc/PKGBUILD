#Contributor: Madek <gonzaloseguel@gmail.com>
#Maintainer: der_feniX <derfenix@gmail.com>

pkgname=kdeplasma-applet-yawc
pkgver=0.4
pkgdesc="Yet another Window Control"
pkgrel=1
arch=(i686 x86_64)
url="http://kde-look.org/content/show.php?content=139916"
license=(GPL)
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
replaces=('yawc' 'plasma-applet-yawc')
conflicts=('yawc' 'plasma-applet-yawc')
options=()
source=(http://kde-look.org/CONTENT/content-files/139916-yawc-${pkgver}.tar.gz)
md5sums=('d7a7e36690667b176cc3eeeb01dbe231')

build() {
  cd ${srcdir}/yawc-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` .
  make
}

package() {
  cd ${srcdir}/yawc-${pkgver}
  make DESTDIR=${pkgdir} install
}
