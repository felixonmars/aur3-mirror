# Maintainer: Anntoin Wilkinson <anntoin@gmail.com>
pkgname=funambol
pkgver=10.0.3
pkgrel=1
_jrever=1.6.0
pkgdesc="Free and Open Source SyncML-based synchronization server for push email, PIM data, and wireless device management"
arch=(i686 x86_64)
url="http://www.funambol.com"
license=('AGPL3')
depends=('python' 'java-runtime')
install=funambol.install
source=(http://downloads.sourceforge.net/project/funambol/bundle/v10/${pkgname}-${pkgver}.tgz
        'funambol')
md5sums=('dc6d86e8ba72f64ccefa4710a2fac07a'
         'bacf1e362e251dfecbde8d572b36ae6f')

build() {
  cd ${srcdir}/Funambol/
  install -dv -m755 ${pkgdir}/opt/

  # Copy Funambol files to /opt/Funambol
  cp -a ${srcdir}/Funambol/ ${pkgdir}/opt/

  # Removing built-in JRE, use system JRE
  rm -Rf ${pkgdir}/opt/Funambol/tools/jre-${_jrever}/
  # Edit funamboladmin.conf to use JAVA_HOME variable and save config
  # in user's home directory
  cat ${srcdir}/Funambol/admin/etc/funamboladmin.conf \
    | sed 's/^default_userdir.*$/default_userdir=~\/.config\/funambol/' \
    | sed 's/^jdkhome/# jdkhome/' \
    > ${pkgdir}/opt/Funambol/admin/etc/funamboladmin.conf

  # Install rc.d script for easy start-up/shut-down
  install -D ${srcdir}/funambol ${pkgdir}/etc/rc.d/funambol 

  # Sym-link the JAVA-based admin GUI
  install -dv -m755 ${pkgdir}/usr/bin
  ln -s /opt/Funambol/admin/bin/funamboladmin ${pkgdir}/usr/bin/funamboladmin

  # hack to prevent a whole lot of prompts for removing write-protected file
  chmod -R 644 ${srcdir}/Funambol/tools/jre-${_jrever}/jre/
}
