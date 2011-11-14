# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=familyfarm
pkgver=1.3.4
pkgrel=1
pkgdesc="tycoon game in the setting of 19th century farmsteads (full)"
arch=('i686' 'x86_64')
url="http://www.familyfarmgame.com"
license=("commercial")
source=('FamilyFarm.Release.tgz')
md5sums=('ee50ea56917d334bf078c53c84b0df9d')
options=(!strip)

build() {
true
}

package() {
  mkdir -p $pkgdir/usr/{share/familyfarm,bin}
  cd $srcdir/${pkgname}
  /bin/tar cf - * | ( cd ../../pkg/usr/share/familyfarm/; tar xfp - )
  sed -i -e 's:%%exepath%%:/usr/bin/familyfarm:' -e 's:%%iconpath%%:/usr/share/familyfarm/ui/GLX_icon.png:' scripts/FamilyFarm.desktop
  sed -i 's/prog_dir=.*/prog_dir=$(dirname $(readlink -f $0))/' ${pkgdir}/usr/share/familyfarm/FamilyFarm.sh
  install -D -m644 scripts/FamilyFarm.desktop ${pkgdir}/usr/share/applications/familyfarm.desktop
  ln -s /usr/share/familyfarm/FamilyFarm.sh ${pkgdir}/usr/bin/familyfarm
}
