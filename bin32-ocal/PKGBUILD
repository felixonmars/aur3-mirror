# Maintainer: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Ray Kohler <ataraxia937 at gmail dot com>
# Contributor: Edward Tjörnhammar <xhemi at cube2 dot se>
pkgname=bin32-ocal
pkgver=10.1.2.3
pkgrel=1
pkgdesc="Oracle Calendar Client from Oracle Colaboration Suite."
arch=( 'x86_64' )
url="http://www.oracle.com/technology/products/ocal/index.html"
source=("http://download.oracle.com/otn/nt/ocs_clients/1012/cal_linux_1012.tar.gz" "license.txt")
license=('custom:OTN')
depends=('lib32-libstdc++5' 'lib32-libxp' 'lib32-libxt' 'lib32-libxtst' 'lib32-libxmu' 'lib32-libxpm')
md5sums=('4c7e7f913dec93e4673a50024d30feb3'
         'ece98fe3d17ee7e5dcf6efcc7d70e401')

build() {
  _D=${pkgdir}
  _S=${srcdir}/OracleCalendar_inst
  _R=/opt/OracleCalendar
  _DR=$_D/$_R
  cd $_S
  cp cal_linux cal_linux.bak
  cat cal_linux.bak | sed "s/export LD_ASSUME_KERNEL/#xport LD_ASSUME_KERNEL/" > cal_linux
  echo "USER_INSTALL_DIR=$_DR" > ocal_conf/silent.properties
  echo "USER_SHORTCUTS=$_D/usr/bin" >> ocal_conf/silent.properties
  echo "INSTALLER_UI=silent" >> ocal_conf/silent.properties
  ./silent_install.sh
  sed -i -e "s#^OCALENDAR_ROOT=/.*#OCALENDAR_ROOT=$_R#g" $_DR/bin/ocal
  rm $_D/usr/bin/ocal
  ln -s $_R/bin/ocal $_D/usr/bin/ocal
  chmod 755 ${_D}/opt ${_D}/usr ${_D}/usr/bin
  chown root:root ${_D}/usr/bin/ocal
  install -D -m644 ${srcdir}/license.txt ${_D}/usr/share/licenses/${pkgname}/license.txt
}
