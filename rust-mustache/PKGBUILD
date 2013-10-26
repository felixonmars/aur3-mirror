pkgname=rust-mustache
pkgver=20131020
pkgrel=1
pkgdesc='Mustache templating system for Rust programming language'
arch=('i686' 'x86_64')
url='https://github.com/erickt/rust-mustache'
license=('MIT')
depends=('rust-git')
makedepends=('git' 'rust-git')

_gitroot='https://github.com/eerden/rust-mustache.git'
_gitname='rust-mustache'


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
  make
}

package(){
  cd $srcdir/$_gitname/bin
  install -d "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"
  install -m644 libmustache-*.so "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib"
}
