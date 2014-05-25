# Maintainer: Augusto F. Hack <hack.augusto@gmail.com>
pkgname=python2-bucky-git
pkgver=2.0.0
pkgrel=1
pkgdesc="Bucky is a small server for collecting and translating metrics for Graphite."
arch=(any)
url="https://github.com/trbs/bucky"
license=('apache')
depends=('python2' 'python2-watchdog' 'python2-setproctitle')
optdepends=('collectd' 'statsd-git' 'python2-txstatsd')
makedepends=('git')
options=(!emptydirs)
source=('bucky::git+https://github.com/trbs/bucky.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/bucky"
  install -D -m644 systemd/bucky.service $pkgdir/usr/lib/systemd/system/bucky.service
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
