# Maintainer: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=eclipse-gpe
pkgver=2.4.1
_eclipseversion=3.7
pkgrel=2
pkgdesc="Google Plugin for Eclipse"
arch=('any')
url="http://code.google.com/eclipse/"
license=('custom')
depends=('eclipse>='"$_eclipseversion"'' 'eclipse-wtp-wst' 'eclipse-mylyn')
makedepends=('unzip')
source=(http://commondatastorage.googleapis.com/eclipse_toolreleases/products/gpe/release/${pkgver}/${_eclipseversion}/com.google.gdt.eclipse.suite.${_eclipseversion}.update.site_${pkgver}.zip)
md5sums=('9135c5041cccf583e598cd12b898fee5')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

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

