# Contributor: Feng Wang <wang_feng[at]live[dot]com>

pkgname=scim-googlepinyin
pkgver=20121217
pkgrel=1
pkgdesc="bring the open source Google pinyin IME for Android to GNU/Linux."
arch=('i686' 'x86_64')
url="http://code.google.com/p/scim-googlepinyin/"
license=('Apache License 2.0')
depends=( 'scim' 'gtk2' 'glib2' )
makedepends=('git')
options=(!libtool)
source=()
md5sums=()

_gitroot="git://github.com/tchaikov/scim-googlepinyin.git"
_gitname="scim-googlepinyin"

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin && cd ..
  else
    git clone $_gitroot
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build

  cd $_gitname-build
  ./autogen.sh || return 1
  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}

