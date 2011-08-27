# Contributor: fancris3 <fancris3 at aol.com>
pkgname=resmgr
pkgver=1.1.0
pkgrel=2
_nsvn=_SVNr123
pkgdesc="a resource manager for unprivileged user access to device files."
arch=(i686)
install=(resmgr.install)
url="http://forge.novell.com/modules/xfmod/project/?resmgr"
#url="http://www.lst.de/~okir/resmgr/"
license=('GPL2')
depends=('glibc')
makedepends=('rpmextract' 'bzip2' 'automake' 'autoconf')
backup=('/etc/resmgr.conf/resmgr.conf' '/etc/resmgr.conf/99-desktop.conf')
source=(ftp://ftp.univie.ac.at/systems/linux/suse/update/10.2/rpm/src/\
${pkgname}-${pkgver}${_nsvn}-9.2.src.rpm resmgr patch.arch)
md5sums=('31b74ff4c73e969955c8976f1e865a7f' '838401a9c88ffcd7519f72e6806de388'\
         '818dbc8c02874b8c4cf70fc11f5928e4')

build() {

  rpmextract.sh ${pkgname}-${pkgver}${_nsvn}-9.2.src.rpm
  bunzip2 -f ${pkgname}-${pkgver}${_nsvn}.tar.bz2
  tar -xf ${pkgname}-${pkgver}${_nsvn}.tar
  cd ${pkgname}-${pkgver}${_nsvn}

  patch -Np1 -i ../patch.arch

  ./configure --libdir=/lib \
              --prefix=/usr \
              --mandir=/usr/man \
              --sysconfdir=/etc/resmgr.conf \
              --with-pam \
              --with-library \

  make || return 1

  mkdir -p $startdir/pkg/etc/rc.d
  install -m 755 $startdir/src/${pkgname} ${startdir}/pkg/etc/rc.d/

  make DESTDIR=$startdir/pkg install
}
