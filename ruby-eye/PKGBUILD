# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ruby-eye
pkgver=0.6.3
pkgrel=1
pkgdesc="Process monitoring tool inspired by Bluepill and God"
arch=('any')
url="https://github.com/kostya/eye"
license=('MIT')
depends=('ruby' 'ruby-celluloid' 'ruby-celluloid-io' 'ruby-sigar' 'ruby-state_machine' 'ruby-thor')
source=(https://rubygems.org/downloads/${pkgname#*-}-${pkgver}.gem
        eye.service)
sha256sums=('a80ded510b30440ede61a8eac40e8e422021c041c4de6f68edb7d83b57188c2d'
            '735ffd3cf4eb5da23feb40cd75fbfc54eca966bab66f15fa5882c52308689f91')
noextract=("${pkgname#*-}-${pkgver}.gem")
provides=('eye' 'ruby-eye')
conflicts=('eye')
install=eye.install

package() {
  cd "$srcdir"

  msg 'Installing...'
  gem install \
    --no-user-install \
    --ignore-dependencies \
    -i "$pkgdir$(ruby -rubygems -e'puts Gem.default_dir')" \
    ${pkgname#*-}-$pkgver.gem

  msg 'Readying directories...'
  mkdir -p "$pkgdir"/{etc/eye/conf.d,/var/log/eye,}

  msg 'Installing systemd service file...'
  install -Dm644 "$srcdir/eye.service" "$pkgdir/usr/lib/systemd/system/eye.service"
}
