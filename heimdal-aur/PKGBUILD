# Maintainer: xhochy <uwelk@xhochy.org>

# need to choose anonther name since heimdal is still blacklisted
pkgname=heimdal-aur
# Do not install the config as this will conflict with krb5
pkgver=1.5.2
pkgrel=1
pkgdesc="Implementation of Kerberos V5 libraries"
arch=('i686' 'x86_64')
url="http://www.h5l.org/"
license=('custom')
depends=('sqlite3' 'libldap')
# Do not install the config as this will conflict with krb5
# backup=(etc/krb5/krb5.conf)
options=('!libtool' '!emptydirs')
source=(http://www.h5l.org/dist/src/heimdal-${pkgver}.tar.gz
	heimdal-kdc
	heimdal-kadmind
	heimdal-kpasswd
	base-version-script.map
	heimdal.sh
	heimdal-aur.install
)
md5sums=('bb23d9dbdafd395d816f7abc598481a1'  # heimdal-1.5.tar.gz
         '16c3a485ef7c6d6c83ad9cd225cd88aa'  # heimdal-kdc
         '22213df54d72df0ee949d3dc13b4cc47'  # heimdal-kadmind
         '3c0aa4790eed0b75db4160d4442452e2'  # heimdal-kpasswd
         '8dfdaa919df2be48fa181db646cd8a9b'  # base-version-script.map
         'a222ad606aadfdceb6816da0551628fe'  # heimdal.sh
         '132eb74789d83dbd623ba7b5dd14c792'  # heimdal-aur.install
)
install='heimdal-aur.install'

build() {
  cp base-version-script.map ${srcdir}/heimdal-${pkgver}/base/version-script.map
  cd ${srcdir}/heimdal-${pkgver}

  sed -i 's|$(LIB_NDBM)|$(LIB_NDBM) $(LIB_db_create)|' lib/otp/Makefile.am

  # TODO Include man pages in /usr/share/man but add a heimdal suffix
  ./configure --prefix=/opt/heimdal --enable-shared=yes --without-x \
	--sysconfdir=/etc/krb5 \
	--libdir=/usr/heimdal/lib \
	--includedir=/usr/heimdal/include \
	--mandir=/opt/heimdal/share/man \
	--datadir=/var/lib/heimdal \
	--localstatedir=/var/lib/heimdal \
	--with-openssl=/usr \
	--with-readline-lib=/usr/lib \
	--with-readline-include=/usr/include/readline \
	--with-sqlite3-lib=/usr/lib \
	--with-sqlite3-include=/usr/include \
	--with-openldap=/usr \
	--libexecdir=/opt/heimdal/sbin \
	--enable-kcm \
	--disable-heimdal-documentation
  make
}

package() {
  cd ${srcdir}/heimdal-${pkgver}
  make DESTDIR=${pkgdir} install

  # Rename daemons and their manpages
  for i in telnetd ftpd rshd; do
    mv ${pkgdir}/opt/heimdal/share/man/man8/{,k}${i}.8
    mv ${pkgdir}/opt/heimdal/sbin/{,k}${i}
  done

  # Rename clients and their manpages
  for i in rcp rsh telnet ftp su login; do
    if [ -f ${pkgdir}/opt/heimdal/share/man/man1/${i}.1 ]; then
      mv ${pkgdir}/opt/heimdal/share/man/man1/{,k}${i}.1
    fi
    mv ${pkgdir}/opt/heimdal/bin/{,k}${i}
  done
  rm -rf ${pkgdir}/opt/heimdal/share/man/cat{1,3,5,8}

  # install config
  # Do not install the config as this will conflict with krb5
  # install -D -m644 ${srcdir}/heimdal-${pkgver}/krb5.conf ${pkgdir}/etc/krb5/krb5.conf

  # install init scripts
  mkdir -p ${pkgdir}/etc/rc.d/
  install -m755 ${srcdir}/heimdal-kdc ${pkgdir}/etc/rc.d/heimdal-kdc
  install -m755 ${srcdir}/heimdal-kadmind ${pkgdir}/etc/rc.d/heimdal-kadmind
  install -m755 ${srcdir}/heimdal-kpasswd ${pkgdir}/etc/rc.d/heimdal-kpasswd

  mkdir -p ${pkgdir}/etc/profile.d/
  install -m755 ${srcdir}/heimdal.sh ${pkgdir}/etc/profile.d/heimdal.sh

  # Remove conflicts
  rm -rf ${pkgdir}/opt/heimdal/share/man/man5/ftpusers.5*		          # man-pages
  rm -rf ${pkgdir}/opt/heimdal/share/man/man3/{DES,DH,EVP,OpenSSL,RAND,RSA}*  # openssl
  rm -rf ${pkgdir}/opt/heimdal/share/man/man3/os.3*                           # erlang

  # Install the license
  install -Dm644 ${srcdir}/heimdal-${pkgver}/LICENSE \
  	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
