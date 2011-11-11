# Maintainer: Brian Knox <taotetek@gmail.com>

pkgname=rsyslog-zmq
_basepkgname=rsyslog
pkgver=5.8.6
_gitsrc=git://github.com/aggregateknowledge/rsyslog-zeromq.git
_gitcheckout=rsyslog-zeromq
pkgrel=1
pkgdesc="An enhanced multi-threaded syslogd with a focus on security and reliability"
url="http://www.rsyslog.com/"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('zlib' 'zeromq', 'logrotate')
provides=('rsyslog')
makedepends=('postgresql-libs>=8.4.1' 'libmysqlclient' 'net-snmp' 'gnutls' 'git' 'autoconf' 'rsync')
optdepends=('postgresql-libs: PostgreSQL Database Support'
	    'libmysqlclient: MySQL Database Support'
	    'net-snmp'
	     'gnutls')
backup=('etc/rsyslog.conf' \
	'etc/logrotate.d/rsyslog'
	'etc/conf.d/rsyslog')
options=('strip' 'zipman' '!libtool')
source=("http://www.rsyslog.com/files/download/rsyslog/${_basepkgname}-${pkgver}.tar.gz"
	'rsyslog'
	'rsyslog.logrotate'
	'rsyslog.conf.d'
    'rsyslog.conf'
    )
md5sums=('c46db0496066b82faf735bd4222208d7'
         'a18bbcbb6ebdaa13a6ec6d9f3d9eb2da'
         '8065db4bef3061a4f000ba58779f6829'
         'a1b698b86249278af082298123375213'
         '5381110b0c576bdba0e11b403e900eb3')

build() {
  if [[ -d "$_gitcheckout" ]]; then
      cd "$_gitcheckout" && git pull origin
      msg "The local files are updated."
  else
      git clone "$_gitsrc" "$_gitcheckout"
  fi

  cd ${srcdir}/${_basepkgname}-${pkgver}
  patch -p1 -i ${srcdir}/$_gitcheckout/rsyslog-zeromq.patch
  cd ${srcdir}/$_gitcheckout/
  rsync -av {i,o}mzeromq ${srcdir}/${_basepkgname}-${pkgver}/plugins
  cd ${srcdir}/${_basepkgname}-${pkgver}
  autoreconf
  
  ./configure --prefix=/usr \
              --enable-mysql \
              --enable-pgsql \
              --enable-mail \
              --enable-imfile \
              --enable-omzeromq \
              --enable-imzeromq \
              --enable-imtemplate \
              --enable-snmp \
              --enable-gnutls \
              --enable-inet \
              --with-systemdsystemunitdir=/lib/systemd/system
  make
}
package() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
  # Install Daemons and Configuration Files
  install -D -m755 ${srcdir}/${_basepkgname} ${pkgdir}/etc/rc.d/${_basepkgname}d
  install -D -m644 $srcdir/${_basepkgname}.logrotate ${pkgdir}/etc/logrotate.d/${_basepkgname}
  install -D -m644 ${srcdir}/${_basepkgname}.conf.d ${pkgdir}/etc/conf.d/${_basepkgname}
  install -D -m644 ${srcdir}/${_basepkgname}.conf ${pkgdir}/etc/${_basepkgname}.conf
}
