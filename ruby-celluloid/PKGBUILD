# Maintainer: Sid Karunaratne <sid@karunaratne.net>

pkgname=ruby-celluloid
pkgver=0.16.0
_realname="celluloid"
pkgrel=3
pkgdesc="Celluloid enables people to build concurrent programs out of concurrent objects just as easily as they build sequential programs out of sequential objects"
arch=('any')
url="https://rubygems.org/gems/celluloid"
license=("MIT")
depends=('ruby' 'ruby-timers')
source=(http://gems.rubyforge.org/gems/$_realname-$pkgver.gem)
noextract=($real_name-$pkgver.gem)

package() {
  cd $srcdir
  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir$_gemdir" ${_realname}-$pkgver.gem
}

sha256sums=('63779982ab200d9a67562998f52dcaff685372919faeb3bf53b287783c989d10')
