# Maintainer: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Vinh Nguyen <kureikain@gmail.com>
# Contributor: Exiquio Cooper-Anderson <exiquio@gmail.com>
pkgname='heroku-client'
pkgver=2.35.0
_foremanver=0.41.0
pkgrel='1'
pkgdesc='Manage Heroku apps from the command line.'
arch=('any')
license=('MIT')
url='https://toolbelt.herokuapp.com/'
depends=('ruby')
source=(
  "http://assets.heroku.com/heroku-client/heroku-client-${pkgver}.tgz"
  "http://assets.foreman.io/foreman/foreman-${_foremanver}.tgz"
)
sha256sums=('c2a32e80d1e5e8965fb51d0d5b145c0166cbe90e58976b2bcb58b72a570a860b'
            '721675b633555a559c2f458ae8ab4ed8548274c69712d24328e923290e9bfb9a')

package() {
  cd "$pkgdir"

  mkdir -p "usr/lib/ruby/vendor_ruby"
  cp -a "$srcdir/$pkgname" "usr/lib/ruby/vendor_ruby/$pkgname"
  chmod -R 755 "usr/lib/ruby/vendor_ruby/$pkgname"

  cp -a "$srcdir/foreman" "usr/lib/ruby/vendor_ruby/foreman"
  chmod -R 755 "usr/lib/ruby/vendor_ruby/foreman"

  mkdir -p "usr/bin"
  ln -s "/usr/lib/ruby/vendor_ruby/heroku-client/bin/heroku" "usr/bin/heroku"
  ln -s "/usr/lib/ruby/vendor_ruby/foreman/foreman" "usr/bin/foreman"
}
