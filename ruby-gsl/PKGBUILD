# Contributor: TDY <tdy@archlinux.info>
# Contributor: Maksim Sipos (maxsipos at gmail dot com)

pkgname=ruby-gsl
pkgver=1.14.7
pkgrel=1
pkgdesc="A Ruby interface to the GNU Scientific Library"
arch=('i686' 'x86_64')
url="http://ruby-gsl.sourceforge.net/"
license=('GPL')
depends=('gsl>=1.14' 'ruby')
optdepends=('plotutils')
source=(http://rubyforge.org/frs/download.php/74341/rb-gsl-$pkgver.tgz
        https://rubyforge.org/tracker/download.php/285/1169/29353/5296/rb-gsl-complex-vector-matrix-equal.diff)
md5sums=('8107bc0cfe231d9fa1b6f7cd2aed216e'
         '9b17bac23ef1abdad72b509f1683e8c9')

build() {
  cd "$srcdir/rb-gsl-$pkgver"
  patch -Np0 -i ../rb-gsl-complex-vector-matrix-equal.diff
  ruby setup.rb config --siteruby=/usr/lib/ruby/vendor_ruby
  ruby setup.rb setup
}

package() {
  cd "$srcdir/rb-gsl-$pkgver"
  ruby setup.rb install --prefix="$pkgdir"
}

# vim:set ts=2 sw=2 et:
