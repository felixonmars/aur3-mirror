pkgname=samba-3.5-git
pkgver=20100503
pkgrel=1
pkgdesc="Tools to access a server's filespace and printers via SMB"
arch=('i686' 'x86_64')
url="http://www.samba.org/"
license=('GPL3')
depends=('popt' 'libldap>=2.4.18-1' 'tdb' 'libcups' 'fam')
makedepends=('git' 'db>=4.7' 'popt' 'libcups' 'acl' 'libldap' 'libcap>=2.16'
'heimdal>=1.2-1' 'pam' 'fam' 'gnutls>=2.4.1' 'talloc' 'tdb')
provides=('samba' 'smbclient')
conflicts=('samba' 'smbclient')
### UNINSTALL dmapi package before building!!!
backup=(etc/logrotate.d/samba 
etc/pam.d/samba 
etc/samba/smb.conf
etc/xinetd.d/swat
etc/conf.d/samba)
source=(samba.rc
samba.logrotate 
swat.xinetd 
samba.pam 
samba.conf.d)
md5sums=('e93533fa2296c07c1f645dfdd373657f'
'5697da77590ec092cc8a883bae06093c'
'a4bbfa39fee95bba2e7ad6b535fae7e6'
'96f82c38f3f540b53f3e5144900acf17'
'f2f2e348acd1ccb566e95fa8a561b828')

_gitroot=git://git.samba.org/samba.git
_gitname=samba

build() {
  cd $srcdir
  msg "Connecting git.samba.org server..."

  if [ -d $_gitname ] ; then
    cd $_gitname
    git fetch origin || return 1
  else
    git clone $_gitroot $_gitname || return 1
    cd $_gitname
  fi
  git checkout origin/v3-5-test || return 1

  cd $srcdir/$_gitname/source3
  ./autogen.sh || return 1
  ./configure --prefix=/usr \
    --libdir=/usr/lib/ \
    --localstatedir=/var \
    --with-configdir=/etc/samba \
    --with-lockdir=/var/cache/samba \
    --with-piddir=/var/run/samba \
    --with-fhs \
    --with-pam \
    --with-pam_smbpass \
    --with-pammodulesdir=/lib/security \
    --with-ads \
    --with-acl-support \
    --with-cifsmount \
    --with-libsmbclient \
    --with-syslog \
    --enable-external-libtalloc \
    --disable-dnssd \
    --disable-avahi \
    --with-cifsumount \
    --enable-external-libtdb
  make || return 1

  # manpages
  cd ../docs-xml
  make manpages3 || return 1
  rm -rf ../docs/
  mkdir -p ../docs/
  mv output/manpages-3/ ../docs/manpages
}

package() {
  cd $srcdir/$_gitname/source3
  make DESTDIR=$pkgdir install || return 1

  # samba
  mkdir -p ${pkgdir}/var/log/samba
  install -D -m755 ../../samba.rc ${pkgdir}/etc/rc.d/samba
  install -D -m644 ../../samba.conf.d ${pkgdir}/etc/conf.d/samba
  mkdir -p ${pkgdir}/etc/samba
  cat ../examples/smb.conf.default | \
    sed 's|log file = .*$|log file = /var/log/samba/log.%m|g' >${pkgdir}/etc/samba/smb.conf.default
  install -D -m644 ../../samba.logrotate ${pkgdir}/etc/logrotate.d/samba
  install -D -m644 ../../swat.xinetd ${pkgdir}/etc/xinetd.d/swat
  install -D -m644 ../../samba.pam ${pkgdir}/etc/pam.d/samba
  # spool directory
  install -d -m1777 ${pkgdir}/var/spool/samba
  sed -i 's|/usr/spool/samba|/var/spool/samba|g' ${pkgdir}/etc/samba/smb.conf.default
  # fix logrotate
  sed -i -e 's|log.%m|%m.log|g' ${pkgdir}/etc/samba/smb.conf.default
  # nsswitch libraries
  install -D -m755 ${srcdir}/samba/nsswitch/libnss_wins.so ${pkgdir}/lib/libnss_wins.so
  ln -s libnss_wins.so ${pkgdir}/lib/libnss_wins.so.2
  install -D -m755 ${srcdir}/samba/nsswitch/libnss_winbind.so ${pkgdir}/lib/libnss_winbind.so
  # copy ldap example
  install -D -m644 ${srcdir}/samba/examples/LDAP/samba.schema ${pkgdir}/usr/share/doc/samba/examples/LDAP/samba.schema

  # smbclient
  mkdir ${pkgdir}/sbin
  install -m755 bin/{mount.cifs,umount.cifs} ${pkgdir}/sbin/
  mkdir -p ${pkgdir}/usr/lib/cups/backend
  ln -sf /usr/bin/smbspool ${pkgdir}/usr/lib/cups/backend/smb

  # manpages
  make DESTDIR=$pkgdir installman || return 1
  # remove conflicting tdb man pages
  rm -f $pkgdir/usr/share/man/man8/tdb{backup,dump,tool}.8 || return 1
}

# vim:set ts=2 sw=2 et:
