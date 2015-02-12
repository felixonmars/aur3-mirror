# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Dan Fuhry <dan@fuhry.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Hussam Al-Tayeb ht990332@gmail.com
# Contributor: Khashayar Naderehvandi <khashayar [at] naderehvandi [dot] net>
# Contributor: JJDaNiMoTh <jjdanimoth.aur@gmail.com>

pkgbase='compiz-mate'
pkgname=('compiz-core-mate' 'compiz-decorator-gtk')
pkgver=0.8.10
pkgrel=1
pkgdesc="Compiz compositing window manager for MATE"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
groups=('compiz-fusion' 'compiz-fusion-gtk' 'compiz-fusion-kde' 'compiz-mate')
makedepends=('dbus' 'fuse' 'gconf' 'glu' 'intltool' 'libgl' 'librsvg' 'libsm' 'libwnck'
             'libxcomposite' 'libxinerama' 'libxrandr' 'libxslt'
             'mate-control-center' 'startup-notification')
options=(!emptydirs)
source=("http://www.northfield.ws/projects/compiz/releases/${pkgver}/core.tar.gz"
        mate-migrate.sh)
sha1sums=('8487aa83ff46d0fcef6a21591b56f4acdd8016df'
          '5b719fa249e75cc9a7e38a805820fe2a57532e9f')

prepare() {
    cd "${srcdir}/core"
    ${srcdir}/mate-migrate.sh .
    mv gtk/gnome gtk/mate
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/core"
    export CFLAGS="-DHAVE_MARCO_2_17_0"
    ./configure \
        --prefix=/usr \
        --enable-dbus \
        --enable-gtk \
        --enable-inotify \
        --enable-librsvg \
        --enable-marco \
        --enable-mate \
        --disable-gconf \
        --disable-kde \
        --disable-kde4
    make
}

package_compiz-core-mate() {
    pkgdesc="Compiz compositing window manager for MATE."
    depends=('fuse' 'glu' 'librsvg' 'libsm' 'libxcomposite' 'libxinerama' 'libxrandr' 'libxslt' 'startup-notification')
    provides=("compiz-core")
    replaces=('compiz-core')
    conflicts=('compiz-core')

    cd "${srcdir}/core"
    make DESTDIR="${pkgdir}" install

    # remove stuff which is in one of the decorations
    rm -rf "${pkgdir}"/usr/bin/{gtk-window-decorator,kde4-window-decorator}
    rm -rf "${pkgdir}"/usr/share/{applications,gnome,mate-control-center}
    rm -rf "${pkgdir}"/usr/lib/{window-manager-settings,pkgconfig/compiz-gconf.pc,compiz/libgconf*}
    rm -rf "${pkgdir}"/etc

    # install MIT license
    install -Dm644 "${srcdir}/core/COPYING.MIT" "${pkgdir}/usr/share/licenses/compiz-core-mate/COPYING.MIT"
}

package_compiz-decorator-gtk() {
    pkgdesc="Compiz decorator for GTK."
    depends=('compiz-core' 'gconf' 'libwnck' 'mate-control-center')
    optdepends=('metacity: support for the metacity window manager')
    install="compiz-decorator-gtk.install"

    cd "${srcdir}/core"

    pushd gtk
    make DESTDIR="${pkgdir}" install
    popd

    make DESTDIR="${pkgdir}" install

    # remove stuff which is in one of the other packages
    rm -rf "${pkgdir}"/etc
    rm -rf "${pkgdir}"/usr/bin/{compiz,kde4-window-decorator}
    rm -rf "${pkgdir}"/usr/include
    cd "${pkgdir}"/usr/lib
    rm libdecoration*
    rm pkgconfig/{compiz-cube.pc,compiz-scale.pc,compiz.pc,libdecoration.pc}
    cd "${pkgdir}"/usr/lib/compiz
    rm $(ls --hide=*gconf*)
    rm -rf "${pkgdir}"/usr/share/{compiz,locale,mate/wm-properties}

    # install MIT license
    install -Dm644 "${srcdir}"/core/COPYING.MIT "${pkgdir}"/usr/share/licenses/compiz-decorator-gtk/COPYING.MIT
}
