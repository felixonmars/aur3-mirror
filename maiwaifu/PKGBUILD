# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ShionjiYuuko <eien.mihoshi@gmail.com>
pkgname=maiwaifu
pkgver=0.13
pkgrel=1
epoch=
pkgdesc="adobe-air based virtual desktop waifu (or husbando) app"
arch=('i686' 'x86_64')
url="http://maiwaifuapp.wordpress.com"
license=('custom')
groups=()
depends=('adobe-air')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://tohno-chan.com/ddl/src/maiWaifubv013.zip $pkgname.sh)
noextract=()
md5sums=('02e67850a3a71cdd1957bde5b9b28f53'
         '9b4987214e64b248a58496ba01cd12ed') #generate with 'makepkg -g'

build() {
  cd $srcdir/
  #unzip maiWaifubv013.zip
}

package() {
  cd $srcdir/
  install -d $pkgdir/{usr/bin,opt/$pkgname}
  install maiWaifubv013.air $pkgdir/opt/$pkgname/maiWaifu.air
  install -m755 $pkgname.sh $pkgdir/usr/bin/maiWaifu
}

# vim:set ts=2 sw=2 et:
