_pkgname=mailman
pkgname=${_pkgname}-pgp-smime
_pkgver=2.1.13
patchver=2010-09-08
pkgver=${_pkgver}+20100908
pkgrel=1
pkgdesc="Mailing list manager with built in web access and experimental support for signed and encrypted lists"
conflicts=(${_pkgname})
provides=(${_pkgname}=${_pkgver})
arch=('i686' 'x86_64')
license=('GPL')
url="http://non-gnu.uvt.nl/mailman-pgp-smime/"
depends=('python2' 'python-gnupginterface' 'smtp-server')
makedepends=('autoconf')
# 'Defaults.py' should not be changed by users; 'mm_cfg.py' should instead.
backup=('usr/lib/mailman/Mailman/mm_cfg.py')
install=${_pkgname}.install
source=(http://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${_pkgver}.tgz
	http://non-gnu.uvt.nl/pub/mailman/${_pkgname}-${_pkgver}-pgp-smime_$patchver.patch.gz
	mailman-userfix.patch
	mailman-2.1-build.patch
	rc.mailman)
md5sums=('3235323ccb3e0135c10b7c66a440390b'
         'b0070812b16fd808d508a36ba6ccf27e'
         '345e2a6351c0da9f22adec39c428d402'
         'ed04d062379eb21e39ce1e70e6b1ade2'
         '3d83d06d0ec3319bf3c7d9df5d18e89f')

build() {
  cd $srcdir
  rm -rf $pkgname-${_pkgver}
  cp -r ${_pkgname}-${_pkgver} $pkgname-${_pkgver}

  cd $pkgname-${_pkgver}

  # fix calls to /usr/bin/python
  find . -name '*.py' | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # this fixes the build without the mailman user and group
  patch -Np1 -i ${srcdir}/mailman-userfix.patch

  # fix directory permissions to satisfy check_perms
  patch -Np1 -i ${srcdir}/mailman-2.1-build.patch

  # apply pgp/smime patch
  patch -Np1 -i $srcdir/${_pkgname}-${_pkgver}-pgp-smime_$patchver.patch


  autoreconf

  ./configure --without-permcheck \
              --prefix=/usr/lib/mailman \
              --with-var-prefix=/var/lib/mailman \
              --with-mail-gid=mailman \
              --with-cgi-gid=http --with-python=/usr/bin/python2

  make
}

package() {
  cd $srcdir/$pkgname-${_pkgver}
  make DESTDIR=$pkgdir install

  # let's follow Fedora FHS way; Gentoo does it the other way round

  # Create a link so that the config file mm_cfg.py appears in config
  # directory /etc/mailman. We don't put mm_cfg.py in the config directory
  # because its executable code (python file) and the security policy wants
  # to keep executable code out of /etc and inside of a lib directory instead,
  # and because traditionally mm_cfg.py was in the Mailman subdirectory and
  # experienced mailman admins will expect to find it there. But having it
  # "appear" in the config directory is good practice and heading in the
  # right direction for FHS compliance.
  install -d -m755 ${pkgdir}/etc/${_pkgname}
  ln -sv /usr/lib/mailman/Mailman/mm_cfg.py ${pkgdir}/etc/${_pkgname}/mm_cfg.py

  # fix some permissions to satisfy check_perms
  chown -R 80:80 $pkgdir/{usr/lib/mailman,var/lib/mailman,etc/mailman/*}
  chown http:80 ${pkgdir}/var/lib/mailman/archives/private
  chmod 2770 ${pkgdir}/var/lib/mailman/archives/private
  chmod 2755 ${pkgdir}/usr/lib/mailman/cgi-bin/* 
  chmod 2755 ${pkgdir}/usr/lib/mailman/mail/mailman
  
  # install the launch script
  install -D -m755 $srcdir/rc.mailman $pkgdir/etc/rc.d/mailman || return 1
}
