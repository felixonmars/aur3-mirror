# Maintainer: mutantmonkey <mutantmonkey@gmail.com>
pkgname=libmilter
pkgver=8.14.4
pkgrel=3
pkgdesc="libmilter"
arch=(i686 x86_64)
url="http://www.postfix.org/MILTER_README.html"
license=('Sendmail open source license')
depends=()
conflicts=()
source="ftp://ftp.sendmail.org/pub/sendmail/sendmail.${pkgver}.tar.gz"
md5sums=('1b23d5000c8e7bfe82ec1a27f2f5fdc5')
sha256sums=('bc0109437c5018b3ea8999edb63506db2f3b31c4c1ab4367cb56236a7df97cb1')

build(){
  cd "${srcdir}/sendmail-${pkgver}"

  # From http://www.j-chkmail.org/wiki/doku.php/doc/installation/start#libmilter
  cat >> devtools/Site/site.config.m4 <<EOF
dnl
dnl Enable libmilter with a pool of workers
APPENDDEF(\`conf_libmilter_ENVDEF',\`-D_FFR_WORKERS_POOL=1 -DMIN_WORKERS=4')
dnl
dnl Use poll instead of select
APPENDDEF(\`conf_libmilter_ENVDEF',\`-DSM_CONF_POLL=1')
dnl Enable IPv6
APPENDDEF(\`conf_libmilter_ENVDEF',\`-DNETINET6=1')
dnl
dnl Include our CFLAGS
APPENDDEF(\`conf_libmilter_ENVDEF',\`${CFLAGS}')
dnl
dnl Add -fPIC
APPENDDEF(\`conf_libmilter_ENVDEF',\`-fPIC')
dnl
EOF

  cd libmilter
  ./Build
}

package(){
  cd "${srcdir}/sendmail-${pkgver}/libmilter"
  mkdir -p "${pkgdir}/usr/lib"
  ./Build DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
