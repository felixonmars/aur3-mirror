# Maintainer: mar77i <mysatyre at gmail dot com>
pkgname=fr0st
pkgver=1.4
pkgrel=2
pkgdesc="A pyton2-based application for creating, editing, and rendering flam3 fractal images"
arch=(any)
url="http://fr0st.wordpress.com/"
license=('GPL')
depends=(wxpython flam3 python2-numpy)
source=(http://launchpad.net/$pkgname/trunk/1.4.0/+download/$pkgname-$pkgver-src.tgz)
install=fr0st.install
md5sums=('c92a83da752aecf0e106ae750daa396c')

build() {
  :
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  sed -i 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/' fr0st.py
  install -D -m755 fr0st.py "$pkgdir/usr/bin/fr0st"
  install -D -m644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -D -m644 changelog.txt "$pkgdir/usr/share/doc/$pkgname/changelog.txt"

  while read -d ''; do
    install -D -m644 "$REPLY" "$pkgdir/usr/share/$pkgname/$REPLY"
  done < <(find samples icons -type f -print0)
  mkdir -p "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  ln -s "../../../../$pkgname/icons/fr0st.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  while read -d ''; do
    install -D -m644 "$REPLY" "$pkgdir/usr/lib/python2.7/$REPLY"
  done < <(find fr0stlib -type f -print0)
}

# vim:set ts=2 sw=2 et:
