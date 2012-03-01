# Maintainer: Illarion Kovalchuk <illarion.kovalchuk@gmail.com>

pkgname=jenkins-ci
pkgver=1.452
pkgrel=2
epoch=
pkgdesc="An extendable open source continuous integration server"
arch=(any)
url="http://jenkins-ci.org"
license=('CC')
groups=()
depends=(java-environment sudo ttf-dejavu fontconfig)
makedepends=()
checkdepends=()
optdepends=()
provides=(jenkins)
conflicts=(jenkins)
replaces=(jenkins)
backup=()
options=()
install=jenkins-ci.install
changelog=
source=(http://mirrors.jenkins-ci.org/war/latest/jenkins.war
        jenkins)
noextract=(jenkins.war)

md5sums=('ca6574d7fa23e15b77659fc3d14c6f40'
         'd5376ccf21d9990a2ea2ea2da8f9ae58')


package() {
  install -D -m 444 "$srcdir/jenkins.war" "$pkgdir/usr/share/java/jenkins/jenkins.war"
  install -D -m 755 "jenkins" "$pkgdir/etc/rc.d/jenkins"
  mkdir -p $pkgdir/var/lib/jenkins
}

# vim:set ts=2 sw=2 et:
