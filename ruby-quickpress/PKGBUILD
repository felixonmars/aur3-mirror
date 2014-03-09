pkgname=ruby-quickpress
_gemname=quickpress
pkgver=0.2.1
pkgrel=0
pkgdesc="Manage your Wordpress site on the command line"
arch=('any')
license=('GPL3')
makedepends=('ruby')
url='http://quickpress.alexdantas.net/'
source=("http://rubygems.org/downloads/quickpress-$pkgver.gem")
md5sums=('f5f6d72e9f03704a7d44bdde82d161ca')
noextract=("quickpress-$pkgver.gem")

package() {
  cd "$srcdir"
  local _gemdir=$(ruby -e 'puts Gem.default_dir')
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
}
