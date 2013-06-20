# Maintainer: fordprefect <g.schlisio@dukun.de>
pkgname=incredipede
pkgver=1
pkgrel=5
pkgdesc="incredipede game about live and feet (flash game)"
url="http://www.incredipede.com"
arch=('any')
license=('free as in beer')
optdepends=('flashplugin'
            'chromium')
install='incredipede.install'
source=("http://commondatastorage.googleapis.com/incredipede/Incredipede.tar.gz"
        "incredipede.install")
md5sums=('9618d207bad05839d68af33554b7f74b'
         '2ffe5e17e56e0ec7ca709030871e3e26')
 
package() {
    mkdir -p ${pkgdir}/opt/incredipede
    cp -r ${srcdir}/Incredipede/data/* ${pkgdir}/opt/incredipede
    mkdir -p ${pkgdir}/usr/bin
    echo "#!/usr/bin/bash" > ${pkgdir}/usr/bin/incredipede
    echo "chromium --ignore-gpu-blacklist /opt/incredipede/Incredipede.html" >> ${pkgdir}/usr/bin/incredipede
    chmod a+x ${pkgdir}/usr/bin/incredipede
}
