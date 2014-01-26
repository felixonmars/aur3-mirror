# Maintainer: XZS <d.f.fischer at web dot de>
# Contributor: Jerome Barnett <techryda at silentdome dot com>
pkgname=firefox-extension-fxbutton-git
pkgver=2.9
pkgrel=1
pkgdesc='Change menu and give an opportunity to move "Firefox" button.'
url='https://github.com/seleznev/firefox-extension-fxbutton'
arch=('any')
license=('MPLv2')
depends=('firefox')
conflicts=('firefox-extension-fxbutton')
source=("$pkgname::git+https://github.com/seleznev/firefox-extension-fxbutton.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname/extension"
  sed -n 's/.*<em:version>\(.*\)<\/em:version>.*/\1/;T;p;q' install.rdf
}

package() {
  cd "$srcdir/$pkgname/extension"
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid
  install -d $dstdir
  mv * $dstdir
}
