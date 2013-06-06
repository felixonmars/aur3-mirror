# Contributor: Artificial Intelligence <polarbeard@gmail.com>
# Maintainer: flow

pkgname=ultratron
pkgver=3.02.3
pkgrel=1
pkgdesc="Intense shoot-em-up with 100% pure frenzied gameplay."
arch=('i686' 'x86_64')
url='http://www.puppygames.net/ultratron/'
license=('custom: "shareware"')
install=ultratron.install
depends=('java-runtime' 'openal')
source=("http://downloads.puppygames.net/Ultratron.tar.gz"
'ultratron.desktop'
'ultratron.launcher')
md5sums=('9cf47d7178e0bb4df58c0b4b3b9e5cc9'
         'fa0fc954c3b6308a894f44482913b44c'
         '82b00c90a01ce3af4f51618ef56c9792')

package() {
    cd $srcdir

# Create Destination Directory
    install -d -m 755 $pkgdir/opt/ultratron

# Install the data
    cp -R ${srcdir}/ultratron/* ${pkgdir}/opt/ultratron/

# Install Launcher
    install -D -m 644 $srcdir/ultratron.desktop \
        $pkgdir/usr/share/applications/ultratron.desktop

# Install Game Launcher
    install -D -m 755 $srcdir/ultratron.launcher \
        $pkgdir/usr/bin/ultratron

}
