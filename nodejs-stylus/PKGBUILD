# Maintainer: tasos latsas <tlatsas@gmx dot com>
# Contributor: tjholowaychuk <tj@vision-media.ca>
# Contributor: TJ Holowaychuk <tj@vision-media.ca>

_npmname=stylus
pkgname=nodejs-stylus # All lowercase
pkgver=0.50.0
pkgrel=1
pkgdesc="Robust, expressive, and feature-rich CSS superset"
arch=(any)
url="https://github.com/Automattic/stylus"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)

package() {
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  rmdir "$pkgdir/usr/etc"
}

sha256sums=('3fe2ab1ac27735d122318ff21ce774baf436f4395507c3c886d65af1669b20be')

# vim:set ts=2 sw=2 et:
