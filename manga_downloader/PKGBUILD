# Maintainer: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=manga_downloader
pkgver=20120314
pkgrel=2
pkgdesc="Python script for downloading manga from varios websites"
arch=('any')
url="https://github.com/jiaweihli/manga_downloader"
license=('GPL3')
depends=('python2')
optdepends=('python2-imaging: for kindle conversion')


_commit='2a6f848dc2df06d97b093b78b206c9ec35ce6bff'

source=("https://github.com/jiaweihli/manga_downloader/archive/$_commit.tar.gz"
        'start-location.patch')

md5sums=('b270e7485c65fbd7f241c3d339cb0f23'
         '782db7c06c64926b5288ed6e2c864c2a')

build() {
  cd "$srcdir/$pkgname-$_commit"

  # stop the script from trying to save manga in the install folder
  patch -Np1 -i "$srcdir/start-location.patch"

  # python fix
  find -type f -exec sed -e 's,#!/usr/bin/env python,#!/usr/bin/env python2,g' -i {} \;
}


package() {
  cd "$srcdir/$pkgname-$_commit/src"

  mkdir -p "$pkgdir/usr/share/manga_downloader"
  mkdir -p "$pkgdir/usr/bin/"
  cp -r . "$pkgdir/usr/share/manga_downloader"
  ln -s /usr/share/manga_downloader/manga.py "$pkgdir/usr/bin/manga_downloader"
}
