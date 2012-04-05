# Maintainer: Mantas M. <grawity@gmail.com>
pkgname=krb5-appl-svn
pkgver=3335
pkgrel=1
pkgdesc="Obsolete client applications from the MIT Kerberos suite"
arch=('i686' 'x86_64')
url="http://web.mit.edu/kerberos/"
license=('custom')
depends=('e2fsprogs')
makedepends=('perl' 'subversion')
provides=('krb5-appl')
conflicts=('krb5-appl')
source=(
        'krb5-eklogind.socket'
        'krb5-eklogind@.service'
        'krb5-ftpd.socket'
        'krb5-ftpd@.service'
        'krb5-klogind.socket'
        'krb5-klogind@.service'
        'krb5-kshd.socket'
        'krb5-kshd@.service'
        'krb5-telnetd.socket'
        'krb5-telnetd@.service'
        )
sha1sums=('2c1e4784cdc19a6624fecec188a6bf89e8a30192'
          'f5a8fca386cd8db8c33acae01a8c51c0d79b094e'
          '15d732d2e7ed3ac0c02e1d0f84e682f59440b499'
          'cc006f6216fe054ad79ca170a260f92d765086d1'
          '6d8da6f5c9fb767852ee7bf190081bf73f9a31dc'
          'd39ff1b7d440b394ad2ea1898e7aabf2e770cd3a'
          '03e89e3f00b49d31753c97855006ef6471fa5cea'
          '4c595e67e2d4dcd199dcfa192038b7af766f674a'
          'eb0726d124c8649866d2a42e13b8ce22ecf63186'
          '865a3a8a5102f85a38a63b906499b5ae21496b00')

_svntrunk='svn://anonsvn.mit.edu/krb5-appl/trunk'
_svnmod='krb5-appl'

build() {
  cd "$srcdir"
  msg "Connecting to SVN server..."

  if [[ -d "$_svnmod/.svn" ]]; then
     (cd "$_svnmod" && svn up -r "$pkgver")
  else
     #svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
     svn co "$_svntrunk" -r "$pkgver" "$_svnmod"
  fi

  msg "Starting build..."

  rm -rf "$_svnmod-build"
  cp -r "$_svnmod/" "$_svnmod-build"
  cd "$_svnmod-build"

  export CFLAGS+=" -fPIC -fno-strict-aliasing -fstack-protector-all"
  export CPPFLAGS+=" -I/usr/include/et"

  ./autogen.sh
  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --localstatedir=/var/lib \
              --program-prefix=krb5- \
              ;
  sed -i '/^RSH=/ s/\<rlogin\>/krb5-&/' bsd/Makefile
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir" install

  install -Dm 644 "$srcdir/$_svnmod/NOTICE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for file in "$startdir"/*.{socket,service}; do
    install -Dm 644 "$file" "$pkgdir/usr/lib/systemd/system/${file##*/}"
  done
}

# vim: ts=2:sw=2:et
