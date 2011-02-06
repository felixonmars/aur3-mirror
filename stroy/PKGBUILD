# Contributor: Cedric Chabanois <cchabanois@gmail.com>
pkgname=stroy
pkgver=1.0.3
pkgrel=1
pkgdesc="Stroy is a smart diff tool. It specializes in directories of files. Its differentiating feature is the ability to match files that have different names, locations, and content."
arch=('i686' 'x86_64')
url="http://stroy.wikidot.com/"
license=('MPL')
depends=('java-runtime')
source=(http://stroy.wikidot.com/local--files/download/$pkgname-xplatform-$pkgver.zip)
md5sums=('c23ec69d8f8cd71807ac739e6fc7dad0')

build() {
  cd "$startdir/src/$pkgname-1.0"
  install -d ${pkgdir}/usr/share/stroy
  install -d ${pkgdir}/usr/bin
  cp -R * ${pkgdir}/usr/share/stroy
  cat >${pkgdir}/usr/bin/stroy << EOC
java -jar /usr/share/stroy/stroy2ui.jar
EOC
  chmod 0755 ${pkgdir}/usr/bin/stroy
}
