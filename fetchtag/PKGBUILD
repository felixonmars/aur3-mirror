pkgname=fetchtag
pkgver=20130305
pkgrel=1
pkgdesc="fetch album info from Internet and update music file tags"
arch=('any')
url='https://github.com/rk700/fetchtag'
license=('GPL3')
depends=('lua' 'taglib')
_gitroot="git://github.com/rk700/fetchtag"
_gitname="fetchtag"

build() {
    cd "${srcdir}"
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

    ./configure --prefix=/usr
    make || return 1
    make DESTDIR="$pkgdir" install || return 1
}

#vim:set ts=4 sw=4 et:
