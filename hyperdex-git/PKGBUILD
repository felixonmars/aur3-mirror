# Maintainer: Scott Dunlop <swdunlop@gmail.com>
# Derived from hyperdex by Serge Zirukin <ftrvxmtrx@gmail.com>

pkgname=hyperdex-git
pkgrel=1
pkgdesc="A Searchable Distributed Key-Value Store"
arch=('x86_64')
url="https://github.com/rescrv/HyperDex"
license=('BSD')
groups=()
depends=('libe-git' 'libpo6-git' 'busybee-git' 'replicant-git' 'cityhash' 'google-glog' 'python2')
makedepends=('git' 'autoconf' 'autoconf-archive' 'gperf' 'cython2' 'python2-sphinx' 'pandoc')
checkdepends=()
optdepends=()
provides=('hyperdex')
conflicts=('hyperdex')
replaces=()
backup=()
options=()
source=('python2.patch')
md5sums=('4890ccca604e8b758432ae00643e6ea3')

_gitroot='https://github.com/rescrv/HyperDex.git'
_gitname='hyperdex'
pkgver=20130221

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
    
    patch -p1 -i $srcdir/python2.patch
    autoreconf -i
    
    export PYTHON=python2.7
    ./configure --prefix=/usr --enable-python-bindings
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