# Contributor: Artificial Intelligence <polarbeard@gmail.com>

pkgname=bulletcandyperfect-demo
pkgver=1.00
pkgrel=1
pkgdesc="Bullet Candy Perfect is a fun shoot-em-up game, with sharp, super smooth 3D graphics and a cool techno soundtrack. The game is all about honing your skills to perfection as you attempt the perfect run!"
arch=('i686' 'x86_64')
url='http://www.charliesgames.com/wordpress/?page_id=203'
license=('custom: "commercial"')
install=bulletcandyperfect-demo.install
if [ "$CARCH" = "x86_64" ]; then
        depends=('lib32-freetype2' 'lib32-libxxf86vm' 'lib32-mesa' 'lib32-libxrandr' 'lib32-gcc-libs')
else
        depends=('freetype2' 'libxxf86vm' 'mesa' 'libxrandr' 'gcc-libs')
fi
source=("http://www.charliesgames.com/demo/BulletCandyPerfectLinuxDemo.tar.gz"
'BulletCandyPerfect-demo.png'
'bulletcandyperfect-demo.desktop'
'bulletcandyperfect-demo.launcher')
md5sums=('7376537774911c379514dbe8ab0d5617' '6c6691e00f414625bd564519c4a7064b' '0a2feb400b1518ab3956bd5e2ba1ca42' 'c5d8fee25dfb87d59b1839d43b2f6909')


build() {
    cd $srcdir || return 1

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/BulletCandyPerfect-demo || return 1

# Extract Game 
    bsdtar -xf $srcdir/BulletCandyPerfectLinuxDemo.tar.gz || return 1

            cd $srcdir/BulletCandyPerfectLinuxDemo || return 1
            cp -r "Bullet Candy Perfect Demo" $srcdir/BulletCandyPerfectLinuxDemo/BulletCandyPerfect-demo || return 1
            rm -r "Bullet Candy Perfect Demo" || return 1

    cd $srcdir || return 1

# Install the data
    cp -r $srcdir/BulletCandyPerfectLinuxDemo/* $pkgdir/opt/BulletCandyPerfect-demo || return 1

# Install Icon
    install -D -m 644 $srcdir/BulletCandyPerfect-demo.png \
        $pkgdir/usr/share/pixmaps/BulletCandyPerfect-demo.png || return 1
    
# Install Launcher
    install -D -m 644 $srcdir/bulletcandyperfect-demo.desktop \
        $pkgdir/usr/share/applications/bulletcandyperfect-demo.desktop || return 1

# Install Game Launcher
    install -D -m 755 $srcdir/bulletcandyperfect-demo.launcher \
        $pkgdir/usr/bin/bulletcandyperfect-demo || return 1

# Set groupship to :games
    chown -R :games $pkgdir/opt/BulletCandyPerfect-demo || return 1
    chmod -R g+rwX $pkgdir/opt/BulletCandyPerfect-demo || return 1


}