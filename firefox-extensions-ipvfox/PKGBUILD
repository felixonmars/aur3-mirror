# Maintainer: Jannis Pinter <jannis@pinterjann.is>

pkgname=firefox-extensions-ipvfox
pkgver=0.8.6.1
pkgrel=1
pkgdesc="List hosts and addresses, from which a page and its resources are loaded."
arch=('any')
url="https://github.com/Dagger0/IPvFox"
license=('GPL3')
groups=('firefox-addons')
depends=('firefox')
source=("https://addons.mozilla.org/firefox/downloads/file/291704/ipvfox-${pkgver}-sm+fx.xpi")
sha256sums=('7a8d5810dec736179b9b568f9d520b3d6ab5c8e4c255d051b54cf41f3c6c916f')

package() {
  cd $srcdir
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  install -d $dstdir
  cp -R * $dstdir
  rm $dstdir/*.xpi
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}

