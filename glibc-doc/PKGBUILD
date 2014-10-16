# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=glibc-doc
_pkgname=libc
pkgver=2.20
pkgrel=1
pkgdesc="A set of HTML documentation for the GNU C library"
arch=('any')
url="https://www.gnu.org/software/libc/"
license=('GPL')
options=('docs' '!strip')
source=("https://www.gnu.org/software/$_pkgname/manual/html_node/$_pkgname-html_node.tar.gz"
        "https://www.gnu.org/software/$_pkgname/manual/html_mono/$_pkgname.html")
md5sums=('303a8eb2be825c7f70af83296ffb611e'
         '2c7ae2c0a190a46cfb527838da99f61c')

package() {
  cd "$srcdir"
  install -Dm644 $_pkgname.html "$pkgdir/usr/share/doc/g$_pkgname/$_pkgname.html"
  cp -rf $_pkgname/* "$pkgdir/usr/share/doc/g$_pkgname"
}
