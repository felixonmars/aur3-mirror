# Maintainer: Marcel Huber <marcelhuberfoo at gmail dott com>
# Contributor: Markus M. May <mmay AT javafreedom DOT org>
# Contributor: Yahya Mohajer < yaya_2013 At yahoo Dot com >

pkgname=hudson
pkgver=3.1.0
pkgrel=1
epoch=
pkgdesc="Extensible continuous integration server"
arch=(any)
url="http://hudson-ci.org"
license=('EPL')
groups=()
depends=(java-runtime ttf-dejavu libcups)
makedepends=()
checkdepends=()
optdepends=()
provides=(hudson)
conflicts=(hudson)
replaces=(hudson)
backup=(etc/conf.d/hudson)
options=()
install=hudson.install
changelog=
source=(http://hudson-ci.org/downloads/war/$pkgver/hudson.war
        hudson.conf
        hudson.service
        hudson.tmpfiles.d
        )
noextract=(hudson.war)
sha256sums=('0d72041645cc9e804d67f5e34a09be1348086d05c9268246933047150ce846d1'
            '514f755b90bcb3a88339ab7f4104e9b7fcfebe70038abc008fa8acf450b1a531'
            '00a96b88bb9e98d14697e7e9eb443b0785f074eb1bbba207d3e7dd30d10ebbdf'
            'c61cbcf85c887379a605c1908b5474599b0fce25bd2f8dd567da3ace6a631b08')
package() {
  install -D -m 444 "$srcdir/hudson.war" "$pkgdir/usr/share/java/hudson/hudson.war"
  install -D -m 644 "$srcdir/hudson.service" "$pkgdir/usr/lib/systemd/system/hudson.service"
  install -D -m 644 "$srcdir/hudson.tmpfiles.d" "$pkgdir/usr/lib/tmpfiles.d/hudson.conf"
  install -D -m 644 "$srcdir/hudson.conf" "$pkgdir/etc/conf.d/hudson"
}

# vim:set ts=2 sw=2 et:

