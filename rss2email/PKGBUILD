# Maintainer: Chris Brannon <chris@the-brannons.com>
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
pkgname=rss2email
pkgver=2.71
pkgrel=3
pkgdesc="A tool for delivering news from RSS feeds to your email program"
arch=('any')
url="http://www.allthingsrss.com/rss2email"
license=('GPL')
depends=('python2' 'python2-html2text' 'python2-feedparser')
source=("http://www.allthingsrss.com/$pkgname/$pkgname-$pkgver.tar.gz"
        r2e.sh)

build() {
  /bin/true
}

package() {
  # Tarball permissions are bad.  So fix them.
  cd "$srcdir"
  chmod 755 $pkgname-$pkgver
  find $pkgname-$pkgver -type f -print0 |xargs -0 chmod 644
  cd "$srcdir/$pkgname-$pkgver"
  install -D $pkgname.py "$pkgdir/usr/share/$pkgname/bin/$pkgname.py"
  install -D config.py.example "$pkgdir/usr/share/$pkgname/config.py.example"
  install -Dm644 readme.html "$pkgdir/usr/share/doc/$pkgname/readme.html"
  install -m755 -D "$srcdir/r2e.sh" "$pkgdir/usr/bin/r2e"
  find "$pkgdir" -name '*.py' -print0 |xargs -0 \
    sed -i -e 's,^#!/usr/bin/env python$,#!/usr/bin/env python2,' \
    -e 's,^#!/usr/bin/python$,#!/usr/bin/python2,'
}

# vim:set ts=2 sw=2 et:
md5sums=('7d7dbac5aa181b07261516213a312f39'
         '75c2df5185c7bb09adfb293338cd33cc')
