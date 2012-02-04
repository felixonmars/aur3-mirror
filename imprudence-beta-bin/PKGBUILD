pkgname=imprudence-beta-bin
pkgver=1.4.0b2
pkgrel=1
_pkgbasever=1.4.0_beta2
arch=('i686' 'x86_64')
_arch='x86'
[ "$CARCH" = "x86_64" ] && _arch='64bit_repacked'
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Imprudence is an alternative viewer (beta version)."
url="http://www.kokuaviewer.org"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gnome-vfs' 'gtk2' 'gstreamer0.10' 'libgl' 'libidn' 'libjpeg7' 'libpng12' 'mesa' 'nss' 'sdl')
optdepends=('pulseaudio>=0.9.21')
install=imprudence-beta-bin.install
source=('imprudence-beta-bin.desktop' 'imprudence-beta-bin.launcher' \
"http://imprudence.googlecode.com/files/imprudence_${_pkgbasever}_${_arch}.tar.gz")
sha256sums=('83dfd722dae1ad262f01bb570c542a0dc16ca231e148e266db2af6292a1d8426'
         '9c5a2014b6fc63f104546a012365a94f9633fdec7dd8174305872a8167ee9c17'
         '1cf6abf467dc95fefd0886b56a42ec85cfe8c3840edc767d9a72c1c4840f4656')
[ "$CARCH" = "x86_64" ] && sha256sums=(
         '83dfd722dae1ad262f01bb570c542a0dc16ca231e148e266db2af6292a1d8426'
         '9c5a2014b6fc63f104546a012365a94f9633fdec7dd8174305872a8167ee9c17'
         '5ff76b57734ca3be8e64e7e0d8c1ce67c1844421274e36f9cd59e7e099df5052')
         # There's probably a cleaner way to do this
[ "$CARCH" = "x86_64" ] && noextract=("imprudence_${_pkgbasever}_${_arch}.tar.gz")

build() {
    cd $srcdir;

    if [ "$CARCH" = "x86_64" ]; then
        mkdir imprudence_${_pkgbasever}_${_arch}
        tar -xzf imprudence_${_pkgbasever}_${_arch}.tar.gz \
        -C imprudence_${_pkgbasever}_${_arch}
    fi

    # Rename Data Directory
    mv imprudence_${_pkgbasever}_${_arch}/ imprudence-beta-bin

    # Install Desktop File
    install -D -m644 $srcdir/imprudence-beta-bin.desktop \
        $pkgdir/usr/share/applications/imprudence-beta-bin.desktop

    # Install Icon File
    # Changed name to beta so the release version can co-exist
    install -D -m644 $srcdir/imprudence-beta-bin/imprudence_icon.png \
        $pkgdir/usr/share/pixmaps/imprudence_beta_icon.png

    # Install Launcher
    install -D -m755 $srcdir/imprudence-beta-bin.launcher \
        $pkgdir/usr/bin/imprudence-beta-bin

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv imprudence-beta-bin/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/imprudence-beta-bin
    chmod -R g+r $pkgdir/opt/imprudence-beta-bin

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/imprudence-beta-bin/imprudence
}
