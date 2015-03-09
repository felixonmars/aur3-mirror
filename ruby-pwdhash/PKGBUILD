# Maintainer: Sid Karunaratne <sid@karunaratne.net>

pkgname=ruby-pwdhash
pkgver=0.3.2
_realname="pwdhash"
pkgrel=1
pkgdesc="Command line version of Stanford PwdHash"
arch=('any')
url="https://rubygems.org/gems/pwdhash"
license=("MIT")
depends=('ruby' 'ruby-highline' 'ruby-hmac' 'ruby-backports')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/ruby/gems/2.2.0/bin/pwdhash" "${pkgdir}/usr/bin/pwdhash"
}
sha256sums=('217dcb8f1520b86ac7edf91e9d40823b78b3b66c96cbb498c3c67be7dc1e375e')
