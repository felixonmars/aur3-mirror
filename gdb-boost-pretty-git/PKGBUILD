pkgname=gdb-boost-pretty-git
pkgver=20111201
pkgrel=1
pkgdesc="A GNU debugger extension for Boost pretty printers"
arch=('i686' 'x86_64')
url="https://github.com/ruediger/Boost-Pretty-Printer"
license=('custom')
depends=('gdb')
makedepends=('git')
install=gdb-boost-pretty.install
source=(gdb-boost-pretty.gdb)
md5sums=('71b84bcfce7f2f13d7c613fe26a6e1a7')

_gitroot="git://github.com/ruediger/Boost-Pretty-Printer.git"
_gitname="getstream"


build() {
  cd "$srcdir"

  git clone git://github.com/ruediger/Boost-Pretty-Printer.git

}

package() {
  cd "$srcdir"/Boost-Pretty-Printer
  install -d "$pkgdir/usr/share/gdb/gdb-boost-pretty"

  cp -r ./boost "$pkgdir/usr/share/gdb/gdb-boost-pretty/"

  install -m644 "$srcdir/gdb-boost-pretty.gdb" "$pkgdir/usr/share/gdb/gdb-boost-pretty"
}
