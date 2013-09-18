# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=gtop
_pkgname=gluster-monitor
pkgver=1.0.1
pkgrel=1
pkgdesc="SNMP based CLI tool for monitoring capacity and node performance of a gluster cluster"
arch=('i686' 'x86_64')
url="https://github.com/pcuzner/gluster-monitor"
license=('GPL')
depends=('python2')
source=("https://github.com/pcuzner/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('04187149670c6ee6ffe62cdffd1396038488a1ba35e91f51b5a8c8ad00aa1fd5c4aab76af8ff7ccc5f9d1a90af205e7ca65ac4a47f47656a55cddf8681b965aa')
prepare() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    sed -i '1s/python/python2/' gtop.py 
}
package () {
    cd "$srcdir/${_pkgname}-${pkgver}"
    install -Dm755 "gtop.py" "${pkgdir}/usr/bin/gtop"
    mkdir -p ${pkgdir}/usr/share/$pkgname
    cp gtoprc.xml gtop_* snmpd.conf_example "${pkgdir}/usr/share/${pkgname}/"
}

# vim:set ts=4 sw=4 et:
