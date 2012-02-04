# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-fastthread
pkgver=1.0.7    
_realname="fastthread"
pkgrel=1
pkgdesc="Optimized replacement for thread.rb primitives"
arch=(any)
url="http://gemcutter.org/gems/fastthread"
license=("MIT")
depends=('ruby1.8')
source=(http://rubygems.org/downloads/$_realname-$pkgver.gem)
noextract=($_realname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

md5sums=('16eb06dc3661c89301de6c73c71bb16e')

