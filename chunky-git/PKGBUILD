# Maintainer: Frederik "Freso" S. Olesen <archlinux@freso.dk>
_pkgname=chunky
pkgname=${_pkgname}-git
pkgver=1.3.4.r11.g5596945
pkgrel=1
pkgdesc='A Minecraft mapping and rendering tool.'
arch=('any')
url='http://chunky.llbit.se/'
license=('GPL3')
depends=('java-runtime')
makedepends=('git' 'apache-ant' 'java-environment')
optdepends=(
  'minecraft: The game itself.'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('chunky-bzr')
changelog=ChangeLog
source=(
  "git+https://github.com/llbit/${_pkgname}.git"
  "chunky.desktop"
  'chunky.sh')
md5sums=('SKIP'
         '47b860897c6f47a36911f648d2bb6949'
         '1c220e3ab665994276097eb2bbc37f83')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  ant build gendoc package
}

package() {
  cd "$srcdir/$_pkgname"
  _version=$(git describe --long | sed -r 's/^v//')

  install -d "$pkgdir/usr/share/doc/$_pkgname"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" build/ReadMe.html "build/release_notes-${_version}.txt"

  install -vDm644 "build/chunky-${_version}.jar" "$pkgdir/usr/share/java/$_pkgname/chunky.jar"
  install -vDm644 'dist/chunky-dmg.png' "$pkgdir/usr/share/pixmaps/chunky.png"
  install -vDm755 "$srcdir/chunky.sh" "$pkgdir/usr/bin/chunky"
  install -vDm644 "$srcdir/chunky.desktop" "$pkgdir/usr/share/applications/chunky.desktop"
}

# vim:set ts=2 sw=2 et:
