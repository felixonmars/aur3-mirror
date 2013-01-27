# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-ci
pkgver=1.500
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
sha256sums=("bac89a7e85346db354e9ef402af5b6fc61153a7499d60bc6b43abe29520da002" "90ec818b1b47029994fdb97bf08b6ae215487f3bd343ebf97ce4a75b691d18a4" "fe03b4094e7ce2a016a7b0aca9d71ba4e7beac06625852b17d53080b6576d78b" "d9f107920982cb61d807e349b4eaf190b2d593047e55d3f3ad286c7afe06cf55")
package() {
  install -D -m 444 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/jenkins-ci/LICENSE"
  install -D -m 444 "$srcdir/jenkins.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -D -m 644 "$srcdir/jenkins.service" "$pkgdir/usr/lib/systemd/system/jenkins.service"
  install -D -m 644 "$srcdir/jenkins.conf" "$pkgdir/etc/conf.d/jenkins"
  install -m 755 -d "$pkgdir/var/lib/jenkins"
  install -m 755 -d "$pkgdir/var/cache/jenkins/war"
}

# vim:set ts=2 sw=2 et:

