# Contributor: Jonathan Arnold <jdarnold@buddydog.org>

pkgname=eclipse-p4
pkgver=12.3
pkgrel=3
pkgdesc="Eclipse plugin for Perforce support"
url="http://www.perforce.com/product/components/eclipse_plugin"
arch=('any')
license=('custom:p4')
depends=('p4' 'eclipse')
makedepends=('')
conflicts=('')
provides=('eclipse-p4')
source=(ftp://ftp.perforce.com/perforce/r${pkgver}/bin.java/p4eclipse42.zip)
md5sums=('52e5e8741dd08a97fe8e128733178789')

package() {

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}

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
