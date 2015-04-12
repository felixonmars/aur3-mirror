# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Mike Kuehn <mail@mikekuehn.ca>
# Contributor: Ismael Barros (RazZziel) <razielmine@gmail.com>

pkgname=unball
pkgver=0.2.99
pkgrel=1
pkgdesc="The most comprehensive archive identify-and-extract wrapper script in existence"
arch=('any')
url="https://github.com/ssokolow/unball"
license=('GPL2')
depends=('python2')
source=(git://github.com/ssokolow/unball.git
        install.sh)
md5sums=('SKIP'
         'c772cd4d387cd4e7fe4b0fc54a4a4d63')


#prepare() {
#  cp install.sh unball-$pkgver
#}

package() {
  cd $srcdir/unball

  #PREFIX=/usr DESTDIR=$pkgdir ./install.sh
  python2 setup.py install --root=$pkgdir --prefix=/usr
}

# Latest version for download is 0.2.11.1
# https://github.com/downloads/ssokolow/$pkgname/$pkgname-$pkgver.tbz2
# At this time it was a shell script
# Development went beyond that but without tags, README states version is 0.2.99
# For the shell script the install.sh was needed
