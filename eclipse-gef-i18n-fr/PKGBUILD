# Maintainer: Stéphane Marguet - Stemp <smarguet@gmail.com>

pkgname=eclipse-gef-i18n-fr
pkgver=4.2.0
_pkgbuild=v20120721043402
pkgrel=1
pkgdesc="French language for GEF framework for the Eclipse platform"
url="http://babel.eclipse.org/"
arch=('any')
license=('EPL')
changelog=ChangeLog
depends=('eclipse-gef')
makedepends=('unzip')
_mirror="http://www.eclipse.org/downloads/download.php?r=1&file="
source=("$_mirror/technology/babel/babel_language_packs/R0.10.0/juno/BabelLanguagePack-tools.gef-fr_${pkgver}.${_pkgbuild}.zip")
sha256sums=('04daad8c7003f836a91f11f9eca1413bf31925297e3e24f4820615efa82fe3f8')

build() {
  return 0
}

package() {
#  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-/-i18n-fr}/eclipse
  _dest=${pkgdir}/usr/share/eclipse/dropins/gef/eclipse

  cd ${srcdir}/eclipse

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done

}
