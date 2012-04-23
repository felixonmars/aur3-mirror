# Maintainer: Jing Hao <hao3039032@gmail.com>

pkgname=eclipse-egit-another
pkgver=1.3.0.201202151440
pkgrel=1
pkgdesc="An Eclipse Team provider for the Git version control system"
arch=('i686' 'x86_64')
url="http://eclipse.org/egit/"
license=('EPL')
depends=('eclipse>=3.6' 'eclipse-mylyn>=3.5')
source=("http://download.eclipse.org/egit/updates-1.3/org.eclipse.egit-updatesite-1.3.0.201202151440-r-site.zip")
md5sums=('fdd0112765cabf87ee12ba1aa5f03537')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}
  find features -name '*source*' -exec rm {} \;
  find plugins -name '*source*' -exec rm {} \;
  
  # Features
  find features -type f | while read _feature ; do
    echo ${_feature}
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
    echo ${_plugin}
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}

