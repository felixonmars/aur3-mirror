# Contributor: Chaniyth

pkgname=snowglobe-bin
pkgver=1.4.2.3626
pkgrel=1
pkgdesc="Snowglobe is an open source Second Life-compatible viewer, built jointly by the open source community and Linden Lab. (Binary version)."
arch=('i686' 'x86_64')
url="http://www.secondlife.com/"
license=('GPL')
[ "$CARCH" = "i686"   ] && depends=('alsa-lib' 'apr-util' 'freealut' 'gtk2' 'libgl' 'libidn' 'libjpeg6' 'mesa' 'nss' 'sdl')
[ "$CARCH" = "x86_64" ] && depends=('alsa-lib' 'apr-util' 'lib32-atk'  'lib32-freealut' 'lib32-gtk2' 'libgl' 'lib32-libidn' 'lib32-libjpeg6' 'lib32-libxinerama' 'mesa' 'lib32-nss' 'sdl')
conflicts=('secondlife' 'secondlife-svn' 'secondlife-rc')
install=snowglobe.install
source=('snowglobe.desktop' 'snowglobe.launcher' \
"http://secondlife.com/developers/opensource/downloads/2009/1.4/3626/Snowglobe-i686-${pkgver}.tar.bz2")
md5sums=('c3e902258440b632b98d77af278533d6'
         '7910a28a5ebe9babd990b21a128531fd'
         'fe39b18edd88b677554dccf8b78d0b48')

build() {
    cd $srcdir;

    # Rename Data Directory
    mv Snowglobe-i686-${pkgver}/ snowglobe

    # Install Desktop File
    install -D -m644 $srcdir/snowglobe.desktop \
        $pkgdir/usr/share/applications/snowglobe.desktop

    # Install Icon File
    install -D -m644 $srcdir/snowglobe/snowglobe_icon.png \
        $pkgdir/usr/share/pixmaps/snowglobe.png

    # Install Launcher
    install -D -m755 $srcdir/snowglobe.launcher \
        $pkgdir/usr/bin/snowglobe

    # Move Data to Destination Directory
    install -d $pkgdir/opt/
    mv snowglobe/ $pkgdir/opt/

    # Change Permissions of files to root:games
    chown -R root:games $pkgdir/opt/snowglobe
    chmod -R g+rw $pkgdir/opt/snowglobe

    # Make Binary Group-Executable
    chmod g+x $pkgdir/opt/snowglobe/snowglobe
}
