pkgname=vte3-select-text-git
pkgver=0.38.0.r13.gc3da9ea
pkgrel=1

pkgdesc='Virtual Terminal Emulator widget for use with GTK3, patched for block selection support.'
url="http://www.gnome.org"
arch=('i686' 'x86_64')
license=('LGPL')

depends=('gtk3' 'vte-common')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'gtk-doc' 'gperf' 'git')

conflicts=('vte3' 'vte3-select-text')
provides=('vte3' 'vte3-select-text')

options=('!libtool' '!emptydirs')

source=('git://git.gnome.org/vte'
        'expose_select_text.patch')

md5sums=('SKIP'
         '237f66bfa695104ddce83752205b7f40')

pkgver() {
    cd vte
    git describe | sed 's/-/.r/; s/-/./'
}

prepare() {
    cd vte
    patch -Np1 -i "$srcdir"/expose_select_text.patch
}

build() {
    cd vte
    ./autogen.sh
    ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --enable-introspection \
        --libexecdir=/usr/lib/vte \
        --localstatedir=/var --disable-static
    make
}

package() {
    cd vte
    make DESTDIR="$pkgdir" install

    # This is now provided by vtecommon apparently.
    rm -f -- "$pkgdir"/etc/profile.d/vte.sh
}
