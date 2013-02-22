# Maintainer: Scott Dunlop <swdunlop@gmail.com>
# Derived from busybee by Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=busybee-git
pkgdesc="High performance messaging layer"
arch=('i686' 'x86_64')
url="https://github.com/rescrv/busybee"
depends=('libpo6-git' 'libe-git')
pkgrel=1
license=('BSD')
groups=()
depends=()
makedepends=('git' 'autoconf')
checkdepends=()
optdepends=()
provides=('busybee')
conflicts=('busybee')
replaces=()
backup=()
options=()

_gitroot='https://github.com/rescrv/busybee.git'
_gitname='busybee'
pkgver=$(date +%Y%m%d)

# for pacman 4.3, you can use this, instead:
#pkgver() {
    #cd "$srcdir/$_gitname"
    #echo $(git describe --always | sed 's/-/./g')
#}

build() {
    cd "$srcdir"
    msg "Connecting to GIT server...."

    if [[ -d "$_gitname" ]]; then
        cd "$_gitname" && git pull origin
        msg "The local files are updated."
    else
        git clone "$_gitroot" "$_gitname"
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build..."

    rm -rf "$srcdir/$_gitname-build"
    git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
    cd "$srcdir/$_gitname-build"

    autoreconf -i
    
    export PYTHON=python2.7
    ./configure --prefix=/usr
    make || return 1
}

check() {
    cd "$srcdir/$_gitname-build"
    make -k check
}


package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir/" install
}
