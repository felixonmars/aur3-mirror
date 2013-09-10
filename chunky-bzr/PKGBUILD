# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
pkgname=chunky-bzr
pkgver=1.1.2
pkgrel=1
_pkgname=chunky
_bzrname=$_pkgname
_bzrbranch=$_bzrname-1.1
pkgdesc='A Minecraft mapping and rendering tool.'
arch=('any')
url='http://chunky.llbit.se/'
license=('GPL3')
depends=('java-runtime')
makedepends=('bzr' 'apache-ant' 'java-environment')
optdepends=(
  'minecraft: The game itself.'
)
provides=('chunky')
changelog=ChangeLog
source=(
  "$_bzrname::bzr+http://bazaar.launchpad.net/~jesper-oqvist/$_bzrname/$_bzrbranch/"
  "chunky.desktop"
)
md5sums=('SKIP'
         '88d8c8cca805047ce10e20774b6cbc8a')

pkgver() {
  cd "$srcdir/chunky"
  #TODO: Use ant or something to determine the latest version (e.g., 1.1.2).
  echo "1.1.2.$(bzr revno)"
}

build() {
  cd "$srcdir/chunky"
  ant jar
  
  cp Chunky.sh ../
  sed -i "s|Chunky\.jar|/usr/share/java/$_pkgname/Chunky\.jar|" ../Chunky.sh
}

package() {
  cd "$srcdir/chunky"

  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" ./*.txt Chunky.bat Chunky.sh

  install -vDm644 'build/Chunky.jar'     "$pkgdir/usr/share/java/$_pkgname/Chunky.jar"
  install -vDm755 '../Chunky.sh'         "$pkgdir/usr/bin/chunky"
  install -vDm644 'bin/chunky.png'       "$pkgdir/usr/share/pixmaps/chunky.png"
  install -vDm644 '../chunky.desktop'    "$pkgdir/usr/share/applications/chunky.desktop"
}

# vim:set ts=2 sw=2 et:
