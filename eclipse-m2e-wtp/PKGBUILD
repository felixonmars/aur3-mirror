# Maintainer: Dieter Hsu <dieterplex[at]gmail[dot]com>
# Contributor: David Morgan <dmorgan81[at]gmail[dot]com>
# Contributor: Andrew Oppenlander <andrew.oppenlander[at]gmail[dot]com>

pkgname=eclipse-m2e-wtp
pkgver=1.1.0
_pkgver="${pkgver}.20140611-1646"
pkgrel=1
pkgdesc="Maven Integration for Eclipse Web Tools Platform"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/m2e-wtp/"
license=('EPL')
depends=('eclipse>=4.3' 'eclipse-m2e>=1.1')
_url="http://download.eclipse.org/m2e-wtp/releases/luna/${pkgver%.*}/${_pkgver}/m2e-wtp"

source=(
    "${_url}/features/org.sonatype.m2e.mavenarchiver.feature_0.16.0.201401211452-signed-20140310144306.jar"
    "${_url}/features/org.eclipse.m2e.wtp.feature_${_pkgver}.jar"
    "${_url}/features/org.eclipse.m2e.wtp.jaxrs.feature_${_pkgver}.jar"
    "${_url}/features/org.eclipse.m2e.wtp.jsf.feature_${_pkgver}.jar"
    "${_url}/plugins/org.sonatype.m2e.mavenarchiver_0.16.0.201401211452-signed-20140310144306.jar"
    "${_url}/plugins/org.eclipse.m2e.wtp.overlay.ui_${_pkgver}.jar"
    "${_url}/plugins/org.eclipse.m2e.wtp.overlay_${_pkgver}.jar"
    "${_url}/plugins/org.eclipse.m2e.wtp_${_pkgver}.jar"
    "${_url}/plugins/org.eclipse.m2e.wtp.jaxrs_${_pkgver}.jar"
    "${_url}/plugins/org.eclipse.m2e.wtp.jsf_${_pkgver}.jar")
noextract=(${source[@]##*/})

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/m2e-wtp/eclipse
  install -dm755 ${_dest}/plugins || return 1

  for url in ${source[@]}
  do 
    _file="${url##*/}"
    _type="${url%/*}"
    _type="${_type##*/}"

    #install -Dm644 ${_file} ${_dest}/${_type}/${_file} || return 1
    if [ ${_type} == 'features' ]; then
        install -dm755 ${_dest}/features/${_file/.jar} 
        cd ${_dest}/features/${_file/.jar}
        jar xf ${srcdir}/${_file} || return 1
    else
        install -Dm644 ${srcdir}/${_file} ${_dest}/plugins || return 1
    fi
  done     
}
# vim:set ts=4 sw=4 et:

md5sums=('5ac94440acfcf1a9e077a97eaddad8b5'
         '72f2086fea7b3f71de785bf848729d2b'
         '5f55b6815a0d88528cf6e3ad9004c0fd'
         '25afee1f7606c04f916f142e754ac072'
         '7933c58fce2669a01d4ce7cab5a9e0fa'
         '76639c13168178247ba5c5f7b6c1921e'
         '1cc5071bc3e57771e0bbba2d560f6797'
         '585719ada772be2ac505844273397a06'
         'af6a44040bf90e5128123ee2ae887ac2'
         '0e67334d8e101e9faeb3bdf289538138')
