# Contributor: H.Gökhan SARI <th0th@returnfalse.net>
pkgname=gtmess-sounds
pkgver=0.97
pkgrel=1
pkgdesc="Sounds for gtmess."
arch=('i686')
url="http://gtmess.sourceforge.net/"
license=('GPL')
depends=()
source=('http://downloads.sourceforge.net/project/gtmess/gtmess-snd/default/gtmess-snd-default.tar.gz')
md5sums=('2f372e3e0bac3746c31454d236c89d79')

build() {
  mkdir -p $pkgdir/usr/share/gtmess/snd
  cp -R $startdir/src/snd/ $pkgdir/usr/share/gtmess/
  msg "#"
  msg "Beware: You should run gtmess with -Osnd=2 parameter to use sounds. You'd better define an alias."
  msg "#"
}
