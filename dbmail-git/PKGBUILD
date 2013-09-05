# $Id: PKGBUILD 84535 2013-02-19 15:02:15Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sebastian Faltoni <sebastian.faltoni@gmail.com>

pkgname=dbmail-git
pkgver=20130905
pkgrel=1
pkgdesc="Fast and scalable sql based mail services"
arch=('i686' 'x86_64')
depends=('gmime' 'libzdb' 'mhash' 'libevent')
makedepends=('asciidoc' 'xmlto' 'docbook-xsl' 'docbook-xml' 'postgresql-libs>=8.4.1'
	     'sqlite' 'libmysqlclient' 'libldap>=2.4.18' 'libsieve' 'git')
optdepends=('libldap: for LDAP authentication'
	    'libsieve: for dbmail-sieve'
	    'python2-mysql2pgsql: migrate from MySQL to PostreSQL')
url="http://www.dbmail.org"
license=('GPL')
options=('!libtool' 'zipman')
backup=(etc/xinetd.d/dbmail-imapd
	etc/xinetd.d/dbmail-pop3d
	etc/xinetd.d/dbmail-lmtpd
	etc/xinetd.d/dbmail-timsieved)
source=(git://git.subdir.eu/paul/dbmail
	dbmail-imapd.xinetd
	dbmail-lmtpd.xinetd
	dbmail-pop3d.xinetd
	dbmail-timsieved.xinetd)
md5sums=('SKIP'
         '8fa791f2e4d107ba461453c054359477'
         '069cd4285c4b2ec95dfdcebc2cfee387'
         '44f87ce81e786fcee501daa17e55412a'
         'a66927cb94d4f26428211e3ad2d540c8')

build() {
  cd $srcdir/dbmail
  [ -f Makefile ] || ./configure \
    --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc \
    --with-ldap --with-sieve --enable-systemd
  make
  make -C man
}

package() {
  cd $srcdir/dbmail
  make DESTDIR=$pkgdir install
  make DESTDIR=$pkgdir install -C man

  install -Dm644 dbmail.conf $pkgdir/etc/dbmail.conf.sample
  mkdir $pkgdir/usr/share/dbmail
  cp -r sql/* $pkgdir/usr/share/dbmail/
  cp -a contrib $pkgdir/usr/share/dbmail/
  cp dbmail.schema $pkgdir/usr/share/dbmail/

  for i in dbmail-imapd dbmail-lmtpd dbmail-pop3d dbmail-timsieved; do
    install -Dm0644 $srcdir/$i.xinetd $pkgdir/etc/xinetd.d/$i
  done
}
