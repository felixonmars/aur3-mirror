# Maintainer: icasdri <icasdri@gmail.com>

pkgname=netplot
pkgver=1.0
pkgrel=5
pkgdesc="A network latency monitoring tool written in Java"
arch=('i686' 'x86_64')
url="http://goldb.org/netplot.html"
license=('GPL2')
depends=('java-environment')
makedepends=('apache-ant')
source=("http://goldb.org/misc/$pkgname.zip"
        "netplot-run.sh"
        "NetPlot.patch")
sha256sums=('77a67155c28470d76a72d839526a844af45674780a0b7badf1c99f58ac9eb0fe'
            'e381ab169b1fd63ac02d84f088a9296f513ca924765b0aa1e8aeaa360eaba65f'
            'ca12c66406f15bd699f13ddcd4937fb7cafc0b7e32689e9dbe93b58e06b46e41')

build() {
  cd $pkgname
  # Remove pre-built binaries
  rm -r build
  # Remove unnecessary libraries (will be patched into source below)
  rm "src/lib/skinlf.jar"
  rm "src/lib/toxicthemepack.zip"
  # Patch the main class to use GTK theming (instead of custom theme)
  patch "src/NetPlot.java" < ../NetPlot.patch
  # Intiate ANT build!
  ant
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 ./netplot-run.sh "$pkgdir/usr/bin"
  mv "$pkgdir/usr/bin/netplot-run.sh" "$pkgdir/usr/bin/netplot"
  cd $pkgname
  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r ./build/. "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ft=sh syn=sh
