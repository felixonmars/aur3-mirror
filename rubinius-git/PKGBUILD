# Contributors:
#  Selman ULUG <selman.ulug@gmail.com>

pkgname='rubinius-git'
pkgver=20120803
pkgrel=2
pkgdesc='Rubinius, the Ruby VM'
arch=('i686' 'x86_64')
license=('BSD')
url='http://rubini.us/'
depends=('openssl' 'readline' 'zlib')
makedepends=('git' 'bison' 'ruby')
conflicts=('rubinius')
replaces=('rubinius')

_gitroot='git://github.com/rubinius/rubinius.git'
_gitname='rubinius'

build() {
  cd "$srcdir"
  msg 'Connecting to GIT server....'

  [ -d $_gitname ] && {
    cd $_gitname && git pull origin
    msg 'The local files are updated.'
  } || {
    git clone $_gitroot $_gitname
  }

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure \
    --prefix=/opt/$pkgname \
    --mandir=/usr/share/man
}

package() {
  cd "$srcdir/$_gitname-build"

  FAKEROOT="$pkgdir/" rake install

  install -vDm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -d "$pkgdir/usr/bin"
  ln -s ../../opt/$pkgname/bin/rbx "$pkgdir/usr/bin"
}
