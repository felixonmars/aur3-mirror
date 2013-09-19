# Maintainer: Buce <dmbuce@gmail.com>

pkgname=mmat-git
pkgver=0.25.69adce0
pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always )"
}
pkgrel=2
pkgdesc="Delete unecessary minecraft chunks."
arch=(any)
url="https://github.com/hwei/Minecraft-Map-Auto-Trim"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('git' 'findutils' 'java-environment')
provides=(mmat)
conflicts=(mmat)
replaces=()
source=("$pkgname::git://github.com/hwei/Minecraft-Map-Auto-Trim.git")
md5sums=(SKIP)

build() {
  cd "$srcdir/$pkgname"

  pushd src
  javac $(find . -name \*.java)
  jar -cvfe "../mmat.jar" me.hwei.mctool.MapAutoTrim $(find . -name \*.class)
  popd

  ( echo "#!$(which java) -jar" ; cat mmat.jar ) > mmat
}

package() {
  cd "$srcdir/$pkgname"
  install -D -m755 mmat "$pkgdir/usr/bin/mmat"
}

# vim:set ts=2 sw=2 et:
