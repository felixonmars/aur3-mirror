# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=picviz-cli
pkgver=0.6
pkgrel=3
pkgdesc="PicViz command-line interface"
arch=('i686' 'x86_64')
url="http://www.picviz.com/sections/opensource/picviz.html"
license=('GPL3')
depends=('libpicviz' 'pcre')
source=("http://www.picviz.com/sections/opensource/picviz-latest.tar.bz2")
sha256sums=('3fdc4f60c821f377514ccd5ceacf83b197e747ea928e6f80e020c25395a43b00')

build() {
  cd "$srcdir/picviz-latest/picviz-cli/src"

  make
}

package() {
  cd "$srcdir/picviz-latest/picviz-cli/src"
  install -Dm755 pcv "$pkgdir/usr/bin/pcv"

  cd "$srcdir/picviz-latest/picviz-cli/doc"
  install -Dm644 pcv.1 "$pkgdir/usr/share/man/man1/pcv.1"
}

# vim:set ts=2 sw=2 et:
