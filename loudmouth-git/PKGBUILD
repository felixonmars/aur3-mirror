# Contributor: Ian Yang <doit[dot]ian[at]gmail[dot]com>

pkgname=loudmouth-git
pkgver=20091120
pkgrel=1
pkgdesc="An asynchronous XMPP library"
arch=('i686' 'x86_64')
url="http://www.loudmouth-project.org/"
license=('LGPL')
depends=('glib2>=2.18.3' 'gnutls>=2.6.3' 'libidn')
options=('!libtool')
makedepends=('gcc' 'git' 'perlxml' 'pkgconfig' 'gtk-doc')
conflicts=('loudmouth')
provides=('loudmouth')
replaces=('loudmouth')
source=(gnutls.patch)
md5sums=('2bc4c9bd4ee7cfd672c1d50c61cf0411')

_gitroot="git://github.com/engineyard/loudmouth.git"
_gitname="loudmouth"

build() {
    cd ${srcdir}

    msg "Connecting to GIT server..."

    if [ -d ${srcdir}/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting make..."

    # Copy Latest files to Build Directory
    rm -rf ${srcdir}/$_gitname-build
    git clone ${srcdir}/$_gitname ${srcdir}/$_gitname-build
    cd ${srcdir}/$_gitname-build
    patch -p1< ${startdir}/gnutls.patch

    # Configure Source
    ./autogen.sh --prefix=/usr

    export CFLAGS="$CFLAGS -DHAVE_STRNDUP -fno-strict-aliasing"
    ./configure --prefix=/usr \
    		--disable-debug \
            --disable-static || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
	
