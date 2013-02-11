pkgname=cappuccino-framework
pkgver=0.9.6
pkgrel=2
pkgdesc="Cappuccino is a framework which makes it easy to create advanced web apps."
arch=(any)
url="http://www.cappuccino-project.org"
license=("LGPLv2")
depends=(java-runtime)
install=$pkgname.install
source=("https://raw.github.com/cappuccino/cappuccino/v$pkgver/bootstrap.sh")
md5sums=('2bc5a8933bec57d3b14070a15351f142')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/opt"
  chmod +x "$srcdir/bootstrap.sh"
  ./bootstrap.sh --noprompt --directory $pkgdir/opt/cappuccino
  find $pkgdir -name '.gitignore' | xargs -rtl1 rm
}

# vim:set ts=2 sw=2 et:
