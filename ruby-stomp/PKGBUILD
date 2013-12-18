pkgname=ruby-stomp
pkgver=1.3.2
pkgrel=1
pkgdesc="Ruby client for the Stomp messaging protocol"
arch=(any)
url="http://stomp.codehaus.org/"
license=("GPL")
depends=('ruby')
makedepends=('rubygems')
source=("http://gems.rubyforge.org/gems/stomp-$pkgver.gem")
md5sums=('5f0ad04b6fc24763a0992c76e311447f')
noextract=("stomp-$pkgver.gem")

package() {

  local _gemdir="$(ruby -rubygems -e'puts Gem.default_dir')"

  gem install --no-user-install --ignore-dependencies -i "$pkgdir$_gemdir" \
    -n "$pkgdir/usr/bin" "stomp-$pkgver.gem"
}
