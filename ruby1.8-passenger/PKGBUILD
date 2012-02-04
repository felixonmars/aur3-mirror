# Contributor: Jacek Roszkowski <j.roszk@gmail.com>
pkgname=ruby1.8-passenger
pkgver=2.2.10
_realname="passenger"
pkgrel=1
pkgdesc="mod_rails passenger"
arch=(any)
url="http://www.modrails.com"
license=("GPL")
depends=('ruby1.8' 'ruby1.8-rake' 'ruby1.8-fastthread' 'boost')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
noextract=($_realname-$pkgver.gem)

build() {
  cd $srcdir
  local _gemdir="$(ruby-1.8 -rubygems -e'puts Gem.default_dir')"
  gem-1.8 install --ignore-dependencies -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
  cd $pkgdir/opt/ruby1.8/lib/ruby/gems/1.8/gems/passenger-2.2.10/ext/nginx
  /opt/ruby1.8/lib/ruby/gems/1.8/bin/rake nginx || return 1
}
md5sums=('c116ed533ef00eccaffb5a3568cdfd23')

