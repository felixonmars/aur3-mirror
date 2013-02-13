#Originally by AqD
#Last edited by - Victor Aurélio <victoraur.santos@gmail.com>

pkgname=gtk2-aqd-overlay-scrollbar
pkgver=2.24.15
pkgrel=1
pkgdesc="The GTK+ Toolkit (v2), with mac-style menubar and overlayscrollbar patch from ubuntu"
arch=(i686 x86_64)
url="http://www.gtk.org/"
install=gtk2.install
depends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
         'shared-mime-info' 'cairo' 'libcups' 'gtk-update-icon-cache')
makedepends=('atk' 'pango' 'libxcursor' 'libxinerama' 'libxrandr' 'libxi' 'libxcomposite' 'libxdamage'
             'shared-mime-info' 'cairo' 'libcups' 'gdk-pixbuf2' 'gobject-introspection')
provides=("gtk2=$pkgver")
replaces=('gtk2' 'gtk2-docs')
conflicts=('gtk2')
options=('!libtool')
backup=(etc/gtk-2.0/gtkrc)
license=(LGPL)
source=("http://ftp.gnome.org/pub/GNOME/sources/gtk+/2.24/gtk+-$pkgver.tar.xz"
        xid-collision-debug.patch
        gtk-gtkmenubar.patch
        '100_overlay_scrollbar_loading.patch')
md5sums=('68f034fb4f68086790d7488cf00e71c8'
         '6c39627284d656fc70fae7c557ddc718'
         'f684703385e424343faeceb560e1fe02'
         '25e724d7a96e6f73dc6e9e6bcc66d3d6')

build() {
	cd gtk+-$pkgver

    ## Apply Patches
	patch -Np0 < ${startdir}/xid-collision-debug.patch
	patch -Np0 < ${startdir}/gtk-gtkmenubar.patch
	patch -Np1 < ${startdir}/100_overlay_scrollbar_loading.patch


    CXX=/bin/false ./configure --prefix=/usr \
                                --sysconfdir=/etc \
                                --localstatedir=/var \
                                --with-xinput=yes

    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool                                
	make
}

package() {
    cd gtk+-$pkgver

    make DESTDIR="$pkgdir" install
    sed -i "s#env python#env python2#" $pkgdir/usr/bin/gtk-builder-convert
    echo 'gtk-fallback-icon-theme = "gnome"' > "$pkgdir/etc/gtk-2.0/gtkrc"
    
    #split this out to use with gtk3 too
    rm $pkgdir/usr/bin/gtk-update-icon-cache
}
