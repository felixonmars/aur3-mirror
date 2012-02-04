# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-eventmachine
pkgver=0.12.10
_realname="eventmachine"
pkgrel=1
pkgdesc="Ruby/EventMachine library"
arch=(any)
url="http://rubyeventmachine.com"
license=("GPL")
depends=('ruby1.8')
source=(http://gems.rubyforge.org/gems/eventmachine-$pkgver.gem)
noextract=(eventmachine-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('1379ea93ad77132fb3756b492025f172')
