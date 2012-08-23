# Maintainer: Nuno Araujo <nuno.araujo@russo79.com>
pkgname=eclipse-redmine-mylyn
pkgver=0.3.7
pkgrel=1
pkgdesc="Eclipse Mylyn plug-in for Redmine bug tracking / project management."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/redmin-mylyncon/"
license=('EPL')
depends=('eclipse' 'eclipse-mylyn')
source=("http://downloads.sourceforge.net/project/redmin-mylyncon/Update-Site-Archive/N/redmine-mylyn_0.3.7.201203072118.zip")

md5sums=('986b9e5e5cc803be5d91b62d9ff9525b')

package() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}/updatesite

  # Features
  find features -type f | while read _feature ; do
    if [[ ${_feature} =~ (.*\.jar$) ]] ; then
      install -dm755 ${_dest}/${_feature%*.jar}
      cd ${_dest}/${_feature/.jar}
      jar xf ${srcdir}/updatesite/${_feature} || return 1
    else
      install -Dm644 ${_feature} ${_dest}/${_feature}
    fi
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
# vim:set ts=2 sw=2 et:
