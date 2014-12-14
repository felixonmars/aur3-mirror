# Maintainer : Firef0x <Firefgx (at} gmail {dot) com>
# Contributor: Firef0x <Firefgx (at} gmail {dot) com>
# Contributor: Luca Cesari <mirshann@freakmind.org>

pkgname=eclipse-regexutil
pkgver=1.2.4
pkgrel=2
pkgdesc="Eclipse plugin for testing/editing regular expressions flavor of the Java standard API"
url="http://myregexp.com/eclipsePlugin.html"
arch=('any')
license=('GPL2')
depends=('eclipse')
source=("http://sourceforge.net/projects/regex-util/files/regex-util/${pkgver}/com.ess.regexutil_${pkgver}.jar")
noextract=("com.ess.regexutil_${pkgver}.jar")
md5sums=('3d8030f41c8c02dbc67b12b1090e424f')
sha1sums=('b3ee06f895015cd7812c4fa416ed33d9b5e6efba')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse/plugins
  _plugin=com.ess.regexutil_${pkgver}.jar

  # Install plugins
  install -Dm644 ${_plugin} "${_dest}/${_plugin}"
}

# vim:set ts=2 sw=2 et:
