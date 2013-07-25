# Maintainer: fsckd <fsckdaemon at gmail dot com>

pkgname=lunamark-standalone-git
pkgver=0.3.12.g63fd84b
pkgrel=1
pkgdesc="Command line tool for conversion of markdown to html, html5, dzslides, docbook, latex, context, or man."
url='http://jgm.github.io/lunamark/'
license=('MIT')
arch=('i686' 'x86_64')
makedepends=('lua')
source=('git://github.com/jgm/lunamark')
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/lunamark"
   git describe --tags --always | sed 's|-|.|g'
}

build()
{
   cd "${srcdir}/lunamark"
   make standalone
}

package()
{
   cd "${srcdir}/lunamark/standalone"
   install -D -m0755 lunamark "${pkgdir}/usr/bin/lunamark"
   install -D -m0644 lunamark.1 "${pkgdir}/usr/share/man/man1/lunamark.1"
}
