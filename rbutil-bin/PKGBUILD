# Maintainer: qs9rx < that nick at enjoys döt it>
# Contributor: Slash <demodevil5 [at] yahoo [dot] com>
# Contributor: Diego Gaustein <firstname@lastname.com.ar>

pkgname=rbutil-bin
pkgver=1.3.1
pkgrel=1
url="http://www.rockbox.org/twiki/bin/view/Main/RockboxUtility"
pkgdesc="A Qt application for easily managing your Rockbox installation. (Binary Version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('fontconfig' 'glib2' 'libpng12' 'libsm' 'libusb' 'libxi' 'qt' 'libxrandr')
provides=('rbutil')
conflicts=('rbutil' 'rbutil-svn')
makedepends=()
if [ "$CARCH" = "x86_64" ]; then
    source=('rbutil-bin.desktop' "http://download.rockbox.org/rbutil/linux/RockboxUtility-v${pkgver}-64bit.tar.bz2")
    md5sums=('d46e111615b7c90bf50cad9bfa3dd3b5'
             '5462b5f5ebec4482623363de364abb3f')
else
    source=('rbutil-bin.desktop' "http://download.rockbox.org/rbutil/linux/RockboxUtility-v${pkgver}.tar.bz2")
    md5sums=('d46e111615b7c90bf50cad9bfa3dd3b5'
             '0a71dcfbed865b4915f38541bdf03311')
fi

build() {
    cd $srcdir;

    # Install Binary File
if [ "$CARCH" = "x86_64" ]; then
    install -Dm 755 $srcdir/RockboxUtility-v${pkgver}-64bit/RockboxUtility $pkgdir/usr/bin/RockboxUtility
else
    install -Dm 755 $srcdir/RockboxUtility-v${pkgver}/RockboxUtility $pkgdir/usr/bin/RockboxUtility
fi

    # Install Desktop File
    install -Dm 644 $srcdir/rbutil-bin.desktop $pkgdir/usr/share/applications/rbutil-bin.desktop
}


