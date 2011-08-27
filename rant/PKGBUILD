# Contributor: rabyte <rabyte.at.pen.dot.tj>

pkgname=rant
pkgver=0.5.8
pkgrel=1
pkgdesc="A flexible build tool written entirely in Ruby"
arch=('i686' 'x86_64')
url="http://rant.rubyforge.org/"
license=('LGPL2')
depends=('ruby>=1.8')
source=(http://rubyforge.org/frs/download.php/14775/$pkgname-$pkgver.tar.gz)
md5sums=('70757207023ddaea06e8275cd738ba85')

build() {
  cd $startdir/src/$pkgname-$pkgver

  ruby setup.rb config
  ruby setup.rb install --prefix=$startdir/pkg
}
