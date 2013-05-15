# Maintainer: Miguel Revilla <yo@miguelrevilla.com>
# Contributor: Markus Opitz <mastero23 at gmail dot com>

pkgname=dbtoepub
pkgver=1.78.1
pkgrel=1
pkgdesc="DocBook to .epub converter"
arch=('any')
url="http://docbook.sourceforge.net/"
license=('unknown')
depends=('docbook-xsl=1.78.1' 'libxslt' 'ruby' 'zip')
source=(http://downloads.sourceforge.net/sourceforge/docbook/docbook-xsl-${pkgver}.tar.bz2
        dbtoepub.patch)
md5sums=('6dd0f89131cc35bf4f2ed105a1c17771'
         '2e68b52ef053209640ba769a1d0695d2')

package() {
  cd "$srcdir/docbook-xsl-$pkgver/epub/bin/"
  patch -p1 < "$srcdir/dbtoepub.patch"
  install -D -m 644 lib/docbook.rb "$pkgdir/usr/lib/ruby/vendor_ruby/dbtoepub/docbook.rb"
  install -D -m 755 dbtoepub "$pkgdir/usr/bin/dbtoepub"
}
