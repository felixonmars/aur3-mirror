# Maintainer:  Denis Martinez <deuns.martinez AT gmail.com>
# Contributor:  Martin Peres <martin.peres AT ensi-bourges.fr>

pkgname=ppasskeeper-git
pkgver=20100816
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
source=()
md5sums=()

_gitroot="git://gitorious.org/ppasskeeper/ppasskeeper.git"
_gitname="ppasskeeper"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DPPK_ELEKTRA=OFF .. || return 1
  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}

