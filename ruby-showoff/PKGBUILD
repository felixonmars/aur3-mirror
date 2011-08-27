# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=ruby-showoff
pkgver=0.2.0
_realname='showoff'
pkgrel=1
pkgdesc='The best damn presentation software a developer could ever love.'
arch=('any')
url='http://github.com/schacon/showoff'
license=('GPL')
depends=('ruby' 'ruby-rack' 'ruby-bluecloth' 'ruby-json_pure' 'ruby-nokogiri')
source=("http://rubygems.org/downloads/$_realname-$pkgver.gem")
noextract=("$_realname-$pkgver.gem")
md5sums=('e52840e8e368d9e7cb7061b8649f1a3c')

build() {
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --ignore-dependencies -i "$pkgdir$_gemdir" $_realname-$pkgver.gem
}
