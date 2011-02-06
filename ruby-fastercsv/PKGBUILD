# Contributor: Emiliano Vavassori <syntaxerrormmm@gmail.com>
# Maintainer: Emiliano Vavassori <syntaxerrormmm@gmail.com>
pkgname=ruby-fastercsv
pkgver=1.5.0
pkgrel=3
pkgdesc="A faster replacement for Ruby's standard CSV library"
arch=('i686' 'x86_64')
url="http://fastercsv.rubyforge.org/"
license=('GPL')
depends=('ruby>=1.8.3')
makedepends=('ruby>=1.8.3')
source=(http://rubyforge.org/frs/download.php/58692/fastercsv-${pkgver}.tgz)
md5sums=('5a74d251d4b1311464ee1f8df4112d00')

build() {
  cd "${srcdir}/fastercsv-$pkgver"

  install -d -m755 ${pkgdir}/usr/lib/ruby/site_ruby/1.8
  install -d -m755 ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -D -m644 lib/fastercsv.rb lib/faster_csv.rb ${pkgdir}/usr/lib/ruby/site_ruby/1.8/ || return 1
  rdoc -q --op ${pkgdir}/usr/lib/ruby/site_ruby/doc/1.8/fastercsv-${pkgver}/rdoc README INSTALL TODO CHANGELOG AUTHORS COPYING LICENSE lib/ -m README -t "FasterCSV Documentation" || return 1
  install -D -m644 README INSTALL TODO CHANGELOG AUTHORS COPYING LICENSE ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/
}
