# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=python-reddit
pkgver=1.4.0
pkgrel=1
pkgdesc="Python Reddit API"
url="https://github.com/mellort/reddit_api"
arch=('any')
license=('GPL3')
depends=('python-six')
conflicts=('python-reddit-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/mellort/reddit_api/archive/$pkgver.tar.gz)
sha256sums=(a8f9723b3fac2788f356e67110091f65f9261dcaa8f39294fba877b53c33c817)

package() {
  cd "$srcdir/reddit_api-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
