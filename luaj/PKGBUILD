pkgname=luaj
pkgver=3.0
pkgrel=5
pkgdesc="Lua interpreter written in Java"
arch=(any)
url="http://sourceforge.net/projects/luaj"
license=("MIT")
depends=(java-runtime)
source=("http://downloads.sourceforge.net/luaj/luaj-${pkgver//_/-}.zip")
optdepends=("java-bcel: To compile Lua bytecode")
md5sums=('249dbb8caa0fab24e98cf26a0412b275')

package() {
  cd "$srcdir/luaj-${pkgver//_/-}"
  install -Dm644 README.html "$pkgdir/usr/share/doc/luaj/README.html"
  cp -r "docs/api" "$pkgdir/usr/share/doc/luaj/"
  cd lib
  find . -name '*.jar' |
    xargs -rtl1 -I {} install -Dm644 {} "$pkgdir/usr/share/java/luaj/"{}
}

# vim:set ts=2 sw=2 et:
