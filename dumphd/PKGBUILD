# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=dumphd
pkgver="0.61"
pkgrel=5
pkgdesc="A library and program to retrieve decryption keys for HD discs"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=123311"
license=('GPL3')
groups=()
depends=('java-runtime' 'aacskeys')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://deb-multimedia.org/pool/main/d/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz)
noextract=()
sha1sums=('16bc8f8faf0964501d15ef0260c29e8ede4f3fed')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  # Just using binaries for now...
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  mkdir -p ${pkgdir}/usr/share/java/$pkgname
  cp DumpHD.jar ${pkgdir}/usr/share/java/$pkgname/ || return 1
  cp KEYDB.cfg ${pkgdir}/usr/share/java/$pkgname/ || return 1
  ln -s /usr/share/aacskeys/ProcessingDeviceKeysSimple.txt \
    ${pkgdir}/usr/share/java/$pkgname/ProcessingDeviceKeysSimple.txt || return 1
  ln -s /usr/share/aacskeys/HostKeyCertificate.txt \
    ${pkgdir}/usr/share/java/$pkgname/HostKeyCertificate.txt || return 1
  
  mkdir -p ${pkgdir}/usr/bin
  echo "#!/bin/sh

JAR_PATH=/usr/share/java/$pkgname
RUN_PATH=\$HOME/.dumphd

mkdir -p \$RUN_PATH
cp -a \$JAR_PATH/* \$RUN_PATH/

cd \$RUN_PATH
exec java -server -jar DumpHD.jar "\$@"
" >${pkgdir}/usr/bin/dumphd
  chmod +x ${pkgdir}/usr/bin/dumphd
}

# vim:set ts=2 sw=2 et:
