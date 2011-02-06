# Contributor: Jesus Jerez <jhuss@archlinux.org.ve>

pkgname=eclipse-gef-runtime
pkgver=3.6.1
_pkgbuild=M201007121555
pkgrel=1
pkgdesc="GEF runtime only for the Eclipse platform"
url="http://www.eclipse.org/gef/"
arch=('any')
license=('EPL')
depends=('eclipse')
makedepends=('unzip')
conflicts=('eclipse-gef')
provides=('eclipse-gef')
changelog=$pkgname.changelog
source=("http://download.eclipse.org/tools/gef/downloads/drops/${pkgver}/${_pkgbuild}/GEF-runtime-${_pkgbuild}.zip"
        "http://download.eclipse.org/tools/gef/downloads/drops/${pkgver}/${_pkgbuild}/GEF-zest-${_pkgbuild}.zip")
md5sums=('4a1c9bac6243b8d4a499d69f7a609765'
         '733b3f205c2d8797a6a9747ad1e43801')
sha256sums=('956824a2bca27e142140e88fb15d0431c5fbbcaf924fe374f00c4578b01c83b2'
            'dfc3c13c4fc970eb0895ed50fdf8e405ebe792c8aec411a63f94fb5823392b60')

build() {

  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

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
