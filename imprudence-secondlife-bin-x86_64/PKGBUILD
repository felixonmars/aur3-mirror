# Contributor: Martin Berkemeier <phobinator[at]googlemail[dot]de>

pkgname=imprudence-secondlife-bin-x86_64
pkgver=1.3.2
pkgrel=1
#_pkgrel=RC3
_arch=x86_64
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Imprudence is alternative viewer(native 64bit)"
url="http://blog.kokuaviewer.org"
license=('GPL')
depends=('alsa-lib' 'apr-util' 'freealut' 'gnome-vfs' 'gtk2' 'libgl' 'libidn' 'libjpeg6' 'libpng12' 'mesa' 'nss' 'sdl')
# [ "$CARCH" = "x86_64" ] && depends=('lib32-freealut' 'lib32-gtk2'
# 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg6' 'libpng12' 'lib32-libxdamage' 'lib32-mesa' 'lib32-nss')
# [ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('x86_64')
conflicts=('imprudence-secondlife-bin')
install=imprudence-secondlife.install
source=('imprudence-secondlife.desktop' 'imprudence-secondlife.launcher' \
"http://imprudence.googlecode.com/files/Imprudence-${pkgver}-Linux-${_arch}.tar.bz2")
md5sums=('ac7422e51eefdeb2f11910e36ad0d2d2'
         '7d656225184e49679b6ab82fb7f79b55'
         '767ddb394cb52102014c0267a92fc6fb')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Imprudence-${pkgver}-Linux-${_arch}/ imprudence-secondlife

    # Install Desktop File
    install -D -m644 $srcdir/imprudence-secondlife.desktop \
        $pkgdir/usr/share/applications/imprudence-secondlife.desktop

    # Install Icon File
    install -D -m644 $srcdir/imprudence-secondlife/imprudence_icon.png \
        $pkgdir/usr/share/pixmaps/imprudence_icon.png

    # Install Launcher
    install -D -m755 $srcdir/imprudence-secondlife.launcher \
        $pkgdir/usr/bin/imprudence-secondlife

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv imprudence-secondlife/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/imprudence-secondlife
#    chmod -R g+rw $pkgdir/opt/imprudence-secondlife
    chmod -R g+r $pkgdir/opt/imprudence-secondlife

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/imprudence-secondlife/imprudence
}

