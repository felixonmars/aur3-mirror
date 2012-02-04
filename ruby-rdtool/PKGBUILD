# Maintainer: Omar Campagne <ocampagne at gmail com>
# Contributor: William Rea <sillywilly@gmail.com>
pkgname=ruby-rdtool
pkgver=0.6.22
pkgrel=1
pkgdesc="Ruby language binding for RRDtool"
url="http://rubyforge.org/projects/rdtool"
depends=('rrdtool')
arch=('any')
license=('GPL')
source=(http://rubyforge.org/frs/download.php/33346/rdtool-$pkgver.tar.gz)
md5sums=('0feba6ecd94282d024f563c9490d6b47')


build() {
  cd $srcdir/rdtool-$pkgver
  ruby setup.rb config 
  ruby setup.rb setup
  ruby setup.rb install --prefix=/$pkgdir
}
