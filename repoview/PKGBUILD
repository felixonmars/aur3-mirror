# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Evangelos Foutras <foutrelis@gmail.com>

pkgname=repoview
pkgver=0.6.6
pkgrel=2
pkgdesc="Creates a set of static HTML pages in a yum repository"
arch=('any')
url="http://fedorahosted.org/repoview/"
license=('GPL2')
depends=('python2' 'yum' 'kid')
source=(http://icon.fedorapeople.org/repoview/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e030fdbac9255dac41e7a966219faf90a0932870a97c15abf70b649ab65ccaa5'
            'SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|#!/usr/bin/python|#!/usr/bin/python2|" repoview.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Main executable and man page
  install -D repoview.py "$pkgdir/usr/bin/repoview"
  install -Dm644 repoview.8 "$pkgdir/usr/share/man/man8/repoview.8"

  # Templates
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r templates "$pkgdir/usr/share/$pkgname/"
}

# vim:set ts=2 sw=2 et:
