pkgname=fuzzywuzzy-git
pkgver=20120725
pkgrel=2
pkgdesc="Fuzzy string matching like a boss."
arch=(any)
url="https://github.com/seatgeek/fuzzywuzzy"
license=('BSD')
depends=('python2')
makedepends=('git')
md5sums=()

_gitroot="https://github.com/seatgeek/fuzzywuzzy.git" 
_gitname="fuzzywuzzy"

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

  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/COPYING"
}

