# Maintainer: Martinsh Shaiters <martinsh.shaiters@gmail.com>

pkgname=rust-sfml-git
pkgver=20130629
pkgrel=2
pkgdesc='Rust binding for SFML, the Simple and Fast Multimedia Library.'
arch=('i686' 'x86_64')
url='https://github.com/JeremyLetang/rust-sfml'
license=('ZLIB')
depends=('csfml=2.0')
makedepends=('git' 'rust-git')

_gitroot='https://github.com/JeremyLetang/rust-sfml.git'
_gitname='rust-sfml'


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
    rm -rf "$srcdir/$_gitname/build/"
    mkdir -p "$srcdir/$_gitname/build/docs"

    rust build --out-dir "$srcdir/$_gitname/build/" \
        "$srcdir/$_gitname/src/rsfml.rc"
    rust doc --output-dir "$srcdir/$_gitname/build/doc/" \
        "$srcdir/$_gitname/src/rsfml.rc"
}

package() {
    cd "$srcdir/$_gitname/build/"

    install -d "$pkgdir/usr/lib/rust/"
    install -m644 `ls | grep 'lib.*\.so'` "$pkgdir/usr/lib/rust/"
    install -Dm644 "$srcdir/$_gitname/LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    if [ -d 'doc/' ] ; then
        install -Dm644 'doc/' "$pkgdir/usr/share/$pkgname/doc"
    fi
}
