#maintainer: Guan 'kuno' Qing <neokuno AT gmail DOT com>

pkgname=visulization
pkgver=1.05
pkgrel=1
pkgdesc="Data structure visulization tool."
arch=('i686' 'x86_64')
url="http://www.cs.usfca.edu/~galles/visualization/"
license=('GPL')
groups=()
depends=('java-runtime')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
#install=
source=(http://www.cs.usfca.edu/~galles/visualization/visualization.jar
        visulization)
noextract=()


package() {
  install -Dm644 $srcdir/visualization.jar $pkgdir/usr/share/java/visulization/visulization.jar || return 1
  install -Dm755 $srcdir/visulization $pkgdir/usr/bin/visulization || return 1
}
md5sums=('e1cf6fcd7fbf1ef38a2e64620463de3c'
         'f4b3f2c86f782aea46ae50610e014c9f')
