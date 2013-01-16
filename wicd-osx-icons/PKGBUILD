pkgname=wicd-osx-icons
pkgver=0.1
pkgrel=1
arch=('any')
pkgdesc="Mac OSX-like icons for WICD network manager"
depends=('wicd-gtk')
url="http://maththias.deviantart.com/art/Faenza-Wicd-Iconset-183102684"
license=('GNU/GPL')
source=('http://dl.dropbox.com/u/9392454/wicd-osx.tar.gz')
md5sums=('147257560032a0dd798ce42a14b72658')
install="osx-wicd.install"

package() {

rm -rf $srcdir/wicd-osx.tar.gz
mkdir -p $pkgdir/usr/share/pixmaps/wicd
cp $srcdir/wicd-osx/* $pkgdir/usr/share/pixmaps/wicd -Rf


}
