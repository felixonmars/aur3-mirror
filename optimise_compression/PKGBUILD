# Maintainer: Pierre Buard <pierre.buard gmail com>

pkgname=optimise_compression
pkgver=1.6
pkgrel=1
pkgdesc="Service menus to allow lossless optimisation of compressed files"
arch=('any')
url="http://www.kde-apps.org/content/show.php?content=17552"
license=('GPL')
depends=('optipng' 'advancecomp')
source=(http://www.kde-apps.org/CONTENT/content-files/17552-optimise_compression_$pkgver.tar.gz)
md5sums=('c6d4e148fe716c4bb6cf45a8175b5c1a')

build() {
  cd "$srcdir/Optimise Compression 1.6"

  install -d ${pkgdir}/usr/share/kde4/services/ServiceMenus
  install -Dm644 optimise_{gzip,mng,png,zip}.desktop $pkgdir/usr/share/kde4/services/ServiceMenus || return 1
}
