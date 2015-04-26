# Maintainer: Shinto <asdf.crush@gmail.com>
# Contributor: Vinh Nguyen <kureikain@gmail.com>
# Contributor: Exiquio Cooper-Anderson <exiquio@gmail.com>
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>

pkgname='heroku-client-latest'
pkgver=3.32.0
pkgrel='1'
pkgdesc='Manage Heroku apps from the command line.'
arch=('any')
license=('MIT')
url='https://toolbelt.herokuapp.com/'
depends=('ruby')
source=("https://s3.amazonaws.com/assets.heroku.com/heroku-client/heroku-client.tgz")

sha256sums=('bae8e899dbc0f2e341171e10270faa347b1d4e9dda31167b091d6a4e6dfd2695')

package() {
  cd "$pkgdir"

  mkdir -p "usr/lib/ruby/vendor_ruby"
  cp -a "$srcdir/$pkgname" "usr/lib/ruby/vendor_ruby/$pkgname"
  chmod -R 755 "usr/lib/ruby/vendor_ruby/$pkgname"

  mkdir -p "usr/bin"
  ln -s "/usr/lib/ruby/vendor_ruby/heroku-client/bin/heroku" "usr/bin/heroku"
}

