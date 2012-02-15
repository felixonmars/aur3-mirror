# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=legends
pkgver=0.4.2.0
pkgrel=1
pkgdesc="Mulitplayer team-based first person shooter game, similar to Tribes"
url="http://www.legendsthegame.net"
license=('custom:Legends Freeware Software License')
arch=('i686' 'x86_64')
depends=('libxext' 'libogg' 'sdl' 'sdl_image' 'sdl_mixer' 'libpng' 'libjpeg' 'zlib' 'rsync')
install=
source=('legends.launcher' 'legends.desktop' \
"http://run.legendsthegame.net/legends_linux-${pkgver}.run")
md5sums=('bb76660c04c94690c3817c4821ff3b24'
         '4cd83521478cb4802ef3cd2ee72fc37f'
         '5188d8aad55b8aa71e10e414ba12ee6b')

build ()
{
    cd $srcdir

    # Create Destination Directory
    install -d $pkgdir/opt/

    # Unpack Files from Installer into src/legends/
    chmod +x $srcdir/legends_linux-${pkgver}.run
    ./legends_linux-${pkgver}.run --noexec --target $srcdir/legends/

    # Remove Junk from Game Directory
    rm $srcdir/legends/OPENAL32.DLL

    # Move Game Directory to Package Directory
    cp -r $srcdir/legends/ $pkgdir/opt/

    # Install Launcher
    install -D -m 755 $srcdir/legends.launcher \
        $pkgdir/usr/bin/legends

    # Install Desktop File
    install -D -m 644 $srcdir/legends.desktop \
        $pkgdir/usr/share/applications/legends.desktop

    # Install Icon File
    install -D -m 644 $pkgdir/opt/legends/legends.ico \
        $pkgdir/usr/share/pixmaps/legends.ico
}
