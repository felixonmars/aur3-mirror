# Contributor: Andreas W. Hauser <andy-aur@splashground.de> 
pkgname=rb-gsl
pkgver=1.14.3
pkgrel=1
pkgdesc="a ruby interface to GSL (GNU Scientific Library)"
url="http://rb-gsl.rubyforge.org/"
license="GPL"
# plotutils is optional
depends=('gsl>=1.14' ruby plotutils)
arch=(x86_64 i686)
conflicts=(ruby-gsl)
replaces=(ruby-gsl)
provides=(ruby-gsl)
source=(http://rubyforge.org/frs/download.php/69960/rb-gsl-$pkgver.tar.gz)

build() {
  cd $startdir/src/rb-gsl-$pkgver
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg
}
md5sums=('615b979433f99aa18a17da65b40e1e08')
