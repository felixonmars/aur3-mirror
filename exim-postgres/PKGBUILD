# Contributor: Kravchuk Sergei <alfss.obsd@gmail.com>
pkgname=exim-postgres
pkgver=4.69
pkgrel=1
pkgdesc="A Message Transfer Agent(lookup PostgreSQL)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://exim.org/"
depends=('postgresql' 'perl' 'zlib' 'openssl' 'db>=4.8' 'pcre' 'pam>=1.0.1-2' 'tcp_wrappers')
install=${pkgname}.install
source=(ftp://ftp.mirrorservice.org/sites/ftp.csx.cam.ac.uk/pub/software/email/exim/exim4/exim-${pkgver}.tar.gz)
md5sums=('56e8db1dfe31e0ee4cef85e8940ceedc')

build() {
         cd "${srcdir}/exim-${pkgver}"
         echo "
BIN_DIRECTORY=/usr/sbin
CONFIGURE_FILE=/etc/mail/exim.conf
EXIM_USER=mail
EXIM_GROUP=mail
SPOOL_DIRECTORY=/var/spool/mqueue
CFLAGS=-I/usr/include
ROUTER_ACCEPT=yes
ROUTER_DNSLOOKUP=yes
ROUTER_IPLITERAL=yes
ROUTER_MANUALROUTE=yes
ROUTER_QUERYPROGRAM=yes
ROUTER_REDIRECT=yes
TRANSPORT_APPENDFILE=yes
TRANSPORT_AUTOREPLY=yes
TRANSPORT_PIPE=yes
TRANSPORT_SMTP=yes
SUPPORT_MAILDIR=yes
LOOKUP_DBM=yes
LOOKUP_LSEARCH=yes
LOOKUP_PGSQL=yes
LOOKUP_INCLUDE=-I /usr/include
LOOKUP_LIBS=-L /usr/lib -lpq -lz -lm  -L/usr/lib -lssl -lcrypto
WITH_CONTENT_SCAN=yes
WITH_OLD_DEMIME=yes
FIXED_NEVER_USERS=root
AUTH_CRAM_MD5=yes
AUTH_PLAINTEXT=yes
HEADERS_CHARSET=\"UTF-8\"
SUPPORT_TLS=yes
TLS_LIBS=-lssl -lcrypto
LOG_FILE_PATH=/var/log/exim/exim_%slog
SYSLOG_LOG_PID=yes
EXICYCLOG_MAX=20
COMPRESS_COMMAND=/bin/gzip
COMPRESS_SUFFIX=gz
ZCAT_COMMAND=/bin/zcat
EXIM_PERL=perl.o
SYSTEM_ALIASES_FILE=/etc/mail/aliases
CHOWN_COMMAND=/bin/chown
TMPDIR=\"/tmp\"
SUPPORT_MOVE_FROZEN_MESSAGES=yes">"Local/Makefile"

        make || return 1
        make DESTDIR=${pkgdir} install || return 1
        mv ${pkgdir}/etc/mail/exim.conf  ${pkgdir}/etc/mail/exim.conf.dist
}