pkgname=rust-sqlite
pkgver=20131020
pkgrel=1
pkgdesc='Sqlite bindings for Rust programming language.'
arch=('i686' 'x86_64')
url='https://github.com/eerden/rustsqlite.git'
license=('Public Domain')
depends=('rust-git')
makedepends=('git' 'rust-git')

_gitroot='https://github.com/eerden/rustsqlite.git'
_gitname='rustsqlite'


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
  rustpkg build sqlite
}

package(){
  cd $srcdir/$_gitname
  install -d "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"
  install -m644 $srcdir/$_gitname/build/x86_64-unknown-linux-gnu/sqlite/libsqlite-*.so   "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib"
}
