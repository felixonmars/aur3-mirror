# Maintainer: Henning Bekel <h dot bekel at googlemail dot com>

pkgname=ruby-spreadsheet  
pkgver=0.6.4.3
pkgrel=1
pkgdesc="Read/write access to Excel compatible spreadsheets"
url="http://rubyforge.org/projects/spreadsheet/"
arch=('any')
license=('GPL3')
depends=('ruby' 'ruby-ole')
source=(http://rubyforge.org/frs/download.php/72688/spreadsheet-0.6.4.3.gem)
md5sums=('bfc14ed9bc85d24c99b9cfb512db394b')
noextract=(spreadsheet-$pkgver.gem)

build() { return 0; }

package() {
  cd "$srcdir"
  _gemdir="$(gem environment gemdir)"
  gem install --ignore-dependencies -i "$pkgdir/$_gemdir" spreadsheet-${pkgver}.gem
  chmod +r $pkgdir/$_gemdir/gems/spreadsheet-${pkgver}/test/data/test_formula.xls
  chmod +r $pkgdir/$_gemdir/gems/spreadsheet-${pkgver}/test/data/test_datetime.xls
}