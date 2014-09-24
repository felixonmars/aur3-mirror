# Maintainer: Gently <toddrpartridge@gmail.com>

pkgname=genscripts
pkgver=0.82
pkgrel=2
pkgdesc="General utility scripts."
arch=("any")
url="https://github.com/Gen2ly/genscripts"
license=("GPL2")
depends=("bash")
makedepends=("git")
install=
changelog=
source=("git://github.com/Gen2ly/genscripts")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/$pkgname
  git describe | sed 's/^v//;s/-.*//'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
  install -Dm755 bckfile     "$pkgdir"/usr/bin/bckfile
  install -Dm755 bgcmd       "$pkgdir"/usr/bin/bgcmd
  install -Dm755 del         "$pkgdir"/usr/bin/del
  install -Dm755 dirsize     "$pkgdir"/usr/bin/dirsize
  install -Dm755 gurl        "$pkgdir"/usr/bin/gurl
  install -Dm755 lnk         "$pkgdir"/usr/bin/lnk
  install -Dm755 pack        "$pkgdir"/usr/bin/pack
  install -Dm755 rps         "$pkgdir"/usr/bin/rps
  install -Dm755 sortwords   "$pkgdir"/usr/bin/sortwords
  install -Dm755 termcolors  "$pkgdir"/usr/bin/termcolors
  install -Dm755 tock        "$pkgdir"/usr/bin/tock
  install -Dm755 turl        "$pkgdir"/usr/bin/turl
  install -Dm755 unpack      "$pkgdir"/usr/bin/unpack
}

# vim:set ts=2 sw=2 et:
