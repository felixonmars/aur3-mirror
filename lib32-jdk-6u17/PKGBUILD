# Contributor: Janax <janax99@yahoo.com>
# Maintainer: Kaivalagi <m_buck@hotmail.com>
# Category: lib

pkgname=lib32-jdk-6u17
pkgver="6.0u17"
pkgrel=6
pkgdesc="32bit version of Sun's J2SE Development Kit and runtime environment"
url="http://java.sun.com/javase/6/"
arch=('x86_64')
groups=('lib32')
license="dlj-1.1"
depends=('lib32-libstdc++5' 'lib32-libsm' 'lib32-libx11' 'lib32-libxau' 'lib32-libxdmcp' 'lib32-libxext' 'lib32-libxi' 'lib32-libxp' 'lib32-libxt' 'lib32-libxtst')
provides=('java-environment' 'j2sdk' 'jre' 'jdk' 'j2re' 'java-runtime')
install="lib32-jdk-6u17.install"

_bin_file=jdk-6u17-dlj-linux-i586.bin

source=(http://download.java.net/dlj/binaries/${_bin_file}
      	https://jdk-distros.dev.java.net/source/browse/*checkout*/jdk-distros/trunk/utils/construct.sh
        lib32-jdk-6u17.profile)
md5sums=('3011863492d567a5b1f847c327ceed67'
         '94065b612df0046d9ae758943f9f6a75'
         'cc95939885417666879034f67b71e741')

build() {
  cd ${startdir}/src

  mkdir unbundle-jdk
  cd unbundle-jdk

  sh ../${_bin_file} --accept-license

  cd ..

  sh construct.sh unbundle-jdk linux-jdk linux-jre

  rm linux-jdk/src.zip

  mkdir -p ${startdir}/pkg/opt
  mv linux-jdk ${startdir}/pkg/opt/java32

  install -D -m644 ${startdir}/src/${pkgname}.profile ${startdir}/pkg/etc/profile.d/${pkgname}.sh

}

