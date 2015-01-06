# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
pkgname=tt-rss-plugin-feediron
pkgver=1.0.0.r10.ga7b9d06
pkgrel=1
pkgdesc="Replace an article's contents by the contents of an element on the linked URL's page."
arch=('any')
url="https://github.com/m42e/ttrss_plugin-feediron"
license=('MIT')
groups=('ttrss-plugins')
depends=('tt-rss')
makedepends=('git')
source=("$pkgname::git://github.com/m42e/ttrss_plugin-feediron.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  install -d "$pkgdir"/usr/share/webapps/tt-rss/plugins/feediron
  cp -ra $pkgname/* "$pkgdir"/usr/share/webapps/tt-rss/plugins/feediron
}
