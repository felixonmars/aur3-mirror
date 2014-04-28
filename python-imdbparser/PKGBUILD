# Maintainer: wifiextender <aaron_caffrey at hotmail dot com>

pkgname=python-imdbparser
pkgver=7.2d1b137
pkgrel=1
pkgdesc="A python module to parse IMDB, see https://github.com/wifiextender/imdb_parser for example usage."
arch=('any')
url="https://github.com/wifiextender/imdb_parser"
license=('GPL3')
depends=('python3')
makedepends=('git')
source=('git+https://github.com/wifiextender/imdb_parser.git')
md5sums=('SKIP')

package() {
  cd $srcdir/imdb_parser

  # Program
  sudo python3 setup.py install

}

pkgver() {
  cd $srcdir/imdb_parser
  echo $(git rev-list --count master).$(git rev-parse --short master)
}