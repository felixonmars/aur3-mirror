# Contributor: muni <muni0x0@gmail.com>

pkgname=eclipse-pleiades
pkgver=1.3.3
pkgrel=1
pkgdesc="Japanese Language package for Eclipse using Dynamic AOP"
url="http://mergedoc.sourceforge.jp/index.html"
license=('EPL', 'MPL', 'LGPL', 'Apache')
arch=('any')
depends=('eclipse>=3.4')
install=${pkgname}.install
source=("http://fr.sourceforge.jp/frs/redir.php?m=jaist&f=/mergedoc/52508/pleiades_${pkgver}.zip")
md5sums=('d59c7eaf4a5187e38ba8af24be4d0a24')

build() {
  _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse

  cd ${srcdir}

  # Features
  find features -type f | while read _feature ; do
    install -Dm644 ${_feature} ${_dest}/${_feature}
  done

  # Plugins
  find plugins -type f | while read _plugin ; do
    install -Dm644 ${_plugin} ${_dest}/${_plugin}
  done
}
