# Contributor: Patrick Schneider <Patrick.Schneider@uni-ulm.de>
pkgname=mod_proxy_html
pkgver=3.1.2
pkgrel=1
pkgdesc="An output filter to rewrite HTML links in a proxy situation for Apache 2"
arch=('i686' 'x86_64')
url="http://apache.webthing.com/mod_proxy_html/"
license=('GPL')
makedepends=('pkgconfig')
depends=('apache>=2.2' 'libxml2')
install=$pkgname.install
backup=(etc/httpd/conf/extra/httpd-proxy-html.conf)
source=(http://apache.webthing.com/mod_proxy_html/$pkgname.tar.bz2 $pkgname.diff)
md5sums=('d6497b48d2bffc4150472472004618c3'
         'e346fcbcd623dad3e9d452ce8c396d32')

build() {
  cd "$srcdir/$pkgname"

  patch -Np0 < ../mod_proxy_html.diff
  apxs `pkg-config --cflags libxml-2.0` -c mod_proxy_html.c || return 1
  mkdir -p "$pkgdir`apxs -q LIBEXECDIR`"
  apxs -S LIBEXECDIR="$pkgdir`apxs -q LIBEXECDIR`" -i mod_proxy_html.la || return 1
  install -D -m 644 proxy_html.conf "$pkgdir/etc/httpd/conf/extra/httpd-proxy-html.conf"
}

# vim:set ts=2 sw=2 et:
