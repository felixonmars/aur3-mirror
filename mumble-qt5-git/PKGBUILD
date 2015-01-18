# Maintainer: anex <lane.wiscombe[@]gmail.com>

# If you want support for your G15 Keyboard, please add 'g15daemon'
# to the depends and delete "no-g15" in the configure line below

pkgname=mumble-qt5-git
pkgver=r5128.fd8b684
_pkgver=1.3.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='A voice chat application similar to TeamSpeak (GIT version built with QT5)'
url='https://github.com/mumble-voip/mumble'
license=('BSD')
depends=('qt5-base' 'qt5-svg' 'qt5-tools' 'speex' 'lsb-release' 'libxi' 'avahi' 'libsndfile' 'protobuf' 'libpulse' 'opus' 'xdg-utils')
makedepends=('boost' 'mesa' 'git')
#optdepends=('portaudio: for portaudio back-end' 'g15daemon: G15 Keyboard support')
conflicts=('mumble' 'mumble-git')
provides=('mumble')
install=mumble.install

source=('git://github.com/mumble-voip/mumble.git'
        'revert-tray.patch')
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/mumble"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/mumble"

    git submodule init
    git submodule update

    # Reverts a commit that can make mumble not restore when trying to restore from tray if it starts minimized on some WM/DE's or panels
    # Uncomment to apply this patch if you encounter the issue
    # patch -Np1 < ${srcdir}/revert-tray.patch
}

build() {
    cd "$srcdir/mumble"

    # Building mumble
    qmake-qt5 main.pro \
      CONFIG+="bundled-celt no-bundled-opus no-bundled-speex no-speechd no-g15 \
           no-xevie no-server no-embed-qt-translations no-update packaged" \
    DEFINES+="PLUGIN_PATH=/usr/lib/mumble"

   make release
}

package() {
    cd "$srcdir/mumble"

    # bin stuff
    install -m755 -D ./release/mumble $pkgdir/usr/bin/mumble
    install -m755 -D ./scripts/mumble-overlay $pkgdir/usr/bin/mumble-overlay

    # lib stuff
    install -m755 -D ./release/libmumble.so.$_pkgver $pkgdir/usr/lib/mumble/libmumble.so.$_pkgver
    ln -s libmumble.so.$_pkgver $pkgdir/usr/lib/mumble/libmumble.so
    ln -s libmumble.so.$_pkgver $pkgdir/usr/lib/mumble/libmumble.so.1
    ln -s libmumble.so.$_pkgver $pkgdir/usr/lib/mumble/libmumble.so.${_pkgver:0:3}
    install -m755 -D ./release/plugins/liblink.so $pkgdir/usr/lib/mumble/liblink.so
    install -m755 -D ./release/plugins/libmanual.so $pkgdir/usr/lib/mumble/libmanual.so
    install -m755 -D ./release/libcelt* $pkgdir/usr/lib/mumble/

    # other stuff
    install -m644 -D ./scripts/mumble.desktop $pkgdir/usr/share/applications/mumble.desktop
    install -m755 -d $pkgdir/usr/share/man/man1
    install -m644 -D ./man/mum* $pkgdir/usr/share/man/man1/
    install -m644 -D ./icons/mumble.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/mumble.svg
    install -m644 -D ./LICENSE $pkgdir/usr/share/licenses/mumble/LICENSE
}