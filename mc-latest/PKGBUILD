
# AKulikov aka akm74 <info@akulikov.org.ua>

pkgname=mc-latest
pkgver=20111215
pkgrel=1
pkgdesc="GNU Midnight Commander is a s-lang based file manager"
url="http://midnight-commander.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2' 'slang' 'perl')
makedepends=('git' 'pkgconfig' 'automake' 'autoconf' 'cvs')
conflicts=('mc' 'mc-cvs' 'mc-fork-svn' 'mc-mp' 'mc-slavz' 'mc-suse')
provides=('mc')

_gitroot="git://midnight-commander.org/git/mc.git"
_gitname="mc"

build() {
    cd ${srcdir}

    msg "Connecting to the git repository..."
    if [ -d ${srcdir}/${_gitname} ]; then
        cd ${_gitname}
        git pull origin
    else
        git clone --depth 1 ${_gitroot}
    fi
    msg "Checkout GIT done or server timeout"

    rm -rf ${srcdir}/${_gitname}-build
    cp -r  ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
    cd ${srcdir}/${_gitname}-build

    ./autogen.sh

    export MCREVISION="$(git describe --tags)"

    msg "Configuring..."
    ./configure                     \
        --prefix=/usr               \
        --sysconfdir=/etc           \
        --libexecdir=/usr/lib       \
        --enable-background         \
        --enable-network            \
        --enable-netcode            \
        --enable-charset            \
        --enable-nls                \
        --with-vfs                  \
        --with-edit                 \
        --with-screen=slang         \
        --without-x                 \
        --without-samba             \
        --without-gpm-mouse         \
        --without-gnome             \
        --without-debug             \
        --without-included-gettext  \
        --disable-dependency-tracking

    msg "Start make..."
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
