# Maintainer  : Firef0x <Firefgx {at) gmail [dot} com>
# Contributor : Firef0x <Firefgx {at) gmail [dot} com>

pkgname=eclipse-class-decompiler
pkgver=1.0.3
pkgrel=1
pkgdesc="Eclipse plugin that seamlessly integrates Jad, JD-Core and Eclipse Class Viewer."
arch=('any')
url="http://www.blogjava.net/cnfree/archive/2012/10/30/390457.html"
license=('EPL')
depends=('eclipse')
source=('http://feeling.sourceforge.net/downloads/org.sf.feeling.decompiler_1.0.3.zip')
md5sums=('b4cc630dd719eda7026952f8af7d89fa')
sha1sums=('bd4316557e147a9adab35d7c4f3b53cb03b5e0cf')

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
