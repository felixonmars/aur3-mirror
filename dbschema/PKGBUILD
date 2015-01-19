# Maintainer: Morris Jobke <morris.jobke AT gmail DOT com>
# Contributor: Boris Shomodjvarac <shomodj AT gmail DOT com>
pkgname=dbschema
pkgver=6.4.0.4097
pkgrel=1
pkgdesc='Relational Data Browse, Query Builder, SQL Editor, schema deployment and synchronization.'
arch=('i686' 'x86_64')
url='http://www.dbschema.com/'
license='custom'
depends=('java-runtime')
source=("http://www.dbschema.com/DbSchema.zip" "dbschema")

package(){
  install -dm755 ${pkgdir}/opt
  cp -r DbSchema ${pkgdir}/opt/${pkgname}

  chmod 755 ${pkgdir}/opt/${pkgname}/DbSchema.sh

  install -Dm755 dbschema ${pkgdir}/usr/bin/dbschema
}

sha1sums=('3f17452f3bdd3bfc071a50f63825b2f246652daa'
          '8b073fd8d750f92cd5012d9d13c374a978966e2f')

md5sums=('d5c66eeb3da14cae378fc992e787ef42'
         '6c73b1b14f18a5ec67665da711a6b15b')
