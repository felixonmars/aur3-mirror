pkgname=rust-postgres
pkgver=20131021
pkgrel=1
pkgdesc='Native PostgreSQL driver for the Rust programming language'
arch=('i686' 'x86_64')
url='https://github.com/sfackler/rust-postgres'
license=('MIT')
depends=('rust-git')
makedepends=('git' 'rust-git')

_gitroot='https://github.com/eerden/rust-postgres.git'
_gitname='rust-postgres'


prepare() {
    cd "$srcdir"
    msg 'Fetching source from Git...'

    if [ -d "$_gitname" ] ; then
        cd "$_gitname" && git pull --no-edit 'origin'
        msg 'Local repository is now up-to-date.'
    else
        git clone "$_gitroot"
    fi
}

build() {
  cd $srcdir/$_gitname
  rustc lib.rs
}

package(){
  cd $srcdir/$_gitname
  install -d "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"
  install -m644 $srcdir/$_gitname/libpostgres-*.so   "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib"
}
