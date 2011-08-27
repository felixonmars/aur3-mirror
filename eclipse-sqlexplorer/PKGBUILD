# Contributor: Vasily Ryabov <me@ryvasy.net>
pkgname="eclipse-sqlexplorer"
pkgver="3.6.1"
pkgrel="1"
pkgdesc="Eclipse SQL Explorer is a thin SQL client that allows you to query and browse any JDBC compliant database. It supports plugins with specialized functionality for individual databases (Oracle, DB2 and MySQL)."
url="http://eclipsesql.sourceforge.net/"
license=('Eclipse public license')
arch=('i686' 'x86_64')
depends=('eclipse>=3.2')
source=("http://downloads.sourceforge.net/project/eclipsesql/SQL%20Explorer%20Plugin/${pkgver}/sqlexplorer_plugin-${pkgver}.zip")
md5sums=('78ce98226de75d9b9d67119a6c232d54')

build() {
  mkdir -p ${startdir}/pkg/usr/share/eclipse/
  cp -R ${startdir}/src/features ${startdir}/pkg/usr/share/eclipse/
  cp -R ${startdir}/src/plugins ${startdir}/pkg/usr/share/eclipse/
}
