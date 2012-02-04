# Maintainer: Jan Dlabal <dlabaljan at gmail dot com>
pkgname=scut
pkgver=0.1
pkgrel=2
pkgdesc="An app to cut your screen - make a screenshot and move it around easily"
arch=('i686' 'x86_64')
url="https://github.com/houbysoft/short/blob/master/scut.py"
license=('GPL3')
depends=('scrot' 'python')
source=('https://github.com/houbysoft/short/raw/master/scut.py')
md5sums=('7753f2391781cb96770bc252619f3512')

build() {
  cd  $srcdir
  install -D scut.py "$pkgdir/usr/bin/scut"
}
