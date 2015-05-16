# Contributor: Rorschach <r0rschach@lavabit.com>
# Contributor: LinuxUser <theo@nordlogix.com>

pkgname=eboard-extras
pkgver=2.0
pkgrel=3
pkgdesc="Contains both offical extra sets for eboard. They offer additional graphics and sounds."
url="http://www.bergo.eng.br/eboard/"
arch=('i686' 'x86_64')
license="GPL"
depends=('eboard' )
source=(http://prdownloads.sourceforge.net/eboard/eboard-extras-1pl2.tar.gz http://prdownloads.sourceforge.net/eboard/eboard-extras-2.tar.gz)
md5sums=('d5fb7a541d9ef5f6d1d565d877b1ab9a' 'e0994803fdd2b3c6b2367efeaa841a34')
install=eboard-extras.install

_pkg1=1pl2
_pkg2=2

build() {
  true
}

package() {
  mkdir -p $pkgdir/usr/share/eboard/

  cp  $pkgname-$_pkg1/*.png $pkgdir/usr/share/eboard/
  cp  $pkgname-$_pkg1/*.wav $pkgdir/usr/share/eboard/
  cp  $pkgname-$_pkg1/extras1.conf $pkgdir/usr/share/eboard/themeconf.extras1

  cp  $pkgname-$_pkg2/*.png $pkgdir/usr/share/eboard/
  cp  $pkgname-$_pkg2/*.wav $pkgdir/usr/share/eboard/
  cp  $pkgname-$_pkg2/extras2.conf $pkgdir/usr/share/eboard/themeconf.extras2
}
