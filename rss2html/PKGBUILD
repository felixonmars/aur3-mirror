# Contributor: catwell <catwell@archlinux.us>

pkgname=rss2html
pkgver=0.8.3
pkgrel=1
pkgdesc="Convert RSS feeds to plain text, html or token-separated strings."
arch=('i686' 'x86_64')
url="http://nopcode.org/wk.php/rss2html"
license=('GPL')
depends=('curl')
source=(http://news.nopcode.org/pvcroot/$pkgname-$pkgver.tar.gz)
md5sums=(01077c34463d1958a2fa3a32f48f68eb)

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr || return 1
  make || return 1
  install -Ds src/rss2html $pkgdir/usr/bin/rss2html
  set rss2html.links usage.example rss2html.template
  for i; do
    install -Dm0644 doc/$i $pkgdir/usr/share/doc/rss2html/$i
  done
  install -Dm0644 doc/rss2html.1 $pkgdir/usr/share/man/man1/rss2html.1
}

