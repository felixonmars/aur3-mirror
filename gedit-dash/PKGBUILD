# Maintainer: Ebenezer Edelman <contact@EbenezerEdelman.tk>

pkgname=gedit-dash
pkgver=0.1
pkgrel=3
pkgdesc="A gedit dashboard plugin for new tabs."
arch=('any')
url="http://www.gedit.org"
license=('GPL')
depends=('gedit' 'python2-gobject' 'python2-chardet' 'python2-pygments' 'zeitgeist-datahub')
source=(http://dl.dropbox.com/u/7162902/$pkgname.tar.gz)
md5sums=(846887a4d05a7b80a91c6f921c6fa39f)

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/lib/gedit/plugins"
  cp dashboard.plugin "$pkgdir/usr/lib/gedit/plugins/"
  cp dashboard.py "$pkgdir/usr/lib/gedit/plugins/"
}

# vim:set ts=2 sw=2 et:
