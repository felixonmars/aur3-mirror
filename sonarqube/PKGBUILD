#Maintaner: Yahya Mohajer <yaya_2013 {AT} yahoo {DOT} com >
#Edited by: Bernhard Friedreich <friesoft@gmail.com>
#Edited by: Torsten Burschka <torsten.burschka@gmail.com>

pkgname=sonarqube
pkgver=4.5.1
pkgrel=1
pkgdesc="A code quality management platform."
url="http://www.sonarqube.org/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('java-environment')
optdepends=('apache: a full featured webserver'
            'mariadb: Fast SQL database server, drop-in replacement for MySQL'
            'maven: a java project management and project comprehension tool')

backup=('opt/sonarqube/conf/sonar.properties' 
        'opt/sonarqube/conf/wrapper.conf')

install=${pkgname}.install
conflicts=('java-sonar' 'sonar')
provides=('java-sonar' 'sonar')
replaces=('sonar')
options=(!strip)

source=(http://dist.sonar.codehaus.org/${pkgname}-${pkgver}.zip
        'wrapper.conf.patch'
        'sonar.sh.patch'
        'sonarqube.service')	

md5sums=('b18e35230f1998532f4f4a0673d42c40'
		 'b4b9cef868abe95be5cc08c15d926244'
		 '3d1970d0f29080438abdcce38fd556fe'
         'ce78144ab5f04d644f574c29716d23f8')

package() {
  cd ${srcdir}

  # Create directory and copy everything
  install -d ${pkgdir}/opt/${pkgname}

  # modify the current config files for working with arch
  msg "Patch files"
  patch ${srcdir}/${pkgname}-${pkgver}/conf/wrapper.conf < ${srcdir}/wrapper.conf.patch
  if [ $CARCH = 'x86_64' ]; then
    patch ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-64/sonar.sh < ${srcdir}/sonar.sh.patch
    sed -i "s/ARCH/linux-x86-64/g" ${srcdir}/sonarqube.service
  elif [ $CARCH = 'i686' ]; then
    patch ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-32/sonar.sh < ${srcdir}/sonar.sh.patch
    sed -i "s/ARCH/linux-x86-32/g" ${srcdir}/sonarqube.service
  fi

  # moving only $CARCH specific files to pkg, delete the rest
  msg "Determine right architecture"
    mkdir -p ${pkgdir}/opt/${pkgname}/bin/
  if [ $CARCH = 'x86_64' ]; then
    cp -r ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-64 ${pkgdir}/opt/${pkgname}/bin/linux-x86-64 || return 1
    rm -r ${srcdir}/${pkgname}-${pkgver}/bin || return 1
  elif [ $CARCH = 'i686' ]; then
    cp -r ${srcdir}/${pkgname}-${pkgver}/bin/linux-x86-32 ${pkgdir}/opt/${pkgname}/bin/linux-x86-32 || return 1
    rm -r ${srcdir}/${pkgname}-${pkgver}/bin || return 1
  fi

  # install the additional config files to the desired destination
  msg "Installing configuration files"
  mkdir -p ${pkgdir}/opt/${pkgname}/conf
  install ${srcdir}/${pkgname}-${pkgver}/conf/sonar.properties ${pkgdir}/opt/${pkgname}/conf/sonar.properties
  install ${srcdir}/${pkgname}-${pkgver}/conf/wrapper.conf ${pkgdir}/opt/${pkgname}/conf/wrapper.conf
  rm -r ${srcdir}/${pkgname}-${pkgver}/conf

  # copy documentation
  msg "Copy documentation"
  mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
  install ${srcdir}/${pkgname}-${pkgver}/COPYING ${pkgdir}/usr/share/doc/${pkgname}
  rm ${srcdir}/${pkgname}-${pkgver}/COPYING

  # delete not needed directories
  rm -r ${srcdir}/${pkgname}-${pkgver}/logs
  ln -s /var/log/${pkgname} ${pkgdir}/opt/sonarqube/logs

  # copy the source to the final directory
  msg "Copy Source to final directory"
  cp -a ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/opt/${pkgname} || return 1

  mkdir -p ${pkgdir}/var/log/${pkgname}/
  touch ${pkgdir}/var/log/${pkgname}/wrapper.log
  touch ${pkgdir}/var/log/${pkgname}/sonar.log
  touch ${pkgdir}/var/log/${pkgname}/profiling.log

  install -m755 -d ${pkgdir}/opt/${pkgname}/run

  install -Dm644 "${srcdir}/sonarqube.service" "${pkgdir}/usr/lib/systemd/system/sonarqube.service"
}

