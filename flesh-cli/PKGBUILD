# Contributor: Rasmus <rasmus dot pank at gmail dot com>

pkgname=flesh-cli
pkgver=2.0
pkgrel=3
pkgdesc="application designed to quickly analyze a document and display 
         the difficulty associated with comprehending it"
arch=('i686' 'x86_64')
url="http://flesh.sourceforge.net/"
depends=('java-runtime')
license=('GPL')
source=(http://downloads.sourceforge.net/flesh/Flesh-Command--Line.zip
	flesh-cli.sh)
md5sums=('4723d79ee3dfd4d87a74f1fca4dbbd11'
         '946097def286b1600ffb0ffc72f68be2')

build() {
  cd $$srcdir
  install -D -m755 flesh-cli.sh $pkgdir/usr/bin/flesh-cli
  install -D -m644 CmdFlesh.jar $pkgdir/usr/share/java/cmdflesh.jar
}
