# Maintainer: Romain Schmitz <myself at slopjong dot de>

pkgname=eclipse-axis2-codegen
pkgver=1.6.2
pkgrel=1
pkgdesc="Code generator tools including java2wsdl and wsdl2java."
arch=('any')
url="http://axis.apache.org/axis2/java/core/"
license=('APACHE')
_eclipseversion=3.5
depends=('eclipse>='"$_eclipseversion"'' )
#makedepends=('unzip')

source=('http://ftp.halifax.rwth-aachen.de/apache/axis/axis2/java/core/1.6.2/axis2-eclipse-codegen-plugin-1.6.2.zip')
md5sums=('420acffa1e8f94bdfd271be98098b63f')

build()
{
    return 0;
}

package()
{    
    _dest=${pkgdir}/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
    mkdir -p ${_dest}
    if [ -d "${srcdir}/plugins" ]; then
	mv ${srcdir}/plugins ${_dest}
    fi
    if [ -d "${srcdir}/features" ]; then
	mv ${srcdir}/features ${_dest}
    fi
}
