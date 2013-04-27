# Originally: AqD
# Conytibutor: Victor Aurélio <victoraur.santos@gmail.com>
# Maintainer: Jristz <prflr88@gmail.com>

_pkgbasename=gtk2
pkgname=lib32-gtk2-aqd
pkgver=2.24.17
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2), with mac-style menubar"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk2.install
depends=(lib32-{'atk>=1.30.0','pango>=1.28.0','cairo>=1.10.0','gdk-pixbuf2>=2.22.1'}
         lib32-lib{'cups>=1.4.4',xcursor,'xrandr>=1.3','xi>=1.3',xinerama,xcomposite,xdamage}
         $_pkgbasename)
makedepends=('pkgconfig' 'gcc-multilib')
provides=("lib32-gtk2=$pkgver")
replaces=('lib32-gtk2')
conflicts=('lib32-gtk2')
options=('!libtool')
license=(LGPL)
source=("http://ftp.gnome.org/pub/GNOME/sources/gtk+/2.24/gtk+-$pkgver.tar.xz"
        xid-collision-debug.patch
        gtk-gtkmenubar.patch
	gtk-modules-32.patch)

build() {
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

    cd gtk+-$pkgver

    ## Apply Patches
    patch -Np0 < ${startdir}/xid-collision-debug.patch
    patch -Np1 < ${srcdir}/gtk-modules-32.patch
    patch -Np0 < ${startdir}/gtk-gtkmenubar.patch

    CXX=/bin/false ./configure --prefix=/usr \
                                --sysconfdir=/etc \
                                --localstatedir=/var \
				--libdir=/usr/lib32 \
                                --with-xinput=yes

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool                                
    make
}

package() {
    cd "${srcdir}/gtk+-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -rf "${pkgdir}"/etc
    rm -rf "${pkgdir}"/usr/{include,share}

    cd "${pkgdir}"/usr/bin
    mv gtk-query-immodules-2.0 gtk-query-immodules-2.0-32
    rm -f gtk-builder-convert gtk-demo gtk-update-icon-cache
}

md5sums=('a10cc43fad8d64f8893d779b1f8322ff'
         '6c39627284d656fc70fae7c557ddc718'
         'f684703385e424343faeceb560e1fe02'
         '7cf132946e97d12d396f413f7f0a2876')
