# Contributor: Artificial Intelligence <polarbeard@gmail.com>
# Contributor: wido <widomaker2k7 [at] gmail [dot] com>
# Maintainer: gururise <gururise@gmail.com>

pkgname=titanattacks
pkgver=2.00.3
pkgrel=3
pkgdesc="The gameplay is heavily inspired by Space Invaders with upgradeable ship and weapons."
arch=('i686' 'x86_64')
url='http://www.puppygames.net/titan-attacks/'
license=('custom: "shareware"')
install=titanattacks.install
depends=('java-runtime' 'openal')
ARCH=i386
[ "$CARCH" = "x86_64" ] && ARCH=amd64
source=("http://d4ec1k3inlcla.cloudfront.net/TitanAttacks-${ARCH}.tar.gz"
'titanattacks.desktop'
'titanattacks.launcher')
md5sums=('47dc6692f2c4f15d1c3d5bc2028d71ed'
         '20694ddc7b4f59a9838f5de7499742de'
         '209101a8a0c6d985ea30572902c4be55')


[ "$CARCH" = "x86_64" ] && md5sums=('1da5806fd5d6be5a9cbffb583a3bc019'
         '20694ddc7b4f59a9838f5de7499742de'
         '209101a8a0c6d985ea30572902c4be55')

package() {
    cd $srcdir

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/titanattacks

# Install the data
    cp -R ${srcdir}/titanattacks/ ${pkgdir}/opt/

# Install Launcher
    install -D -m 644 $srcdir/titanattacks.desktop \
        $pkgdir/usr/share/applications/titanattacks.desktop

# Install Game Launcher
    install -D -m 755 $srcdir/titanattacks.launcher \
        $pkgdir/usr/bin/titanattacks

}
