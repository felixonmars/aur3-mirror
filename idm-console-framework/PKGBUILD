# Maintainer: Yonathan Dossow <ydossow@archlinux.cl>
# Contributor: Yonathan Dossow <ydossow@archlinux.cl>
pkgname=idm-console-framework
pkgver=1.1.7
pkgrel=2
pkgdesc="A Java Management Console framework used for remote server management."
arch=('x86_64')
url="http://directory.fedoraproject.org"
license=('GPL')
groups=()
depends=('ldapjdk' 'jss')
makedepends=('apache-ant' 'java-environment')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://directory.fedoraproject.org/sources/$pkgname-$pkgver.tar.bz2)
noextract=()
md5sums=('14bfcf3848b57711a665b3cea45756ea') #generate with 'makepkg -g'

major_version=1.1

build() {
  cd "$srcdir/$pkgname-$pkgver"

  /usr/bin/ant -Dlib.dir=/usr/lib \
    -Dbuilt.dir=`pwd`/built \
    -Dclassdest=/usr/share/java

  install -d $pkgdir/usr/share/java
  install -m644 built/release/jars/idm-console-* $pkgdir/usr/share/java/


  cd $pkgdir/usr/share/java
  ln -s idm-console-base-${pkgver}.jar idm-console-base-${major_version}.jar
  ln -s idm-console-base-${pkgver}.jar idm-console-base.jar
  ln -s idm-console-mcc-${pkgver}.jar idm-console-mcc-${major_version}.jar
  ln -s idm-console-mcc-${pkgver}.jar idm-console-mcc.jar
  ln -s idm-console-mcc-${pkgver}_en.jar idm-console-mcc-${major_version}_en.jar
  ln -s idm-console-mcc-${pkgver}_en.jar idm-console-mcc_en.jar
  ln -s idm-console-nmclf-${pkgver}.jar idm-console-nmclf-${major_version}.jar
  ln -s idm-console-nmclf-${pkgver}.jar idm-console-nmclf.jar
  ln -s idm-console-nmclf-${pkgver}_en.jar idm-console-nmclf-${major_version}_en.jar
  ln -s idm-console-nmclf-${pkgver}_en.jar idm-console-nmclf_en.jar                                                            


}

# vim:set ts=2 sw=2 et:
