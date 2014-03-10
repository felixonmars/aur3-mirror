# Contributor: gem2arch 0.1
pkgname=ruby-net-ssh-2.2
pkgver=2.2.2
_realname="net-ssh"
pkgrel=4
pkgdesc="Net::SSH: a pure-Ruby implementation of the SSH2 client protocol."
arch=(any)
url='https://rubygems.org/gems/net-ssh'
license=("GPL")
depends=('ruby')
source=(https://rubygems.org/downloads/net-ssh-$pkgver.gem)
noextract=(net-ssh-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --no-user-install --ignore-dependencies \
    -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}
md5sums=('d85cd9fc47ada2b9adef9cb389c7d0f1')
