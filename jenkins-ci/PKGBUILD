# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-ci
pkgver=1.521
pkgrel=1
epoch=
pkgdesc="An extendable open source continuous integration server"
arch=(any)
url="http://jenkins-ci.org"
license=('MIT')
groups=()
depends=(java-runtime ttf-dejavu libcups)
makedepends=()
checkdepends=()
optdepends=()
provides=(jenkins)
conflicts=(jenkins)
replaces=(jenkins)
backup=(etc/conf.d/jenkins)
options=()
install=jenkins-ci.install
changelog=changelog
source=(http://mirrors.jenkins-ci.org/war/$pkgver/jenkins.war
        jenkins.conf
        jenkins.service
        jenkins.tmpfiles.d
        LICENSE)
noextract=(jenkins.war)
sha256sums=('a48d8f82de2c96e09977f22b1bbb024c13066b2e75e734a0c5aa1cf980ade88c'
            '13b6e06de1dedff96bdb8e43f6830bbd954dc58df9d4ed5583693d2a6f8427f4'
            '6ffdcec6c06105710886ff48d3d12bc8cc9cc0f642718c165f658f6475fb268f'
            '0ccff16308b01b02f2699ea64a73b8dce1e1990ee1c656aa8d6119dee510262e'
            'd9f107920982cb61d807e349b4eaf190b2d593047e55d3f3ad286c7afe06cf55')
package() {
  install -D -m 444 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/jenkins-ci/LICENSE"
  install -D -m 444 "$srcdir/jenkins.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -D -m 644 "$srcdir/jenkins.service" "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -D -m 644 "$srcdir/jenkins.tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/jenkins.conf"
  install -D -m 644 "$srcdir/jenkins.conf" "$pkgdir/etc/conf.d/jenkins"
}

# vim:set ts=2 sw=2 et:

