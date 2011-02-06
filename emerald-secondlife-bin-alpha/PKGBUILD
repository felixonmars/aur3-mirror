# Contributor: Martin Berkemeier <phobinator[at]googlemail[dot]de>

pkgname=emerald-secondlife-bin-alpha
pkgver=1.4.0.2439
pkgrel=1
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Emerald is alternative viewer(alpha based on snowglobe)"
url="http://modularsystems.sl/"
license=('GPL')
[ "$CARCH" = "i686"   ] && depends=('alsa-lib' 'apr-util' 'gtk2' 'libgl' 'libidn' 'libjpeg6' 'mesa' 'nss' 'sdl')
[ "$CARCH" = "x86_64" ] && depends=('alsa-lib' 'apr-util' 'lib32-dbus-glib' 'lib32-freealut' 'gtk2' 'lib32-gtk2' 'libgl' 'lib32-libgl' 'lib32-libidn' 'lib32-libjpeg6' 'lib32-libxdamage' 'mesa' 'lib32-mesa' 'lib32-nss' 'sdl')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('i686' 'x86_64')
conflicts=('emerald-secondlife-bin')
install=emerald-secondlife.install
# source=('emerald-secondlife.desktop' 'emerald-secondlife.launcher' \
# "http://modularsystems.sl/box/Emerald_Viewer-i686-${pkgver}.tar.bz2")
source=('emerald-secondlife.desktop' 'emerald-secondlife.launcher' \
"http://modularsystems.sl/box/EmeraldViewer-i686-${pkgver}.tar.bz2")
md5sums=('1023dd352c15891e6bee667610543986'
         '42cd486f66ce9470c6f3a2b59d1f06a9'
         'dc43f88315b0cb094699f7fefb82cb64')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv EmeraldViewer-i686-${pkgver}/ Emerald-secondlife

    # Install Desktop File
    install -D -m644 $srcdir/emerald-secondlife.desktop \
        $pkgdir/usr/share/applications/emerald-secondlife.desktop

    # Install Icon File
    install -D -m644 $srcdir/Emerald-secondlife/snowglobe_icon.png \
        $pkgdir/usr/share/pixmaps/emerald-secondlife.png

    # Install Launcher
    install -D -m755 $srcdir/emerald-secondlife.launcher \
        $pkgdir/usr/bin/emerald-secondlife

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv Emerald-secondlife/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/Emerald-secondlife
    chmod -R g+rw $pkgdir/opt/Emerald-secondlife
#    chmod -R g+r $pkgdir/opt/Emerald-secondlife
    chmod g+w $pkgdir/opt/Emerald-secondlife/bin
    chmod g+w $pkgdir/opt/Emerald-secondlife/lib

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/Emerald-secondlife/snowglobe
}

