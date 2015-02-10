# Maintainer: Juan Diego Tascon (since 18/04/2010)

# Contributor: TDY <tdy@gmx.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=droopy
pkgver=20131121
pkgrel=2
pkgdesc="A mini web server that allows others to upload files to your computer"
arch=("any")
url="http://stackp.online.fr/droopy/"
license=('PSF')
depends=('python2')
source=(http://stackp.online.fr/wp-content/uploads/droopy)

build() {
  sed -i 's#/usr/bin/env python#/usr/bin/env python2#g' "$srcdir/droopy"
}

package() {
  install -Dm755 "$srcdir/droopy" "$pkgdir/usr/bin/droopy"
}

sha1sums=('a499262a4988fffcd52190c22651e2796d8be713')
