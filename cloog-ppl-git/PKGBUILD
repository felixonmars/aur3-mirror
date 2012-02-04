# Contributor: ezzetabi <ezzetabi at gawab dot com>

pkgname=cloog-ppl-git
pkgver=20090301
pkgrel=1
pkgdesc="Generating loops for scanning polyhedra."
arch=('i686' 'x86_64')
url="http://www.cloog.org/"
license=('GPL')

groups=()
depends=(ppl)
makedepends=(git)
provides=(cloog-ppl)
conflicts=(cloog-ppl)

replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

build() {
  cd "$startdir"
  if [ -e cloog ] ;then
    cd cloog
    git pull . master || return 1
    cd ..
  else
    git clone git://repo.or.cz/cloog-ppl.git cloog || return 1
  fi

  cp -fa cloog/ "$srcdir"/ || return 1
  cd "$srcdir"/cloog
  msg 'Returning to the newest pre '$pkgver' version.'
  git checkout ad32299a646744a7b1072972e323c08d97364469 &>/dev/null
  rm -rf .git

  ./autogen.sh || return 1
  ./configure  --with-bits=gmp  --with-ppl=/usr --prefix=/usr || return 1
  make || return 1

  make DESTDIR="$pkgdir" install || return 1
  cd "$startdir"
  rm -rf "$pkgdir"/usr/share

  return 0
}

