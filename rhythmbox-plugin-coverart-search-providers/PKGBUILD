# Maintainer: Zhengyu Xu <xzy3186[at]gmail[dot]com>
pkgname=rhythmbox-plugin-coverart-search-providers
pkgver=1.2
pkgrel=1
pkgdesc="Drop in Rhythmbox replacement for the default CoverArt Search plugin"
url="https://github.com/fossfreedom/coverart-search-providers"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('glib2' 'gtk3' 'python-lxml' 'python-chardet' 'python-pillow' 'rhythmbox' 'python-mako' 'python-mutagen' 'python-requests')
conflicts=('rhythmbox-plugin-coverart-search-providers-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fossfreedom/coverart-search-providers/archive/v${pkgver}.tar.gz")
sha256sums=("4a79b2c1d7e2231e9296999f5319c595e540a15409c3bfaf853e1e0f877229e4")
install=$pkgname.install
package() {
  cd ${srcdir}/coverart-search-providers-${pkgver}

  sed -i "s/python$/python3/g" coverart_search_providers.plugin
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
