# Maintainer: cephalostrum <durandal.rubicon at gmail dot com>
# Contributor: rabyte <rabyte*gmail>

pkgname=alephone-rubiconx
pkgver=1.0
pkgrel=4
pkgdesc="A free first person shooter that continues the story of Bungie's Marathon trilogy"
arch=('any')
url="http://www.marathonrubicon.com/"
license=('unknown')
depends=('alephone')
makedepends=('unzip')
source=(http://files5.bungie.org/marathon/marathonRubiconX.zip \
	$pkgname.sh)
noextract=(marathonRubiconX.zip)
md5sums=('a91a091d4b02082464e7a93f551ba221' 'ceb271fff4cdbc3c156ec688cdcb9c00')

package() {
  msg "Extracting sources..."
  unzip -qqo marathonRubiconX.zip || return 1

  mkdir -p $pkgdir/usr/share/alephone/scenarios
  cp -rf "Rubicon X ƒ" $pkgdir/usr/share/alephone/scenarios/${pkgname/alephone-/}
  find $pkgdir -type f -exec chmod 644 {} \;

  install -m755 -D ../$pkgname.sh $pkgdir/usr/bin/$pkgname
}
