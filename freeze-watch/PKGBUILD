# Maintainer: Matt Garriott <matt.garriott at gmail dot com>
pkgname=freeze-watch
pkgver=1.0.2
pkgrel=1
pkgdesc="Get email alerts when the temperature is predicted to drop below a set point"
arch=('any')
url="https://github.com/mgarriott/FreezeWatch"
license=('custom:BSD2')
depends=('ruby' 'ruby-bundler')
makedepends=()
install="$pkgname.install"
backup=('etc/freezewatch.yaml')
source=("https://github.com/mgarriott/FreezeWatch/archive/v$pkgver.tar.gz")
md5sums=('204599f869dc36cb6375d6475382d02d')

build() {
  cd "$srcdir/FreezeWatch-$pkgver"
  bundle install --without=test --standalone --path vendor
}

package() {
  local _final_dirname="/opt/$pkgname"
  local _dirname="$pkgdir$_final_dirname"

  mkdir -p $pkgdir/opt
  mv "$srcdir/FreezeWatch-$pkgver" $_dirname

  cd $_dirname
  bundle exec rake install

  install -D "$_dirname/freezewatch.yaml" "$pkgdir/etc/freezewatch.yaml" -m644
  ln -sf "/etc/freezewatch.yaml" "$_dirname/freezewatch.yaml"

  mkdir -p "$pkgdir/usr/lib/systemd/system"
  sed -i "s%ExecStart=.*$%ExecStart=$(which ruby) $_final_dirname/bin/watcher.rb%" \
    "$_dirname/systemd/freezewatch.service"

  sed -i "s%WorkingDirectory=.*$%WorkingDirectory=$_final_dirname%" \
    "$_dirname/systemd/freezewatch.service"

  install -D "$_dirname/systemd/freezewatch.service" \
    "$pkgdir/usr/lib/systemd/system/freezewatch.service" -m644

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
