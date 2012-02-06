# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: mutantmonkey <mutantmonkey@gmail.com>

pkgname=libmilter-shared
_pkgname=libmilter
pkgver=8.14.5
pkgrel=3
pkgdesc="Sendmail Mail Filter API (Milter)"
arch=('i686' 'x86_64')
url="https://www.milter.org/developers/api/index"
depends=('glibc')
provides=('libmilter')
conflicts=('libmilter')
license=('custom:Sendmail open source license')
source=("ftp://ftp.sendmail.org/pub/sendmail/sendmail."$pkgver".tar.gz"{,.sig}
        'export-smfi.lds')
sha256sums=('fb65a86a0f87f12aefb933ee8990540f7a680a594f7fedfdd28918f3934bfb88'
            'ff121cf13cc1b3d3d45a4992915281dee031fe9d0e0d2b841f167a3d672a3c58'
            '05f9ce8ffbc98cb18fa30ca70c281d2c27a6f15817a897aa12bd36d8cf990826')

build(){

  cd "$srcdir/sendmail-$pkgver"

  export CFLAGS="${CFLAGS} -pthread -DPIC -fPIC"

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
EOF

  cd libmilter
  ./Build

  # Unfortunately, this won't build a shared version of the library - lets fix this here.
  # Use a version script to mark smfi_* functions as global:
  ${CC:-gcc} ../obj.Linux*/libmilter/*.o -shared $LDFLAGS -lpthread \
    -Wl,--version-script="$srcdir/export-smfi.lds" \
    -Wl,--fatal-warnings,--no-undefined -Wl,-soname,libmilter.so.0 -o libmilter.so.0.0.0
}

package(){

  # Package as usual
  cd "$srcdir/sendmail-$pkgver/libmilter"
  mkdir -p "$pkgdir/usr/lib"
  ./Build DESTDIR="$pkgdir" install

  # Move the shared library
  ln -sf libmilter.so.0.0.0 libmilter.so
  cp -a libmilter.so* "$pkgdir/usr/lib"

  # Remove the static library now that we have a "proper" shared version:
  rm "$pkgdir/usr/lib/libmilter.a"

  install -Dm0644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  chown -R root:root "$pkgdir" # Fix group permissions.

}

# vim:set ts=2 sw=2 et:
