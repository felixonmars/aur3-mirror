# Maintainer: Da_Coynul xtragb[at]gmail[dot]com>

pkgname=gstd-git
pkgver=20120120
pkgrel=5
pkgdesc="GStreamer Daemon (gstd) is a GStreamer framework for controlling audio and video streaming using D-Bus messages"
url="https://github.com/RidgeRun/gstd/wiki"
depends=(
    'dbus' 'dbus-core' 'dbus-glib' 'readline' 'gstreamer0.10' 'gstreamer0.10-base' 'gstreamer0.10-base-plugins')
makedepends=('autoconf' 'automake' 'git' 'libtool' 'pkgconfig')
optdepends=(
    'vala: if you plan to modify the source code'
)
install='gstd.install'
backup=(usr/share/dbus-1/services/com.ridgerun.gstreamer.gstd.service)
source=('com.ridgerun.gstreamer.gstd.service')
md5sums=('f6086e818592f4ac999c0df827d7eef4')
license=('GPL2')
arch=('i686' 'x86_64')
provides=('gstd')

_gitroot="git://github.com/RidgeRun/gstd.git"
_gitname="gstd"

build() {
    cd $srcdir

    msg "Connecting to Git server..."

    if [ -d $srcdir/$_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
    else
        git clone $_gitroot
    fi

    msg "Git checkout done or server timeout."
    msg "Starting make..."

    # Copy Latest files to Build Directory
    cp -r $srcdir/$_gitname $srcdir/$_gitname-build
    cd $srcdir/$_gitname-build

    # Configure Source
    ./configure \
        --prefix=/usr \
	--with-vapidir=/usr/share/vala/vapi \
        --sysconfdir=/etc

    # Build Source
    make || return 1
}

package() {
    cd $srcdir/$_gitname-build

    # Install Source
    make DESTDIR=$pkgdir install

    # Remove Build Directory
    rm -r $srcdir/$_gitname-build/

    install -Dm644 $srcdir/com.ridgerun.gstreamer.gstd.service $pkgdir/usr/share/dbus-1/services/com.ridgerun.gstreamer.gstd.service
}
