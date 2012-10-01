# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-ci
pkgver=1.484
pkgrel=1
epoch=
pkgdesc="An extendable open source continuous integration server"
arch=(any)
url="http://jenkins-ci.org"
license=('CCPL')
groups=()
depends=(java-runtime sudo net-tools)
makedepends=()
checkdepends=()
optdepends=()
provides=(jenkins)
conflicts=(jenkins)
replaces=(jenkins)
backup=(etc/conf.d/jenkins etc/logrotate.d/jenkins)
options=()
install=jenkins-ci.install
changelog=changelog
source=(http://mirrors.jenkins-ci.org/war/$pkgver/jenkins.war
        jenkins.conf
        jenkins.rcd
        jenkins.systemd
        logrotate)
noextract=(jenkins.war)
sha256sums=("18549ec0491f9ac7864e966f780298caf3835282b441578ffde9bfc83170f15c" "a4b62cc77c23d489249637cb76b5097735bcd9af0563734d16449a3429fe9871" "508b6b938b41f160d585d50b013fe3e445fdf1d540108e14cad9f1d32d209bfd" "51f0c2b0e0d53e9fd03b47821bb24c62a97de8d2e22f36a742baa25d0068e74f" "2a43bf75c47dd237c510bb02ce2257cc0b75b072850cc89c0436a5039dabde96")
package() {
  install -D -m 444 "$srcdir/jenkins.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -D -m 755 "$srcdir/jenkins.rcd" "$pkgdir/etc/rc.d/jenkins"
  install -D -m 644 "$srcdir/jenkins.systemd" "$pkgdir/etc/systemd/system/jenkins.service"
  install -D -m 644 "$srcdir/jenkins.conf" "$pkgdir/etc/conf.d/jenkins"
  install -D -m 644 "$srcdir/logrotate" "${pkgdir}/etc/logrotate.d/jenkins"
  install -m 755 -d "$pkgdir/var/log/jenkins"
  install -m 755 -d "$pkgdir/var/lib/jenkins"
  install -m 755 -d "$pkgdir/var/cache/jenkins/war"
}

# vim:set ts=2 sw=2 et:

