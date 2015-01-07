# Contributor: <acoolon@web.de>
# Maintainer: krosos <krosos+git@autistici.org>

_gemname=boom
pkgname=ruby-$_gemname
pkgver=0.4.0
pkgrel=1
pkgdesc='boom lets you access text snippets over your command line.'
arch=('i686' 'x86_64')
url='https://github.com/holman/boom'
license=('MIT')
depends=('ruby' 'ruby-yajl-ruby-1.1' 'roundup')
options=(!emptydirs)
source=(https://rubygems.org/downloads/$_gemname-$pkgver.gem)
noextract=($_gemname-$pkgver.gem)
#sha1sums=('b1307413456e8f55d06d892edefcd097296c6164')
sha512sums=('fc4dce5c738a91f35246b45649c97e439cdd8ea0840f76cd82912db703cc833695cf6d7c9103dfda717eb0c6454c6d9a469d475e6ff9de05bc2dfa718707bf52')

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
