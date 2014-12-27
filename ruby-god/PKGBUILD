# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-god
pkgver=0.13.4
pkgrel=1
pkgdesc="A process monitoring framework in Ruby"
arch=('i686' 'x86_64')
url="http://godrb.com"
license=('MIT')
depends=('ruby')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem
        god.service)
sha256sums=('c48bec321884396656d2aea08270fe73cb491317c2906cbf8bb00f718e969610'
            '753a12224f810c301b073158f8026682889c4df7b30ee5e8eb2fa1e3312d57d8')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('god' 'ruby-god')
conflicts=('god')
install=god.install

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem

  msg 'Readying directories...'
  mkdir -p "$pkgdir"/{etc/god/conf.d,/var/log/god,}

  msg 'Installing systemd service file...'
  install -Dm644 "$srcdir/god.service" "$pkgdir/usr/lib/systemd/system/god.service"
}
