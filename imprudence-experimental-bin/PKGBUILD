pkgname=imprudence-experimental-bin
pkgver=2011.04.19
pkgrel=2
_pkgbasever=1.4.0
arch=('i686' 'x86_64')
_arch='x86'
[ "$CARCH" = "x86_64" ] && _arch='x86_64'
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Imprudence is an alternative viewer (experimental version)."
url="http://www.kokuaviewer.org"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gnome-vfs' 'gtk2' 'gstreamer0.10' 'libgl' 'libidn' 'libjpeg6' 'libpng12' 'mesa' 'nss' 'sdl' 'pulseaudio>=0.9.21')
install=imprudence-experimental-bin.install
source=('imprudence-experimental-bin.desktop' 'imprudence-experimental-bin.launcher' \
"http://imprudence.googlecode.com/files/Imprudence-${_pkgbasever}-Experimental-${pkgver}-Linux-${_arch}.tar.bz2")
md5sums=('1549a8f06043a8ca9a5295d322ea08a5'
         'a336d14c95382de586c8643865eb06c2'
         '6031c07c6d46ddc6f6aff0ecc5ce38c5')
[ "$CARCH" = "x86_64" ] && md5sums=(
         '1549a8f06043a8ca9a5295d322ea08a5'
         'a336d14c95382de586c8643865eb06c2'
         '75c66167da60f8369dbabd4014554003') # Probably a cleaner way to do this

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Imprudence-${_pkgbasever}-Experimental-${pkgver}-Linux-${_arch}/ imprudence-experimental-bin

    # Install Desktop File
    install -D -m644 $srcdir/imprudence-experimental-bin.desktop \
        $pkgdir/usr/share/applications/imprudence-experimental-bin.desktop

    # Install Icon File
    # Changed name to experimental so the release version can co-exist
    install -D -m644 $srcdir/imprudence-experimental-bin/imprudence_icon.png \
        $pkgdir/usr/share/pixmaps/imprudence_experimental_icon.png

    # Install Launcher
    install -D -m755 $srcdir/imprudence-experimental-bin.launcher \
        $pkgdir/usr/bin/imprudence-experimental-bin

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv imprudence-experimental-bin/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/imprudence-experimental-bin
    chmod -R g+r $pkgdir/opt/imprudence-experimental-bin

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/imprudence-experimental-bin/imprudence
}
