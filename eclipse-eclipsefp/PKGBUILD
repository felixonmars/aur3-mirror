# Maintainer: toiffel <toiffel@inbox.ru>
# Contributor: Daniel Ehlers <danielehlers@mindeye.net>
pkgname=eclipse-eclipsefp
pkgver=2.6.4
pkgrel=1
_pkgdate=201501291630
pkgdesc="Haskell support for Eclipse"
arch=('i686' 'x86_64')
url="http://eclipsefp.github.io/"
license=('EPL')
depends=('eclipse' 'ghc' 'cabal-install')
source=("http://sourceforge.net/projects/eclipsefp/files/EclipseFP 2 branch/${pkgver}/net.sf.eclipsefp.haskell_${pkgver}.${_pkgdate}.zip")
md5sums=('cbd9c373ca7fc116a51c0dc6b7642bf2')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      # extract features (otherwise they are not visible in about dialog)
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
