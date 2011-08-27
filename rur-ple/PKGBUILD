# Maintainer: totoloco <totoloco at gmx dot com>
pkgname=rur-ple
pkgver=1.0.1
pkgrel=2
pkgdesc="an environment designed to help you learn computer programming using the language Python"
arch=(i686 x86_64)
url="http://code.google.com/p/rur-ple/"
license=('GPL')
depends=(python2 wxpython)
source=(http://rur-ple.googlecode.com/files/$pkgname-$pkgver.zip $pkgname)
md5sums=('28adf529d4462b50915fdb83adf44dc5'
         '5f8e1debbde73fbc47929b2af38e49c3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -ri '/^wxversion\.select\(/d' rur_start.py
# remove svn dirs
# give errors with -exec u.u
  find . -type d -name '.svn' -print | xargs rm -Rf
# remove execute permissions
  find . -type f -exec chmod -x {} \;
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/share"
  mv "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/share/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
