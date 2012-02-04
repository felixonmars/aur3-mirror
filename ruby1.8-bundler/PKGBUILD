# Contributor: Hilton Medeiros <medeiros.hilton at gmail dot com>
# Maintainer:  Nicolas Pouillard <nicolas.pouillard at gmail dot com>

pkgname=ruby1.8-bundler
_pkgname=bundler
pkgver=1.0.10
pkgrel=1
pkgdesc="A ruby application's dependencies manager."
arch=('any')
url="http://gembundler.com/"
license=('MIT')
depends=('ruby1.8')
makedepends=('rubygems1.8')
source=("http://gems.rubyforge.org/gems/$_pkgname-$pkgver.gem")
noextract=($_pkgname-$pkgver.gem)
md5sums=('d848cafc6ef572bff6d80b1c98c2f443')

build() {
  /bin/true
}

package() {
  cd $srcdir

  # _gemdir is defined inside pkgbuild because if ruby[gems] is not installed on the system
  # makepkg will exit with an error when sourcing the PKGBUILD
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"

  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" $_pkgname-$pkgver.gem
  install -d $pkgdir/usr/bin/
  ln -s $_gemdir/bin/bundle $pkgdir/usr/bin/bundle-1.8
}
