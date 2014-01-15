# Maintainer: Christoph Drexler <chrdr at gmx dot at>

pkgname=eclipse-ajdt
pkgver=2.2.3
pkgrel=1
pkgdesc="AspectJ Development Tools (Eclipse Plugin)"
arch=('any')
url="http://www.eclipse.org/ajdt/"
license=('EPL')
depends=('eclipse>=4.3')
source=(http://download.eclipse.org/tools/ajdt/43/update/ajdt_${pkgver}_for_eclipse_4.3.zip)
md5sums=('32b4be81a4f2fbed3b6074b679936b70')

build() {
  # nothing to do
  true
}

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}

  # Features
  find features -type f -name "*.jar" | while read _feature ; do
    install -dm755 ${_dest}/${_feature%*.jar}
    cd ${_dest}/${_feature/.jar}
    jar xf ${srcdir}/${_feature}
  done

  # Plugins
  find plugins -type f -name "*.jar" | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
