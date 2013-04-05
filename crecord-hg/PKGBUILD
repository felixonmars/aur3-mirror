# Maintainer: Vianney le Clément <vleclement AT gmail · com>
_pkgname=crecord
pkgname=$_pkgname-hg
pkgver=98
pkgrel=1
pkgdesc="curses-record extension for mercurial"
arch=(any)
url="http://www.bitbucket.org/edgimar/crecord/wiki/Home"
license=('GPL')
depends=('mercurial')
source=("hg+https://bitbucket.org/edgimar/$_pkgname"
        setup.py)
md5sums=('SKIP'
         '670a43a57354cf1042733ec93aa504f0')
sha1sums=('SKIP'
          '63886c01a774b65bad69e5b9cbfc607fee13a9af')

pkgver() {
  cd "$srcdir/$_pkgname"
  hg id -n
}

package() {
  cd "$srcdir/$_pkgname"
  python2 ../setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
