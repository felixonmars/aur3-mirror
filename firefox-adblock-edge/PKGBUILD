# Maintainer: Jannis Pinter <jannis@pinterjann.is>
# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=firefox-adblock-edge
pkgver=2.1.9
pkgrel=1
pkgdesc="Fork of Adblock Plus extension for blocking advertisements on the web."
arch=('any')
url="https://bitbucket.org/adstomper/adblockedge/"
license=('GPL')
groups=('firefox-addons')
depends=('firefox')
conflicts=('firefox-adblock-plus')
provides=('firefox-adblock-plus')
source=("https://bitbucket.org/adstomper/adblockedge/downloads/adblockedge-${pkgver}.xpi")
sha256sums=('eb7a6db8599919019083e4f41c8fc71381b6b2785d07abb0d263fbef7a1064e0')

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

