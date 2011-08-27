pkgname=imprudence-experimental-secondlife-bin
pkgver=2011.04.19
pkgrel=1
_pkgbasever=1.4.0
_arch=x86
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Imprudence is alternative viewer (native 32bit experimental version)"
url="http://www.kokuaviewer.org"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gnome-vfs' 'gtk2' 'gstreamer0.10' 'libgl' 'libidn' 'libjpeg6' 'libpng12' 'mesa' 'nss' 'sdl' 'pulseaudio>=0.9.21')
arch=('i686')
install=imprudence-experimental-secondlife.install
source=('imprudence-experimental-secondlife.desktop' 'imprudence-experimental-secondlife.launcher' \
"http://imprudence.googlecode.com/files/Imprudence-${_pkgbasever}-Experimental-${pkgver}-Linux-${_arch}.tar.bz2")
md5sums=('e18d493f566d97d1984d8a5e6ef81aef'
         '73a615f30ff53305fb7e3dca1e237241'
         '6031c07c6d46ddc6f6aff0ecc5ce38c5')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Imprudence-${_pkgbasever}-Experimental-${pkgver}-Linux-${_arch}/ imprudence-experimental-secondlife

    # Install Desktop File
    install -D -m644 $srcdir/imprudence-experimental-secondlife.desktop \
        $pkgdir/usr/share/applications/imprudence-experimental-secondlife.desktop

    # Install Icon File
    # Changed name to experimental so the release version can co-exist
    install -D -m644 $srcdir/imprudence-experimental-secondlife/imprudence_icon.png \
        $pkgdir/usr/share/pixmaps/imprudence_experimental_icon.png

    # Install Launcher
    install -D -m755 $srcdir/imprudence-experimental-secondlife.launcher \
        $pkgdir/usr/bin/imprudence-experimental-secondlife

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv imprudence-experimental-secondlife/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/imprudence-experimental-secondlife
    chmod -R g+r $pkgdir/opt/imprudence-experimental-secondlife

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/imprudence-experimental-secondlife/imprudence
}
