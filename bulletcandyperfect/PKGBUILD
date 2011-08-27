# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=bulletcandyperfect
pkgver=1.00
pkgrel=2
pkgdesc="Bullet Candy Perfect is a fun shoot-em-up game, with sharp, super smooth 3D graphics and a cool techno soundtrack. The game is all about honing your skills to perfection as you attempt the perfect run!"
arch=('i686' 'x86_64')
url='http://www.charliesgames.com/wordpress/?page_id=203'
license=('custom: "commercial"')
install=bulletcandyperfect.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-libxrandr' 'lib32-gcc-libs')
else
        depends=('freetype2' 'libxxf86vm' 'mesa' 'libxrandr' 'gcc-libs')
fi
source=('BulletCandyPerfectLinuxFull.tar.gz' 'BulletCandyPerfect.png' 'bulletcandyperfect.desktop' 'bulletcandyperfect.launcher')
md5sums=('9275f2806dceac2011afb71332980874' '6c6691e00f414625bd564519c4a7064b' '322dc8fc2713246b9eee3ddce6f31907' 'e43ef0638d57de822ba4786e595f3e2e')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/BulletCandyPerfect || return 1

# Extract Game 
    bsdtar -xf $srcdir/BulletCandyPerfectLinuxFull.tar.gz || return 1

           cd $srcdir/BulletCandyPerfectLinuxFull || return 1
           cp -r "Bullet Candy Perfect" $srcdir/BulletCandyPerfectLinuxFull/BulletCandyPerfect || return 1
           rm -r "Bullet Candy Perfect" || return 1

    cd $srcdir || return 1

# Install the data
    cp -r $srcdir/BulletCandyPerfectLinuxFull/* $pkgdir/opt/BulletCandyPerfect || return 1

# Install Icon
    install -D -m 644 $srcdir/BulletCandyPerfect.png \
        $pkgdir/usr/share/pixmaps/BulletCandyPerfect.png || return 1

# Install Launcher
    install -D -m 644 $srcdir/bulletcandyperfect.desktop \
        $pkgdir/usr/share/applications/bulletcandyperfect.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/bulletcandyperfect.launcher \
        $pkgdir/usr/bin/bulletcandyperfect || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/BulletCandyPerfect || return 1
    chmod -R g+rwX $pkgdir/opt/BulletCandyPerfect || return 1


}