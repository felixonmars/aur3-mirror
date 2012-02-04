# Maintainer:  Denis Martinez <deuns.martinez AT gmail.com>
# Contributor:  Martin Peres <martin.peres AT ensi-bourges.fr>

pkgname=ppasskeeper
pkgver=1.0b2
pkgrel=1
pkgdesc="PPasskeeper is a library that means to create a portable password-storing interface."
url="http://ppasskeeper.mupuf.org/"
license=('LGPL')
depends=('gcc-libs')
makedepends=('subversion')
optdepends=('qt: PPassKeeper GUI and Qt plugin'
            'gtk2: GTK2 plugin'
            'gnome-keyring: GNOME plugin'
            'kdebase-runtime: KDE plugin')
options=('libtool')
arch=('i686' 'x86_64')
install=
source=("http://mupuf.org/media/projects/ppasskeeper/ppasskeeper-"$pkgver"_src.tar.bz2")
md5sums=('200aa465fbe129c75babea2b3e222203')

build() {
  cd ${srcdir}/ppasskeeper-$pkgver

  msg "Starting make..."

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPPK_ELEKTRA=OFF .. || return 1
  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}

