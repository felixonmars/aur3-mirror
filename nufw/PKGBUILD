# Contributor: Celos <celos94(AT)gmail(DOT)com>

pkgname=nufw
pkgver=2.4.3
pkgrel=1
pkgdesc="NuFW - An authentificating firewall"
arch=('i686' 'x86_64')
url="http://www.nufw.org/"
license=('GPL3')
depends=('glib2' 'gnutls' 'libsasl' 'libnetfilter_queue' 'python-ipy')
# 'libgpg-error' 'libgcrypt' 'cyrus-sasl' 'gdbm' 'pam'
backup=('etc/nufw/nuauth.conf' 'etc/nufw/nufw-cert.pem' 'etc/nufw/nufw-key.pem' 'etc/nufw/nuauth-cert.pem' 'etc/nufw/nuauth-key.pem' 'etc/nufw/NuFW-cacert.pem' 'etc/nufw/periods.xml' 'etc/nufw/acls.schema')
options=('!libtool')
source=(http://www.nufw.org/attachments/download/175/$pkgname-$pkgver.tar.bz2)
md5sums=('e264ddc6e314df1d2c7b4cd0f0a4eb64')

build(){
  cd "$startdir/src/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc/nufw --with-ldap
  
  # --with-gdbm --with-ident --with-debug
  make || return 1
  make prefix="$startdir/pkg/usr" install || return 1


  ## Install nuauth config file
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/nuauth.conf $startdir/pkg/etc/nufw/nuauth.conf 

  ## Install certificates available in the sources
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/certs/nufw-cert.pem $startdir/pkg/etc/nufw/nufw-cert.pem
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/certs/nufw-key.pem $startdir/pkg/etc/nufw/nufw-key.pem
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/certs/nuauth-cert.pem $startdir/pkg/etc/nufw/nuauth-cert.pem
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/certs/nuauth-key.pem $startdir/pkg/etc/nufw/nuauth-key.pem
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/certs/NuFW-cacert.pem $startdir/pkg/etc/nufw/NuFW-cacert.pem

  # Install acls files
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/acls.nufw $startdir/pkg/etc/nufw/acls.nufw
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/acls.schema $startdir/pkg/etc/nufw/acls.schema
  install -D -m644 $startdir/src/$pkgname-$pkgver/conf/periods.xml $startdir/pkg/etc/nufw/periods.xml

  ## Editing nuauth.conf file to make it work with PAM user list and acls.nufw file
  sed -i \
    -e 's:^\(nuauth_user_check_module=\)"plaintext":\1"system":' \
    -e 's:^\(nuauth_get_user_id_module=\)"plaintext":\1"system":' \
    -e 's:^\(nuauth_get_user_groups_module=\)"plaintext":\1"system":' \
    -e 's:^\(nuauth_acl_check_module=\)"libplaintext":\1"plaintext":' \
    $startdir/pkg/etc/nufw/nuauth.conf
}

# vim:set ts=2 sw=2 et:
