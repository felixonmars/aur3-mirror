# Contributor: Fedor Suchkov <f.suchkov@gmail.com>


pkgname=kblogger-kde4
pkgver=1.0_alpha3
pkgrel=1
pkgdesc="KBlogger is a simple to use blogging application for the K Destkop Environment. It integrates in KDE Kicker for easy and fast blogging or is available as a standalone application for KDE 4. The Interface is slick and tries to provide all features support on the server side for your convenience. Just configure your blog, load the editor and start writing."
arch=(i686 x86_64)
url="http://kblogger.pwsp.net/"
license=('GPL2')
groups=()
depends=('kdelibs>=4.1.0' 'kdebase>=4.1.0' 'kdebase-runtime>=4.1.0' 'kdepimlibs>=4.1.0')
makedepends=('cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://kblogger.pwsp.net/files/kblogger-1.0-alpha3.tar.bz2)
noextract=()
md5sums=('aaf3294968c058f1a82b530080e06268')

build() {
  cd "$srcdir/kblogger"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make || return 1
  make DESTDIR="$pkgdir/" install
}
