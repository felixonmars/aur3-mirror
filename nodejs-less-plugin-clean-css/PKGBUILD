# Maintainer: Mladen Milinkovic <maxrd2@smoothware.net>

pkgname=nodejs-less-plugin-clean-css
pkgver=1.5.0
pkgrel=1
pkgdesc="Clean-CSS plugin for LESS compiler."
arch=('any')
url="http://lesscss.org/"
license=('Apache')
depends=('nodejs' 'nodejs-less')

pkgver() {
	npm info less-plugin-clean-css | sed -nre "s/^.*version:\s*'(.*)'.*$/\1/p"
}

package() {
	npm install -g --user root --prefix "$pkgdir/usr" less-plugin-clean-css
}

