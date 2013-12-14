pkgname=rust-http
pkgver=20131212
pkgrel=1
pkgdesc='Rust HTTP library'
arch=('i686' 'x86_64')
url='https://github.com/chris-morgan/rust-http'

license=('APACHE', 'MIT')
depends=('rust-git')
makedepends=('git' 'rust-git')

_gitroot='https://github.com/chris-morgan/rust-http.git'
_gitname='rust-http'


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
  cd $srcdir/$_gitname/build
  pwd
  install -d "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib/"
  install -m644 libhttp-*.so "$pkgdir/usr/lib/rustc/$CARCH-unknown-linux-gnu/lib"
}
