# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-mercurialeclipse
pkgver=1.7.0
_pkgbuild=201006082155
pkgrel=2
pkgdesc="Eclipse plugin for Mercurial version system"
url="http://javaforge.com/project/HGE"
arch=('any')
license=('EPL')
depends=('eclipse' 'mercurial')
changelog=$pkgname.changelog
source=("http://javaforge.com/displayDocument/mercurialeclipse_${pkgver}.${_pkgbuild}.jar?doc_id=88035"
        "http://javaforge.com/displayDocument/com.vectrace.MercurialEclipse_${pkgver}.${_pkgbuild}.jar?doc_id=88034")
md5sums=('dece165b5edba870befdb50ec65940ed'
         'bdf2fd808bf2517589ad21d26719d26e')
sha256sums=('45b4f7e369ad5f63d0d2509a73669d2762ba062c952155a6c72d63587262ee4b'
            'fb91ab248858a4a3cf903f833216fcc307e188a8c9f98c0984c71c76f2e80966')

build() {

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  mkdir ${srcdir}/{features,plugins} || return 1
  cp $startdir/mercurialeclipse_1.7.0.201006082155.jar?doc_id=88035 ${srcdir}/features/mercurialeclipse_1.7.0.201006082155.jar || return 1
  cp $startdir/com.vectrace.MercurialEclipse_1.7.0.201006082155.jar?doc_id=88034 ${srcdir}/plugins/com.vectrace.MercurialEclipse_1.6.0.v201005111545.jar || return 1
  
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
