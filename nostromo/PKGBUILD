# Maintainer: karnath <karnathtorjian@gmail.com>
# Contributor: Mario García H. <code933k@gmail.com>
# http://keyjunkie.blogspot.com

pkgname=nostromo
pkgver=1.9.5
pkgrel=1
pkgdesc="nhttpd is a simple, fast and secure HTTP server running as a single process"
arch=('i686' 'x86_64')
url="http://dns.nazgul.ch/dev_nostromo.html"
#MIT license
license=('custom')
depends=('openssl')
backup=("var/lib/$pkgname/conf/nhttpd.conf" "var/lib/$pkgname/conf/mimes")
install='nostromo.install'
source=(http://dns.nazgul.ch/dev/$pkgname-$pkgver.tar.gz)
md5sums=('dc6cfd6b5aae04c370c7f818fa7bde55')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make BINDIR=$pkgdir/usr/sbin || return 1

}

package() {
  cd "$srcdir/$pkgname-$pkgver"


  install -d -m 755 ${pkgdir}/usr/sbin
  install -d -m 755 ${pkgdir}/usr/share/man/man8
  install -d -m 750 ${pkgdir}/var/lib/${pkgname}/conf
  install -d -m 750 ${pkgdir}/var/lib/${pkgname}/htdocs
  install -d -m 750 ${pkgdir}/var/lib/${pkgname}/htdocs/cgi-bin
  install -d -m 750 ${pkgdir}/var/lib/${pkgname}/icons
  install -d -m 750 ${pkgdir}/var/lib/${pkgname}/logs

  install -m 0550 src/nhttpd/nhttpd \
  ${pkgdir}/usr/sbin/nhttpd
  install -m 0550 src/tools/crypt \
  ${pkgdir}/usr/sbin/crypt
  install -m 0644 src/nhttpd/nhttpd.8 \
  ${pkgdir}/usr/share/man/man8/nhttpd.8
  install -m 0550 htdocs/cgi-bin/printenv \
  ${pkgdir}/var/lib/${pkgname}/htdocs/cgi-bin/printenv
  install -m 0640 conf/mimes \
  ${pkgdir}/var/lib/${pkgname}/conf/mimes
  install -m 0640 conf/nhttpd.conf-dist \
  ${pkgdir}/var/lib/${pkgname}/conf/nhttpd.conf-dist
  install -m 0640 htdocs/index.html \
  ${pkgdir}/var/lib/${pkgname}/htdocs/index.html
  install -m 0640 htdocs/${pkgname}.gif \
  ${pkgdir}/var/lib/${pkgname}/htdocs/${pkgname}.gif
  install -m 0640 icons/dir.gif \
  ${pkgdir}/var/lib/${pkgname}/icons/dir.gif
  install -m 0640 icons/file.gif \
  ${pkgdir}/var/lib/${pkgname}/icons/file.gif

}

