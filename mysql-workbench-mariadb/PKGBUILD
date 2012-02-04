# $Id$
# Maintainer:
# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: totoloco <totoloco at gmail _dot_com>

pkgname=mysql-workbench-mariadb
_realname=mysql-workbench
pkgver=5.2.35
pkgrel=5
pkgdesc="A cross-platform, visual database design tool developed by MySQL"
arch=('i686' 'x86_64')
url="http://wb.mysql.com/"
license=('GPL2')
depends=('libzip' 'mariadb' 'lua' 'gtkmm' 'libgl'
         'libsigc++' 'python-paramiko' 'python-pexpect' 'libgnome-keyring')
makedepends=('boost' 'curl' 'mesa')
options=('!libtool')
source=(ftp://ftp.gwdg.de/pub/misc/mysql/Downloads/MySQLGUITools/${_realname}-gpl-${pkgver}-src.tar.gz
        ArchLinux.xml arch.patch python27.patch gcc46.patch)
md5sums=('e8b158d2ba0413f5659cda7da9cec63e'
         'c2f986cd5737413d020c55db32713c48'
         '23430d24400fd65c9fd872bd8e2411e5'
         '47bc4cdfaa035a0132392e94c462ebf7'
         '43917ebc79794ba15a64f7ba820fa20b')

build() {
  cd "${srcdir}/${_realname}-gpl-${pkgver}-src"

  cp "${srcdir}/ArchLinux.xml" res/mysql.profiles
  patch -Np1 -i ${srcdir}/arch.patch

  patch -Np0 -i ${srcdir}/python27.patch
  patch -Np1 -i ${srcdir}/gcc46.patch

  #we use System provided libraries
  rm -rf ext/curl
  rm -rf ext/yassl
  rm -rf ext/boost
  rm -rf ext/libsigc++

  export CPPFLAGS=$(pkg-config --cflags sigc++-2.0)
  export CXXFLAGS="$CXXFLAGS -fpermissive"

  ./autogen.sh --prefix=/usr --disable-debug --disable-static
  make -j3
}

package() {
  cd "${srcdir}/${_realname}-gpl-${pkgver}-src"

  make DESTDIR="${pkgdir}" install
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" $pkgdir/usr/share/mysql-workbench/sshtunnel.py
  sed -i -e "s|python|python2|" $pkgdir/usr/lib/mysql-workbench/modules/wb_utils_grt.py
  
  echo "Use the following commands under root-account, otherwise the Programm won't start."
  echo "ln -s /usr/lib/mysql/libmysqlclient_r.so /usr/lib/libmysqlclient_r.so"
  echo "ln -s /usr/lib/mysql/libmysqlclient_r.so.16 /usr/lib/libmysqlclient_r.so.16"
}
