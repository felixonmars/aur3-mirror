# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-daemons
pkgver=1.0.10
_realname="daemons"
pkgrel=1
pkgdesc="A toolkit to create and control daemons in different ways"
arch=(any)
url="http://daemons.rubyforge.org"
license=("GPL")
depends=('ruby1.8')
source=(http://gems.rubyforge.org/gems/daemons-$pkgver.gem)
noextract=(daemons-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('8e2fc7de08405b2d27ac96c82602c9ce')
