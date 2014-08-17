# Maintainer: krosos <krosos+aur <<at>> autistici <<dot>> org>
# Contributor: <acoolon@web.de>
pkgname=boom
pkgver=0.4.0
pkgrel=1
pkgdesc="access and manage text snippets over your command line."
arch=('i686' 'x86_64')
url="https://github.com/holman/boom"
license=('MIT')
depends=('ruby' 'ruby-yajl-ruby-1.1' 'roundup')
makedepends=('rubygems')
provides=('boom-0.4.0')
source=(http://rubygems.org/downloads/$pkgname-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha512sums=('fc4dce5c738a91f35246b45649c97e439cdd8ea0840f76cd82912db703cc833695cf6d7c9103dfda717eb0c6454c6d9a469d475e6ff9de05bc2dfa718707bf52')

package() {
  cd $srcdir
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --verbose --no-user-install -n "$pkgdir"/usr/bin $pkgname-$pkgver.gem
}
