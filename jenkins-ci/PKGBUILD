# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-ci
pkgver=1.502
pkgrel=1
epoch=
pkgdesc="An extendable open source continuous integration server"
arch=(any)
url="http://jenkins-ci.org"
license=('MIT')
groups=()
depends=(java-runtime ttf-dejavu dialog)
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
        LICENSE)
noextract=(jenkins.war)
sha256sums=("1ff9ccc717be382d0cff23addc88dc2c5f891922130e0df134d3a16ab791fb0c" "27f78ce76729c7af3efa70b133d376c92cd2d361d1c8b5abb90b3f6e59108ed0" "6ffdcec6c06105710886ff48d3d12bc8cc9cc0f642718c165f658f6475fb268f" "d9f107920982cb61d807e349b4eaf190b2d593047e55d3f3ad286c7afe06cf55")
package() {
  install -D -m 444 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/jenkins-ci/LICENSE"
  install -D -m 444 "$srcdir/jenkins.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -D -m 644 "$srcdir/jenkins.service" "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -D -m 644 "$srcdir/jenkins.conf" "$pkgdir/etc/conf.d/jenkins"
  install -m 755 -d "$pkgdir/var/lib/jenkins"
  install -m 755 -d "$pkgdir/var/cache/jenkins/war"
}

# vim:set ts=2 sw=2 et:

