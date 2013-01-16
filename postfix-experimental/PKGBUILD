# Contributor: Jeff Brodnax <tullyarcher@bellsouth.net>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=postfix-experimental
pkgver=2.10_20130113
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc='Fast, easy to administer, secure mail server, experimental releases'
url='http://www.postfix.org/'
license=('custom')
provides=('postfix')
conflicts=('postfix')
arch=('i686' 'x86_64')
depends=('pcre' 'libsasl' 'libldap' 'db'
         'libmysqlclient' 'postgresql-libs' 'sqlite' 'tinycdb')
backup=('etc/postfix/'{access,aliases,canonical,generic,header_checks,main.cf,master.cf,relocated,transport,virtual})
source=("http://cdn.postfix.johnriley.me/mirrors/postfix-release/experimental/postfix-${_pkgver}.tar.gz"
        'aliases.patch'
        'service'
        'rc.d')

provides=('smtp-server' 'smtp-forwarder')
conflicts=('smtp-server' 'smtp-forwarder')

sha256sums=('3fde4d4a0296c26a24b69d63fe376b4e01fd01d65ef36ab12c56ac57a450bca3'
            'f4c766efc20b4638f9fd72707ca6d4c2628279ebd79f5227276fa4ca6867c336'
            '81a1a2f0703fcf7cf9065b09deb77d6f5a4ff566ae670d3867a00116c30662e9'
            '49cb9c0027aa0ce7b61a5f4e10f788bdb69fb1cd2245b9f1fd45f8f8057a7248')

install=install

build() {
  cd "${srcdir}/postfix-${_pkgver}"

  make makefiles DEBUG='' CCARGS=' \
    -DUSE_SASL_AUTH -DUSE_CYRUS_SASL -I/usr/include/sasl \
    -DHAS_LDAP \
    -DUSE_TLS \
    -DHAS_MYSQL -I/usr/include/mysql \
    -DHAS_PGSQL -I/usr/include/postgresql \
    -DHAS_SQLITE \
    -DHAS_CDB \
  ' AUXLIBS=' \
    -lsasl2 \
    -lldap -llber \
    -lssl -lcrypto \
    -lmysqlclient -lz -lm \
    -lpq \
    -lsqlite3 -lpthread \
    -lcdb \
  ' OPT="${CFLAGS} ${LDFLAGS}"

  make
}

package() {
  cd "${srcdir}/postfix-${_pkgver}"

  sh postfix-install -non-interactive \
    install_root="${pkgdir}" \
    daemon_directory="/usr/lib/postfix" \
    sample_directory="/etc/postfix/sample" \
    manpage_directory="/usr/share/man" \
    readme_directory="/usr/share/doc/postfix" \

  install -Dm755 ../rc.d "${pkgdir}/etc/rc.d/postfix"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/postfix/LICENSE"
  install -Dm644 ../service "${pkgdir}/usr/lib/systemd/system/postfix.service"

  cd "${pkgdir}"
  patch -p0 -i "${srcdir}"/aliases.patch
  sed 's/^\(\$manpage[^:]*\):/\1.gz:/' -i "usr/lib/postfix/postfix-files"
}
