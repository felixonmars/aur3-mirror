# Maintainer: Damian Nowak <damian.nowak@atlashost.eu>
# Contributor: Kyle Fuller <inbox@kylefuller.co.uk>

pkgname='inspircd-git'
pkgver='20130125'
pkgrel='2'
pkgdesc='A stable, modern and lightweight IRC daemon'
arch=('any')
url='http://www.inspircd.org/'
license=('GPL2')
conflicts=('inspircd')
provides=('inspircd')
depends=('perl')
makedepends=('pkg-config' 'libmariadbclient' 'postgresql' 'sqlite3' 'libldap' 'geoip'
             'tre' 'gnutls' 'openssl' 'libgcrypt')
optdepends=('gnutls: m_ssl_gnutls'
            'libgcrypt: m_ssl_gnutls'
            'openssl: m_ssl_openssl'
            'libmariadbclient: m_mysql'
            'pcre: m_regex_pcre'
            'postgresql: m_pgsql'
            'sqlite3: m_sqlite3'
            'libldap: m_ldapoper and m_ldapauth'
            'geoip: m_geoip'
            'tre: m_regex_tre')
install='inspircd.install'
source=('git://github.com/inspircd/inspircd.git'
        'inspircd.service')
sha512sums=('SKIP'
            '5a16a7c237693ffc6a108358f339b6aa2451fb16430561848ae869f890199b38fab6a13640bcc35cf1d07e32d7e5fff405d88668ee05ddaffc2ef61cb42ee832')


pkgver() {
  cd "$srcdir/inspircd"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/inspircd"

  ./configure \
    --enable-extras=m_geoip.cpp \
    --enable-extras=m_ldapauth.cpp \
    --enable-extras=m_ldapoper.cpp \
    --enable-extras=m_mysql.cpp \
    --enable-extras=m_pgsql.cpp \
    --enable-extras=m_regex_pcre.cpp \
    --enable-extras=m_regex_posix.cpp \
    --enable-extras=m_regex_tre.cpp \
    --enable-extras=m_sqlite3.cpp

  ./configure \
    --uid=0 \
    --prefix=/usr/lib/inspircd \
    --binary-dir=/usr/bin \
    --module-dir=/usr/lib/inspircd/modules \
    --config-dir=/etc/inspircd \
    --data-dir=/var/lib/inspircd \
    --log-dir=/var/log/inspircd \
    --enable-gnutls \
    --enable-openssl \
    --enable-epoll

  make
}

package() {
  install -Dm644 "${srcdir}"/inspircd.service "${pkgdir}"/usr/lib/systemd/system/inspircd.service
  install -o141 -g141 -dm750 "${pkgdir}/var/log/inspircd" "${pkgdir}/etc/inspircd"

  cd "${srcdir}/inspircd"
  make DESTDIR="$pkgdir" install

  mkdir -p "${pkgdir}"/usr/share/inspircd
  mv "${pkgdir}"/etc/inspircd/examples "${pkgdir}"/usr/share/inspircd/examples

  rm -rf "${pkgdir}"/usr/lib/inspircd/logs
  rm -rf "${pkgdir}"/usr/lib/inspircd/data
}
