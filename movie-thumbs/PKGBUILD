# Contributor: FranzMari <framarinucci@gmail.com>  
# Maintainer: nomeutente94 <nomeutente94@outlook.com> 

pkgname=movie-thumbs
_pkgname=MovieThumbs
pkgver=0.4.0
pkgrel=1
pkgdesc="MovieThumbs generates thumbnails for movies and series."
arch=('any')
url="http://kde-apps.org/content/show.php/MovieThumbs?content=157543" 
license="GPL2"
depends=('kdelibs' 'qjson')
makedepends=('cmake')
source=(http://kde-apps.org/CONTENT/content-files/157543-$_pkgname-$pkgver.tar.gz)
md5sums=('cf7b11a61007af69cfdd9be685faf183')
screenshot="http://kde-apps.org/CONTENT/content-pre1/157543-1.png" 

build() { 
  cd "${srcdir}/$_pkgname-${pkgver}"
  
  # Compile core components
  mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release "${srcdir}/$_pkgname-${pkgver}/core"
  make
}

package() {
  cd "${srcdir}/$_pkgname-${pkgver}"

  # Install core components
  cd build
  make install DESTDIR="${pkgdir}"
}

build() {
  # Compile kde MOVIETHUMBS
  cd "${srcdir}/$_pkgname-${pkgver}"
  mkdir build_kde
  cd build_kde
  cmake make -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release "${srcdir}/$_pkgname-${pkgver}/kde"
  make
}

package() {
  cd "${srcdir}/$_pkgname-${pkgver}"

  # Install MOVIETHUMBS KDE (optional)
  cd build_kde
  make install DESTDIR="${pkgdir}"
}


