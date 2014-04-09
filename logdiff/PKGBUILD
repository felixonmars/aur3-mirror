# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='logdiff'
pkgver=0.1
pkgrel=1
pkgdesc="A tool for identifying patterns and changes in log files"
arch=('any')
license=('MIT')
depends=('python')
url="http://github.com/stilvoid/logdiff"
source=('LICENSE' 'logdiff')
md5sums=('a342bcec3a883b8109ac84913eb040d4'
         'c2f1dd0591fb5565731db90509ff954f')

package() {
    install -Dm64 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 "${srcdir}/logdiff" "${pkgdir}/usr/bin/logdiff"
}
