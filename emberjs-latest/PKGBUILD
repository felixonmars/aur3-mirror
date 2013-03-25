# Maintainer: Gavin Costello <gavcos at gmail dot com>
# Contributor: Simon Hafner <hafnersimon at gmail dot com>
pkgname=emberjs-latest
pkgver=latest
pkgrel=3
pkgdesc="Ember is a JavaScript framework for creating ambitious web applications that eliminates boilerplate and provides a standard application architecture."
arch=(any)
url="http://emberjs.com"
license=('MIT')
depends=(handlebars)
conflicts=(emberjs)
source=("https://github.com/downloads/emberjs/ember.js/ember-${pkgver}.js" "https://github.com/downloads/emberjs/ember.js/ember-${pkgver}.min.js")
md5sums=('56229b16653c1d3650a7f5301555aeb3'
         'fc403fac6b7fd78601f142806354b846')

package() {
  mkdir -p "${pkgdir}/usr/share/emberjs"
  install -m644 "${srcdir}/ember-${pkgver}.min.js" "${pkgdir}/usr/share/emberjs"
  install -m644 "${srcdir}/ember-${pkgver}.js" "${pkgdir}/usr/share/emberjs"
  ln -s "${pkgdir}/usr/share/emberjs/ember-${pkgver}.min.js" "${pkgdir}/usr/share/emberjs/ember.min.js"
  ln -s "${pkgdir}/usr/share/emberjs/ember-${pkgver}.js" "${pkgdir}/usr/share/emberjs/ember.js"
}

# vim:set ts=2 sw=2 et:
