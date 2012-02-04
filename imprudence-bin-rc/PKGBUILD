# Contributor: lolman <j[dot]r[dot]brennand[at]gmail[dot]com>

pkgname=imprudence-bin-rc
pkgver=1.1.0_rc2
pkgrel=1
_pkgver=1.1.0-RC2
pkgdesc="Imprudence viewer for the Second Life virtual world (Binary Release Candidate version)."
url="http://www.imprudenceviewer.org/"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'mesa' 'nss' 'sdl')
arch=('i686')
conflicts=('imprudence-bin')
provides=('imprudence-bin')
install=imprudence.install
source=('imprudence.desktop' 'imprudence.launcher' \
"http://imprudenceviewer.org/download/candidates/Imprudence-$_pkgver.tar.bz2")
md5sums=('64cea3e27b8f6b153a1f49521021ed64 
	  942cc37b820ff64096f1dab1d4f673d4 
	  476e61524f0e694af478d7e2087a8de5')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Imprudence-$_pkgver/ imprudence

    # Install Desktop File
    install -D -m644 $srcdir/imprudence.desktop \
        $pkgdir/usr/share/applications/imprudence.desktop

    # Install Icon File
    install -D -m644 $srcdir/imprudence/imprudence_icon.png \
        $pkgdir/usr/share/pixmaps/imprudence.png

    # Install Launcher
    install -D -m755 $srcdir/imprudence.launcher \
        $pkgdir/usr/bin/imprudence

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv imprudence/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/imprudence
    chmod -R g+rw $pkgdir/opt/imprudence

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/imprudence
}
