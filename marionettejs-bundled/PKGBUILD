# Maintainer: Benoît Brummer <self at trougnouf dot com>
pkgname=marionettejs-bundled
_script=backbone.marionette
pkgver=1.8.3
pkgrel=2
pkgdesc="Backbone.Marionette is a composite application library for Backbone.js that aims to simplify the construction of large scale JavaScript applications. Bundled with Backbone.Wreqr and Babysitter (dependencies)"
arch=(any)
url=http://marionettejs.com
license=('MIT')
depends=(backbonejs)
source=("$url/downloads/$_script.js" "$url/downloads/$_script.min.js")
md5sums=('45fc53caafdd84798edcf7446ba57b51'
         '70526ac443150bf14b832f36f865e8b2')

package() {
  cd "${srcdir}"
  install -Dm644 "${_script}.min.js" "${pkgdir}/usr/share/${pkgname}/${_script}.min.js"
  install -Dm644 "${_script}.js" "${pkgdir}/usr/share/${pkgname}/${_script}.js"
}