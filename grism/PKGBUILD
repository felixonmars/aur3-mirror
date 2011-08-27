# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>
pkgname=grism
pkgver=0.9.0
pkgrel=1
pkgdesc="A stock market observation tool"
arch=(i686 x86_64)
url="http://www.grism.org/"
license=('GPL')
depends=('ruby-gtk2' 'ruby-libglade' 'ruby-rcairo')
install=
source=(http://rubyforge.org/frs/download.php/28939/$pkgname-$pkgver.tar.gz)
md5sums=('3d39a2865f7bb0b1dff34e4bc6fd6dbc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ruby setup.rb config --prefix=/usr
  ruby setup.rb setup
  ruby setup.rb install --prefix="$startdir/pkg"
}

# vim:set ts=2 sw=2 et:
