# Contributor: Artificial Intelligence <polarbeard@gmail.com>
# Maintainer: Ben Reedy <thebenj88 *AT* gmail *DOT* com>

pkgname=droid-assault
pkgver=1.81
pkgrel=1
pkgdesc="Play Droid Assault and experience running Star Wars style blaster battles with hordes of rampaging killer robots! Discover a unique tactical arcade shooter, with the fun addictive gameplay of classics like Paradroid and Quazatron. "
arch=('i686' 'x86_64')
url='http://www.puppygames.net/droid-assault/'
license=('custom: "shareware"')
install=droidassault.install
depends=('openjdk6' 'openal')
source=("http://www.puppygames.net/applets/droidassault.jnlp"
'DroidAssault.png'
'droidassault.desktop'
'droidassault.launcher')
md5sums=('66ef9b36fce429848c1390add5f8c077'
         '35b9fcd4dd2147f618354fd78188f1d8'
         '7a6edda8aba6bd886b98ea358c4ed80f'
         '8457048d3d5ae30d226f4d139ed2388d')

 
package() {
    cd $srcdir 

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/DroidAssault

# Install the data
    install -D -m 755 $srcdir/droidassault.jnlp $pkgdir/opt/DroidAssault/droidassault.jnlp

# Install Icon
    install -D -m 644 $srcdir/DroidAssault.png \
        $pkgdir/usr/share/pixmaps/DroidAssault.png

# Install Launcher
    install -D -m 644 $srcdir/droidassault.desktop \
        $pkgdir/usr/share/applications/droidassault.desktop

# Install Game Launcher
    install -D -m 755 $srcdir/droidassault.launcher \
        $pkgdir/usr/bin/droidassault

}
