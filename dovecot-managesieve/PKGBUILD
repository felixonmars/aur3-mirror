# Contributor: Paul Ezvan <paul@ezvan.fr>
# Based on dovecot PKGBUILD

pkgname=dovecot-managesieve
pkgver=1.2.12
_managesievever=0.11.11
_dovecotvers=1.2
_sievever=0.1.17
pkgrel=1
pkgdesc="An IMAP and POP3 server written with security primarily in mind with managesieve and sieve support"
arch=('i686' 'x86_64')
url="http://dovecot.org/"
license=("LGPL")
depends=('pam' 'libmysqlclient' 'postgresql-libs' 'heimdal' 'libcap' 'bzip2')
makedepends=('dovecot')
provides=('imap-server' 'pop3-server' "dovecot=$pkgver" "dovecot-sive=${_sievever}")
conflicts=('dovecot')
options=('!libtool')
install=$pkgname.install
source=(dovecot.sh
	http://www.rename-it.nl/dovecot/${_dovecotvers}/dovecot-${_dovecotvers}-managesieve-${_managesievever}.tar.gz
	http://dovecot.org/releases/$_dovecotvers/dovecot-$pkgver.tar.gz
	http://www.rename-it.nl/dovecot/$_dovecotvers/dovecot-$pkgver-managesieve-${_managesievever}.diff.gz
	http://www.rename-it.nl/dovecot/$_dovecotvers/dovecot-$_dovecotvers-sieve-${_sievever}.tar.gz)

md5sums=('d020d43eab4ded6fb379dadc570a9490'
         '32ba8d47a3695f8514bd2c2bf7348f96'
         'cc8e5c53cd0943ce0b5e1087356ad4ea'
         '591f77f53af6b057ae8d42ef04d50d9f'
         'ba17a8a08386eb2731793b74317003e2')
build(){
  # configure and make dovecot source
  cd $startdir/src/dovecot-$pkgver 
  # patch with managesieve support
  patch -p1 -i $startdir/src/dovecot-$pkgver-managesieve-${_managesievever}.diff 
  # configure with openssl, mysql, and postgresql support
  ./configure --prefix=/usr --sysconfdir=/etc/dovecot --localstatedir=/var \
  --libexecdir=/usr/lib  --with-moduledir=/usr/lib/dovecot/modules \
  --with-db --with-mysql --with-pgsql --with-sqlite \
  --with-ssl=openssl --with-ssldir=/etc/dovecot/ssl \
  --with-gssapi --with-ldap=plugin --enable-header-install --with-docs 
  # build
  make 
  # install
  make DESTDIR=$startdir/pkg install 
  # remove empty directories for cleanliness
  # /usr/share will usually end up empty except for documentation, but we
  # should not rely on that to remain true, so we do it this way
  rm -rf $startdir/pkg/usr/share/doc 
  rmdir $startdir/pkg/usr/share 
  # install the launch script
  install -D -m755 $startdir/src/dovecot.sh $startdir/pkg/etc/rc.d/dovecot 
  # fix paths in the config example file where we have a different layout
  sed -i 's|/usr/lib/dovecot|/usr/lib/dovecot/modules|g;
  	  s|libexec|lib|g;
	  s|lib/sendmail|sbin/sendmail|g' $pkgdir/etc/dovecot/dovecot-example.conf


  # configure dovecot sieve source
  cd $srcdir/dovecot-${_dovecotvers}-sieve-${_sievever} 
  ./configure --prefix=/usr --with-dovecot=$srcdir/dovecot-$pkgver
  # build
  make 
  # install
  make DESTDIR="$pkgdir" install 

  # configure dovecot managesieve plugin  
  cd $srcdir/dovecot-${_dovecotvers}-managesieve-${_managesievever} 
  ./configure --prefix=/usr --with-dovecot=$srcdir/dovecot-$pkgver \
  --with-dovecot-sieve=$srcdir/dovecot-${_dovecotvers}-sieve-${_sievever} \
  --libexecdir=/usr/lib 
  # build
  make 
  # install
  make DESTDIR="$pkgdir" install 
}
