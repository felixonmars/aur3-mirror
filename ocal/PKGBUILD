# Maintainer: Edward Tjörnhammar <xhemi@cube2.se>
# Contributor: Edward Tjörnhammar <xhemi@cube2.se>
pkgname=ocal
pkgver=10.1.2.3
pkgrel=1
pkgdesc="Oracle Calendar Client from Oracle Colaboration Suite."
arch=( i686 )
url="http://www.oracle.com/technology/products/ocal/index.html"
source="http://download.oracle.com/otn/nt/ocs_clients/1012/cal_linux_1012.tar.gz"
license=('OTN License Agreement')
depends=('libstdc++5')
md5sums=('4c7e7f913dec93e4673a50024d30feb3')

build() {
  _D=$startdir/pkg
  _S=$startdir/src/OracleCalendar_inst
  _R=/opt/OracleCalendar
  _DR=$_D/$_R
  pushd $_S
  cp cal_linux cal_linux.bak
  cat cal_linux.bak | sed "s/export LD_ASSUME_KERNEL/#xport LD_ASSUME_KERNEL/" > cal_linux
  echo "USER_INSTALL_DIR=$_DR" > ocal_conf/silent.properties
  echo "USER_SHORTCUTS=$_D/usr/bin" >> ocal_conf/silent.properties
  echo "INSTALLER_UI=silent" >> ocal_conf/silent.properties
  ./silent_install.sh
  sed -i -e "s#^OCALENDAR_ROOT=/.*#OCALENDAR_ROOT=$_R#g" $_DR/bin/ocal
  rm $_D/bin/ocal
  ln -s $_R/bin/ocal $_D/usr/bin/ocal
  popd
}
