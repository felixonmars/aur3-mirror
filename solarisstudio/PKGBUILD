# Maintainer: Karsten Pedersen <kpedersen@opencde.org>

pkgname=solarisstudio
pkgver=12.2
pkgrel=2
pkgdesc="an integrated C/C++ compiler and IDE"
url="http://www.oracle.com"
license=('custom')
arch=('i686')
source=(http://download.oracle.com/otn/solaris/studio/SolarisStudio12.2-linux-x86-tar-ML.tar.bz2
        solstudio
        jdk_chooser_ide)
depends=('java-environment')
noextract=('SolarisStudio12.2-linux-x86-tar-ML.tar.bz2')
md5sums=('b5d8527ab0eb2232d97f93893116828f'
         '98b92804c6eae9e622d8b213094949c4'
         '98bd80140197339dae33d06ffdd7e8d7')

build() {
  cd $srcdir
  mkdir -p ${pkgdir}/opt
  tar -C ${pkgdir}/opt -xf *.bz2
  cd ..
  cp solstudio ${pkgdir}/opt/SolarisStudio12.2-linux-x86-tar-ML/solstudio12.2/bin/solstudio
  cp jdk_chooser_ide ${pkgdir}/opt/SolarisStudio12.2-linux-x86-tar-ML/solstudio12.2/prod/bin/jdk_chooser_ide
  mkdir -p ${pkgdir}/etc/profile.d
  echo 'export PATH=$PATH:/opt/SolarisStudio12.2-linux-x86-tar-ML/solstudio12.2/bin' > ${pkgdir}/etc/profile.d/solstudio.sh
  chmod +x ${pkgdir}/etc/profile.d/solstudio.sh
}

