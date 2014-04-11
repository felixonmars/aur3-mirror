# Maintainer: Prurigro
# Contributor: Neal <neal.oakey-at-oakey-dev.de>

pkgname=cacert-dot-org
pkgver=20140223
pkgrel=5
pkgdesc='CAcert.org is a community-driven Certificate Authority that issues certificates to the public at large for free'
arch=('any')
url='http://www.cacert.org'
license=('GPL')
groups=('archassault-misc')
source=("http://www.cacert.org/certs/root.crt"
        "http://www.cacert.org/certs/class3.crt")
depends=('ca-certificates')
install="${pkgname}.install"
sha512sums=('7350f2604e9839f1c2d02926fd4299468ffe2c456ba57a396575cfbb5b2b91fa3cb0e049f6cf3e1406d02014e420e263d6b0c4a59c51d0f03a735bfaa56ec7cc'
            '416ceb36aa399f5116c617d470545a04e56bba2282e18fa7c1cc68271d8ac2e7b5787c7ea0f759794351f6e1ad77c76301664db10587046b2b269b274098845c')
package() {
    [[ "$(openssl x509 -noout -fingerprint -in root.crt)" == "SHA1 Fingerprint=13:5C:EC:36:F4:9C:B8:E9:3B:1A:B2:70:CD:80:88:46:76:CE:8F:33" ]] && install -Dm644 root.crt "${pkgdir}/usr/share/ca-certificates/cacert.org/cacert.org_root.crt"
    [[ "$(openssl verify -CAfile root.crt -verbose class3.crt)" == "class3.crt: OK" ]] && install -Dm644 class3.crt "${pkgdir}/usr/share/ca-certificates/cacert.org/cacert.org_class3.crt"
}
