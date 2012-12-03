# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python2-xcaplib
pkgver=1.0.17
pkgrel=1
pkgdesc="A python library for managing XML documents on XCAP server"
license=('custom:MIT')
arch=('any')
url="http://download.ag-projects.com/SipClient"
depends=('python2-application' 'python2-lxml')
optdepends=('bash-completion: for bash completion')
source=("http://download.ag-projects.com/SipClient/${pkgname/2}-$pkgver.tar.gz")
md5sums=('6d839fbf5dde9952dd261c96605b9e44')

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  #python2 fix
  sed -i "s|^#!.*python$|&2|" `grep -rl "^#!.*python" "$pkgdir"`

  # bash completion
  install -Dm644 bash_completion.d/xcapclient \
    "$pkgdir/usr/share/bash-completion/completions/xcapclient"

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
