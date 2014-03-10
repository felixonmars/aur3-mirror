# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Sid Karunaratne <sid@karunaratne.net>

_gemname=timers
pkgname=ruby-timers-1.1
pkgver=1.1.0
pkgrel=1
pkgdesc="Pure Ruby one-shot and periodic timers"
arch=('any')
url="https://rubygems.org/gems/timers"
license=('MIT')
depends=('ruby' 'ruby-rspec')
provides=('ruby-timers')
source=(http://gems.rubyforge.org/gems/$_gemname-$pkgver.gem)
md5sums=('5bf756f4d6d838c626f9b47ea281d765')

package() {
  cd "$srcdir"

  local _gemdir="$( ruby -rubygems -e'puts Gem.default_dir' )"

  gem install --ignore-dependencies --no-user-install \
    -i "$pkgdir/$_gemdir" $_gemname-$pkgver.gem
}

