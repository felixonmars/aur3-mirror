# Contributor: Berseker <berseker86 at gmail dot com>
pkgname=google-image-downloader
pkgver=1.2.3
pkgrel=1
pkgdesc="Search with Google image with a search criteria, display results and download."
arch=('i686' ' x86_64')
url="http://sourceforge.net/projects/googleimagedown"
license=('GPL')
depends=('qt')
source=(http://downloads.sourceforge.net/googleimagedown/googleimagedownloader-v$pkgver-src.tar.bz2
google-image-downloader.desktop)

build() {
  cd "$srcdir/ImageDownloader"
  qmake
  make || return 1
  install -Dm 755 bin/GoogleImageDownloader $pkgdir/usr/bin/GoogleImageDownloader
  install -Dm 755 icons/googleimagedownloader.png $pkgdir/usr/share/pixmaps/googleimagedownloader.png
  install -Dm 755 ../google-image-downloader.desktop $pkgdir/usr/share/applications/google-image-downloader.desktop
}
md5sums=('3e697d511d2722fd0d87a15fe9f63804'
         '735164eb74ab859b1022a8cfa96e497a')
