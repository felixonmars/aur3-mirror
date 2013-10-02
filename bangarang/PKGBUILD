# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=bangarang
pkgver=2.1
pkgrel=4
pkgdesc="Simple KDE media player."
arch=('i686' 'x86_64')
url="http://bangarangkde.wordpress.com/"
license=('GPL3')
depends=('kdelibs>=4.6' 'taglib>=1.5')
makedepends=('automoc4' 'cmake')
optdepends=('nepomuk-core: To enable Media library, rating and play count functions')
source=(http://bangarangissuetracking.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('b70b27027c93b5ee8576183277b55776')

prepare() {
  cd $srcdir/$pkgname-$pkgname/src/platform/infofetchers

  # GCC 4.7 fix
  sed -i '22i#include <unistd.h>' {lastfm,tmdb,tvdb}infofetcher.h

  cd $srcdir/$pkgname-$pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd $srcdir/$pkgname-$pkgname
  make DESTDIR=$pkgdir install

  # Launcher for every DE
  mv $pkgdir/usr/share/applications/kde4/$pkgname.desktop $pkgdir/usr/share/applications
  rm -rf $pkgdir/usr/share/applications/kde4
}
