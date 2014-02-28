# Grimoire-Cli PKGBUILD 2013/11/11 Written by BOXP
#!/bin/sh
pkgname="grimoire"
pkgver=20140227
pkgrel=1
pkgdesc="A Clojure-based S-expression twitter client on JavaFx"
arch=('any')
url="http://archbox.dip.jp/works/grimoire"
license=('EPL')
depends=('jdk>=7.00')
optdepends=('growl-for-linux: toast support')
makedepends=('unzip')
source=('http://archbox.dip.jp/works/grimoire/Grimoire.zip')
noextract=('Grimoire.zip')
md5sums=('e70977e0cc6af964945ff494eb3ab662')

prepare() {
  unzip Grimoire.zip
}

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/opt/Grimoire
  cp Grimoire/grimoire ${pkgdir}/usr/bin/
  cp -rf Grimoire/* ${pkgdir}/opt/Grimoire
  chmod +x ${pkgdir}/usr/bin/grimoire
}
