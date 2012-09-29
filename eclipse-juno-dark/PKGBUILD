#Maintainer: ava1ar <mail(dot)avatar(at)gmail(dot)com>

pkgname=eclipse-juno-dark
pkgver=1.0.0
pkgrel=1
pkgdesc="Dark theme for Eclipse Juno"
arch=('any')
url="https://github.com/Prototik/Eclipse-Juno-Dark"
license=('EPL')
depends=('eclipse>=4.2' )
source=("https://github.com/downloads/Prototik/Eclipse-Juno-Dark/Eclipse-Juno-Dark.zip")

md5sums=('af7b236bbd3fb73b02ee580377fe4f6f')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}
  
  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
