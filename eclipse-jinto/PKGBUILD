# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>

pkgname=eclipse-jinto
pkgver=0.13.5
pkgrel=1
pkgdesc="Eclipse plugin that lets the developer easily edit and maintain resource bundles."
arch=('any')
url="http://www.guh-software.de/jinto_en.html"
license=('EPL')
depends=('eclipse')
source=('http://www.guh-software.de/jinto/de.guhsoft.jinto-0.13.5.zip')
md5sums=('a0ae0f29ef01a03cfb3767ad1c6ad879')
sha1sums=('3548b65b66d2187740cfb63323de30c245860c76')

package() {
  _dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -d "${_dest}"/${_feature%*.jar}
      cd "${_dest}"/${_feature/.jar}
      jar xf "${srcdir}/${_feature}" || return 1
    else
      install -Dm644 ${_feature} "${_dest}/${_feature}"
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} "${_dest}/${_plugin}"
  done
}

# vim:set sts=2 sw=2 ts=2 et:
