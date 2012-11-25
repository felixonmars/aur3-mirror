# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Andrew Wright <andreww@photism.org>

pkgname=hsqldb-java-updated
pkgver=1.8.1.3
pkgrel=1
epoch=1
pkgdesc="HSQLDB Java libraries"
arch=('any')
url="http://hsqldb.org/"
license=('custom')
provides=("hsqldb-java=${pkgver}")
conflicts=('hsqldb-java')
makedepends=('unzip' 'apache-ant')
source=("http://downloads.sourceforge.net/sourceforge/hsqldb/hsqldb_${pkgver//./_}.zip"
        # Fedora's patches
        'hsqldb-jdbc-4.1.patch')
sha512sums=('0483ca3299b63b4931b07d49588c729231efca76a317b9620abbd5039127f3f79449eaa1e9d29c52782c58bdb0cc4879b1e3f30f669d2c02c880818f531a8442'
            'aa2b1fc2aa4e55b105f2dceffa1d3fa556203e15be84e6d7f9d6e00fd39061bb5a905fdb660dd32469ba4f5b172556797272a0ff1bb0b3001b0596f27d292401')

build() {
  [ -z "${ANT_HOME}" ] && . /etc/profile.d/apache-ant.sh

  cd "${srcdir}/hsqldb/"

  patch -p1 -i "${srcdir}/hsqldb-jdbc-4.1.patch"

  cd build/

  ant -Dbuild.sysclasspath=first jar
}

package() {
  cd "${srcdir}/hsqldb/build/"

  install -dm755 "${pkgdir}/usr/share/java"
  install -m644 "${srcdir}/hsqldb/lib/hsqldb.jar" "${pkgdir}/usr/share/java/"

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 "${srcdir}/hsqldb/doc/hsqldb_lic.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim:set ts=2 sw=2 et:
