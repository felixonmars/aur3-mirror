# Maintainer: bzt <unmacaque@gmail.com>

pkgname=gedit-webkit-panel-plugin
pkgver=3.0.1
pkgrel=1
pkgdesc="Add Webkit in a panel of gedit to easily display the html file being edited."
arch=('any')
license=('GPL3')
depends=('gedit' 'python' 'libwebkit3')
url="http://code.google.com/p/gedit-webkit-panel-plugin/"
source=("http://gedit-webkit-panel-plugin.googlecode.com/files/webkitpanel.${pkgver}.tar.gz")
md5sums=('ad2b901e8d6e53f69c67f5d6937141c8')

package() {
  cd "${srcdir}"/webkitpanel.${pkgver}
  
  mkdir -p "${pkgdir}"/usr/lib/gedit/plugins
  
  cp -R webkitpanel webkitpanel.plugin "${pkgdir}"/usr/lib/gedit/plugins
}

