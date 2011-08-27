# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-thin
pkgver=1.2.5
_realname="thin"
pkgrel=1
pkgdesc="A thin and fast web server"
arch=(any)
url="http://code.macournoyer.com/thin/"
license=("GPL")
depends=('ruby1.8' 'ruby1.8-rack>=1.0.0' 'ruby1.8-eventmachine>=0.12.6' 'ruby1.8-daemons>=1.0.9')
source=(http://gems.rubyforge.org/gems/thin-$pkgver.gem)
noextract=(thin-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('f3bf0b123fd0737794d55f0e14eb28e1')
