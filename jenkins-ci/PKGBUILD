# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Illarion Kovalchuk <illarion.kovalchuk at gmail dot com>

pkgname=jenkins-ci
pkgver=1.477
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
sha256sums=("3330beb7fef7f1bd9509a66bf9d0da90b68ded08cf1f2b9e306e7790d035d505" "c29fe63229ee3c5a5bef31e2d70f715480bb360a14e78c1f9d464fab10375646" "d026a85b90d7b9d1ab4b7c512fe0e373db73ad5ef86f399631dc323eddae3ddc" "cb6d39c7b9fd23c2176cf81eb1eda0cae7a2a36e9c031b0748a26ad4bf1a46e2" "2a43bf75c47dd237c510bb02ce2257cc0b75b072850cc89c0436a5039dabde96")
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

