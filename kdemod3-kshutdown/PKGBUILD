# Maintainer: FAWN <add at email dot cz>
pkgname=kdemod3-kshutdown
pkgver=1.0.4
pkgrel=1
pkgdesc="Shutdown tool for Kdemod based on Trinity DE"
arch=(i686)
url="http://kshutdown.sourceforge.net"
license=('GPL')
depends=(libjpeg qt3-enhanced kdemod3-kdelibs zlib libxi libxrandr libxcursor libxinerama libxft freetype2 fontconfig libxcb util-linux libxfixes expat libxau)
makedepends=(gcc bzip2)
source=(http://downloads.sourceforge.net/project/kshutdown/KShutdown/1.0.4%20for%20KDE%203/kshutdown-$pkgver.tar.bz2)
md5sums=(1effdd6b97e702f604c113f8de5a19e4)

build() {
  cd "$srcdir/kshutdown-$pkgver"

  ./configure --prefix=`kde-config --prefix`
  make
}

package() {
  cd "$srcdir/kshutdown-$pkgver"

  make DESTDIR="$pkgdir/" install
}