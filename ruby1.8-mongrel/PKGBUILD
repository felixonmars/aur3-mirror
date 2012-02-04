# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-mongrel
pkgver=1.1.6
_realname="mongrel"
pkgrel=1
pkgdesc="A small fast HTTP library and server that runs Rails, Camping, Nitro and Iowa apps."
arch=(any)
url="http://gemcutter.org/gems/mongrel"
license=("GPL")
depends=('ruby1.8' 'ruby1.8-daemons' 'ruby1.8-gem_plugin')

build() {
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies "${_realname}" --source http://gems.rubyinstaller.org -i "$pkgdir$_gemdir"
}
