pkgname=eclipseme
pkgver=1.7.9
pkgrel=1
pkgdesc="J2ME Development using Eclipse"
arch=('i686' 'x86_64')
url="http://www.eclipse.org/mylyn/"
license=('EPL')
depends=('eclipse' 'sun-wtk')
optdepends=('bugzilla: ticketing support')
source=('http://downloads.sourceforge.net/project/eclipseme/eclipseme/1.7.9/eclipseme.feature_1.7.9_site.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Feclipseme%2Ffiles%2Feclipseme%2F1.7.9%2F&ts=1325856471&use_mirror=nchc')
md5sums=('bdf84e7a7f72d0879644cb8bb4aa338b')

build() {
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
