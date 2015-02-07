pkgname=kde-thumbnailer-webp
pkgver=1.1
pkgrel=1
pkgdesc="KDE Thumbnail generator for WebP; a new image format for the Web."

arch=('any')
url="http://kde-apps.org/content/show.php/KDE+WebP+Thumbnailer?content=148652"
license=('GPL')
depends=('kdelibs' 'zlib')
makedepends=('cmake' 'automoc4')

source=("${pkgname}-${pkgver}.tar.bz::http://kde-apps.org/CONTENT/content-files/148652-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('304819a0140d0a02f925a28ce9d57bc4bd1c5eaabf1a1c39ea43f089f16fb792')

package () {
 cd ${srcdir}/${pkgname}
 cmake -DCMAKE_INSTALL_PREFIX=/usr
 make || return 1
 make DESTDIR=${pkgdir} install
}