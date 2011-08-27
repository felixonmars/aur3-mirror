# Contributor: Martin Berkemeier <phobinator[at]googlemail[dot]de>

pkgname=secondlife-bin-kirstens
pkgver=20.37
_intpkgver="S20(37)"
pkgrel=1
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents (Kirstens binary version). Based on snowglobe 2.x"
url="http://www.kirstensviewer.com"
license=('GPL')
[ "$CARCH" = "i686"   ] && depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'libjpeg6' 'mesa' 'nss' 'sdl')
[ "$CARCH" = "x86_64" ] && depends=('alsa-lib' 'apr-util' 'lib32-freealut' 'gtk2' 'lib32-gtk2' 'libgl' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg6' 'lib32-libxdamage' 'mesa' 'lib32-mesa' 'lib32-nss' 'sdl')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('i686' 'x86_64')
install=kirstens_s20.install
source=('kirstens_s20.desktop' 'kirstens_s20.launcher' \
"http://www.kirstensviewer.com/script/download?file=%2FPublic%20Viewers%2FLinux%2FS20%2FKirstens-S20%2837%29-Linux-i686.tar.gz")
md5sums=('c3e4762769cdc75873c193d126cc55c0'
         '078d371d9a20f1cdf2cecbf443c35f66'
         '3935bea1f7f336ce893301130790bce5')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv "Kirstens-${_intpkgver}-Linux-i686/" kirstens_s20

    # Install Desktop File
    install -D -m644 $srcdir/kirstens_s20.desktop \
        $pkgdir/usr/share/applications/kirstens_s20.desktop

    # Install Icon File
    install -D -m644 $srcdir/kirstens_s20/secondlife_icon.png \
        $pkgdir/usr/share/pixmaps/kirstens_s20.png

    # Install Launcher
    install -D -m755 $srcdir/kirstens_s20.launcher \
        $pkgdir/usr/bin/kirstens_s20

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv kirstens_s20/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/kirstens_s20
    chmod -R g+rw $pkgdir/opt/kirstens_s20

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/kirstens_s20/Runme-kirstens-s20
}
