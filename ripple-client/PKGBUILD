# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ripple-client
pkgver=1.1.5
pkgrel=1
pkgdesc="Web UI for the Ripple payment network"
arch=('i686' 'x86_64')
depends=('nodejs')
makedepends=('nodejs-bower' 'nodejs-grunt-cli' 'npm')
groups=('ripple')
url="https://github.com/ripple/ripple-client"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/ripple/$pkgname/tar.gz/$pkgver)
sha256sums=('87a5f751eba2ad7ae280590befb2fd0c0bdec8c3247fc5af29eb9aebbb0504eb')
options=('!strip')
install=ripple-client.install

prepare() {
  cd ${pkgname%-git}

  msg 'Creating default config file...'
  cp -dpr --no-preserve=ownership src/js/config-example.js src/js/config.js
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing NPM dependencies...'
  npm install --python=python2

  msg 'Fetching Web assets...'
  bower install --allow-root --config.interactive=false

  msg 'Building...'
  grunt
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing license...'
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/ripple-client/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 "CONTRIBUTING.md" "$pkgdir/usr/share/doc/ripple-client/CONTRIBUTING.md"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/ripple-client/README.md"

  msg 'Installing appdirs...'
  install -dm 755 "$pkgdir/usr/share/ripple-client"
  for _appdir in `find . -mindepth 1 -maxdepth 1 -type d`; do
    cp -dpr --no-preserve=ownership "$_appdir" "$pkgdir/usr/share/ripple-client/$_appdir"
  done

  msg 'Installing appfiles...'
  for _appfile in `find . -mindepth 1 -maxdepth 1 -type f`; do
    cp -dpr --no-preserve=ownership "$_appfile" "$pkgdir/usr/share/ripple-client/$_appfile"
  done

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
