# Contributor: Morgan LEFIEUX <comete_AT_archlinuxfr.org>
# Contributor: Mantas M. <grawity@gmail.com>
pkgname=webauth
pkgver=4.0.1
pkgrel=1
pkgdesc="A comprehensive system for authenticating web users with Kerberos 5."
url="http://webauth.stanford.edu"
depends=(
	'apache'
	'krb5'
  'curl'
  'openldap'
  'openssl'
  'perl-cgi-application'
  'perl-cgi-application-plugin-autorunmode'
  'perl-cgi-application-plugin-forward'
  'perl-cgi-application-plugin-redirect'
  'perl-cgi-application-plugin-session'
  'perl-cgi-application-plugin-tt'
  'perl-fcgi'
  'perl-template-toolkit'
  'perl-uri'
  'remctl'
  )
license=('custom')
arch=('x86_64')
source=("http://webauth.stanford.edu/dist/$pkgname-$pkgver.tar.gz")
sha1sums=('c81d572fd1431993756046be9235d08bd6bbade0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
  	--prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-webkdc \
    ;
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/lib/apache2" "$pkgdir/usr/lib/httpd"
  install -Dm0644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et:
