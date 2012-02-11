
pkgname=telak-git
pkgver=20120211
pkgrel=1
pkgdesc="A small tool to draw local or remote pictures on your root window"
arch=('i686' 'x86_64')
url="http://julien.danjou.info/telak/"
license=('GPL')
depends=('curl' 'imlib2' 'libgcrypt')
makedepends=('git')
_gitroot='git://git.naquadah.org/telak.git'
_gitname='telak'

build() {
  cd $srcdir
  msg "Connecting to GIT server..."
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot || return 1
  fi
  msg "Git checkout done"

  cd $srcdir/$_gitname
  sed -i '4 s/\( \$.*\)\( -lgcrypt\)/\2\1/' Makefile
  make || return 1
}


package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 telakrc.sample "$pkgdir/usr/share/$pkgname/telakrc.sample"
}
