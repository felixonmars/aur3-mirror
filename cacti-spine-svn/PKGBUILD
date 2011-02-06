# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine-svn
pkgver=4825
pkgrel=3
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('mysql' 'net-snmp' 'openssl')
backup=('etc/spine.conf')
provides=('cacti-spine')
makedepends=('libtool' 'gcc' 'autoconf' 'automake' 'binutils' 'subversion')
source=()
md5sums=()

_svntrunk=svn://svn.cacti.net/var/svnroot/cacti/spine/branches/main
_svnmod=cacti-spine

build() {
  cd ${srcdir}/

  if [ -d ${_svndmod}/.svn ]; then
	  (cd ${_svnmod} && svn up -r ${pkgver})
  else
	  svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r ${_svnmod} ${_svnmod}-build
  cd ${_svnmod}-build
  /usr/bin/aclocal
  /usr/bin/libtoolize --force --copy
  /usr/bin/autoheader
  /usr/bin/autoconf
  /usr/bin/automake --add-missing --copy --force-missing
#  chmod +x ./configure
#  ./configure --prefix=/usr
  /bin/sh ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  mv ${pkgdir}/usr/etc ${pkgdir}/
  mv ${pkgdir}/etc/spine.conf.dist ${pkgdir}/etc/spine.conf

  rm -rf ${srcdir}/${_svnmod}-build
}

