# Contributer: Mick Koch <kchmck@gmail.com>

pkgname="hektor-git"
pkgver=20100516
pkgrel=1
pkgdesc="Hughesnet 'fair access policy' tool"
arch=("i686" "x86_64")
url="http://github.com/kchmck/hektor"
license=("GPL3")
depends=("curl" "lua" "libxdg-basedir")
makedepends=("git" "pkgconfig")
provides=("hektor")

_gitroot="git://github.com/kchmck/hektor.git"
_gitname="hektor"

build() {
  cd "$srcdir"
  msg "Connecting to git server..."

  if [ ! -d $_gitname ]; then
    git clone --depth 1 $_gitroot $_gitname
    cd $_gitname
  else
    cd $_gitname
    git pull
  fi

  make || return 1
  make DESTDIR="$pkgdir" install
}
