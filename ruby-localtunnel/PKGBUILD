# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=ruby-localtunnel
_pkgname=localtunnel
pkgver=0.3
pkgrel=1
pkgdesc="Hassle-free reverse SSH tunneling to access servers in a local network"
arch=(any)
url="http://progrium.com/localtunnel/"
license=('GPL')
depends=('ruby-net-ssh' 'ruby-net-ssh-gateway' 'ruby-json' 'ruby')
source=("http://rubygems.org/downloads/$_pkgname-$pkgver.gem")
noextract=($_pkgname-$pkgver.gem)
md5sums=('7d0817d0c6fc0edae127d021c43c1b36')

package() {
  _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  
  cd "$srcdir"
  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    $_pkgname-$pkgver.gem
}

