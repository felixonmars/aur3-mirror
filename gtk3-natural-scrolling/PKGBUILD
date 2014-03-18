pkgname=gtk3-natural-scrolling
pkgver=3.10.7
pkgrel=1
pkgdesc="GObject-based multi-platform GUI toolkit (v3). Patched for OSX-like natural scrolling."
arch=(i686 x86_64)
url="http://www.gtk.org/"
provides=('gtk3=3.10.7')
depends=(atk cairo gtk-update-icon-cache libcups libxcursor libxinerama libxrandr libxi
         libxcomposite libxdamage pango shared-mime-info colord at-spi2-atk wayland libxkbcommon)
makedepends=(gobject-introspection yaourt)
optdepends=('gnome-themes-standard: Default widget theme'
            'gnome-icon-theme: Default icon theme')
license=(LGPL)

build() {
    yaourt -G gtk3
    cd gtk3
    # Patching
    sed -i.bak s/'cd "gtk+-$pkgver"'/'cd "gtk+-$pkgver"\n    TAG1\n    TAG2'/g PKGBUILD
    sed -i.bak s/'TAG1'/'sed -i.bak s\/'"'"'*delta_x = dx;'"'"'\/'"'"'*delta_x = dx * -1;'"'"'\/g gdk\/gdkevents.c'/g PKGBUILD
    sed -i.bak s/'TAG2'/'sed -i.bak s\/'"'"'*delta_y = dy;'"'"'\/'"'"'*delta_y = dy * -1;'"'"'\/g gdk\/gdkevents.c'/g PKGBUILD
    # Patching
    makepkg
}

package() {
    cp -r gtk3/pkg/gtk3 $pkgdir
    mv $pkgdir/gtk3/* $pkgdir
    cp $pkgdir/gtk3/.INSTALL $pkgdir/
    rm -rf $pkgdir/gtk3
}
