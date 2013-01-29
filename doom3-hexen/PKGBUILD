# Contributor: Artiom MOLCHANOV <ar.molchanov@gmail.com>

pkgname=doom3-hexen
pkgver=0.99
pkgrel=2
pkgdesc="heXen:Edge of Chaos based on the original Hexen game that was developed by id Software and Raven Software."
url="http://hexenmod.net/"
license=('custom')
arch=('i686' 'x86_64')
depends=('doom3')
makedepends=('unzip')
# Download: http://www.moddb.com/downloads/start/27944
# or : http://www.moddb.com/mods/hexen-edge-of-chaos/downloads/hexen-edge-of-chaos-demo-release
source=('http://win.doomitalia.it/doom3/mods/hexen_edge_of_chaos_demo.zip' 'doom3-hexen.desktop' 'doom3-hexen.launcher')
_src='eoc'
md5sums=('a7c51694a2c3bf58840b9e40bb36eb4e'
         '47fb704d97ff7a84b50ffb930bc3c127'
         '6a8eebe5e5b86e5cac64438dfdc62e64')
	  
build() {
    cd $srcdir
    find . -type f -exec chmod -x {} \;
    # Create Destination Directories
    install -d $startdir/pkg/{usr/bin/,opt/doom3/}

    # Remove Unneeded Files
    rm $srcdir/$_src/*.bat

    # Move Icon
    mv $srcdir/$_src/Hexen_Icon.ico $srcdir/doom3-hexen.ico

    # Move License
    mv $srcdir/$_src/LICENSE.TXT $startdir/src/License.txt

    # Move Data to Destination Directory
    mv $srcdir/$_src $startdir/pkg/opt/doom3/

    # Install Launcher (Client)
    install -D -m 755 $startdir/src/doom3-hexen.launcher \
        $startdir/pkg/usr/bin/doom3-hexen

    # Install License
    install -D -m 644 $startdir/src/License.txt \
        $startdir/pkg/usr/share/licenses/$pkgname/License.txt

    # Install Icon
    install -D -m 644 $startdir/src/doom3-hexen.ico \
        $startdir/pkg/usr/share/pixmaps/doom3-hexen.ico

    # Install Desktop File
    install -D -m 644 $startdir/src/doom3-hexen.desktop \
        $startdir/pkg/usr/share/applications/doom3-hexen.desktop
}
