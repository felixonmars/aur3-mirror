# Maintainer: Zhengyu Xu <xzy3186[at]gmail[dot]com>
pkgname=rhythmbox-plugin-coverart-browser
pkgver=2.1
pkgrel=1
pkgdesc="a Rhythmbox plugin that lets you browse and play your music via an album art view"
url="https://github.com/fossfreedom/coverart-browser"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('glib2' 'gtk3' 'rhythmbox' 'python-mako' 'python-lxml' 'python-cairo'
'python-chardet' 'gst-plugins-ugly' 'gst-plugins-good' 'gst-plugins-bad'
'rhythmbox-plugin-coverart-search-providers')
conflicts=('rhythmbox-plugin-coverart-browser-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fossfreedom/coverart-browser/archive/v${pkgver}.tar.gz")
sha256sums=("b07db6eb0ebbc948fe19677ec48f115de0322bd998c287e65e9d68b562665cd6")
install=$pkgname.install
package() {
  cd ${srcdir}/coverart-browser-${pkgver}

  sed -i "s/python$/python3/g" coverart_browser.plugin
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
