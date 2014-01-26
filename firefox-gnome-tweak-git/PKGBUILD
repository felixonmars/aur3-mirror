# Maintainer: XZS <d.f.fischer at web dot de>
pkgname=firefox-gnome-tweak-git
pkgver=24.0
pkgrel=1
pkgdesc='GNOME Theme Tweak extension for Mozilla Firefox'
url='https://github.com/gnome-integration-team/firefox-gnome-tweak'
arch=('any')
license=('MPLv2')
depends=('firefox-theme-adwaita-git')
source=("$pkgname::git+https://github.com/gnome-integration-team/firefox-gnome-tweak")
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
