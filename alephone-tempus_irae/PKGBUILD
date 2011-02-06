# Contributor: Christoph Zeiler <rabyteNOSPAM_at_gmx.dot.org>

pkgname=alephone-tempus_irae
pkgver=1
pkgrel=1
pkgdesc="A new AlephOne scenario set in the Marathon universe"
arch=('any')
url="http://nardo.bungie.org/alephone.php"
license=('unknown')
depends=('alephone')
source=(http://nardofiles.bungie.org/Tempus_Irae.zip \
	http://nardofiles.bungie.org/Tempus_Premium_Landscapes.zip \
	$pkgname.sh)
md5sums=('4a707967e062c12236a71f3cfd29602b'
         '67df8460cc51074289e154ca9e7d4ad9'
         '2360aaf627cd1a63c25e37ce00344eaf')

build() {
  cd Tempus_Irae

  cp -rf ../Tempus_Premium_Landscapes/. .
  rm -f *.html *.pdf *.txt
  find -type f -exec chmod 644 {} \;

  mkdir -p "$pkgdir"/usr/share/alephone/scenarios/tempus_irae
  cp -rf . "$pkgdir"/usr/share/alephone/scenarios/tempus_irae/

  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
}

# vim:set ts=2 sw=2 et:
