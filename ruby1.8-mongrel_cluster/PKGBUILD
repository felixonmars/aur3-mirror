# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-mongrel_cluster
pkgver=1.0.5
_realname="mongrel_cluster"
pkgrel=1
pkgdesc="Mongrel plugin that provides commands and Capistrano tasks for managing multiple Mongrel processes."
arch=(any)
url="http://gemcutter.org/gems/mongrel_cluster"
license=("GPL")
depends=('ruby1.8' 'ruby1.8-mongrel')

build() {
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies "${_realname}"  -i "$pkgdir$_gemdir"
}
