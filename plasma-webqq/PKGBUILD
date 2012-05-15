pkgname=plasma-webqq
pkgver=0.5
pkgdesc="Plasma WebQQ containment intergration."
pkgrel=1
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php?content=150479"
license=(GPL)
makedepends=(cmake automoc4)
depends=(kdebase-workspace)
options=()
source=(http://kde-apps.org/CONTENT/content-files/150479-${pkgname}-${pkgver}.tar.bz2)


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  cmake -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` . || return 1
  make || return 1
}
  
package ()
{ 
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install || return 1
} 
md5sums=('40779a0d4a59590b1aead8536c23b7af')
