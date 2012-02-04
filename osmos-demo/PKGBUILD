# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=osmos-demo
pkgver=1.6.0
pkgrel=3
pkgdesc="Enter the ambient world of Osmos: elegant, physics-based gameplay, dreamlike visuals, and a minimalist, electronic soundtrack."
arch=('i686' 'x86_64')
url='http://www.hemispheregames.com/Osmos/'
license=('custom: "commercial"')
install=osmos-demo.install
depends=('freetype2' 'openal' 'mesa' 'libvorbis')
source=("http://www.hemispheregames.com/latest_osmos_demo_linux_targz"
'osmos-demo.desktop'
'osmos-demo.launcher')
md5sums=('3ba2ebd3b187c4b2d3a841546b27c7d8' '5a893d9e6847f063dbb854570ea60ea6' '59fa1a05a191734f7185c8285434c471')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d $pkgdir/opt/Osmos-demo || return 1

# Extract Game 
    tar zxfv $srcdir/latest_osmos_demo_linux_targz || return 1

# Install the data
    cp -r $srcdir/OsmosDemo/* $pkgdir/opt/Osmos-demo || return 1

# Install Icon
    install -D -m 644 $pkgdir/opt/Osmos-demo/Icons/128x128.png \
        $pkgdir/usr/share/pixmaps/Osmos-demo.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/osmos-demo.desktop \
        $pkgdir/usr/share/applications/osmos-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/osmos-demo.launcher \
        $pkgdir/usr/bin/osmos-demo || return 1

}