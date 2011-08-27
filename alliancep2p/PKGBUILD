# Maintainer: Vojtech Kral <kral.vojtech at gmail dot com>
# Contributor: Nathan Owe <ndowens04 at gmail>

pkgname=alliancep2p
pkgver=v1.0.6
pkgrel=4
pkgdesc="Alliance is a private and secure environment to share files and communicate with people you know."
arch=(i686 x86_64)
url="http://www.alliancep2p.com/"
license=('GPL')
depends=('bash' 'java-runtime')
source=(http://downloads.sourceforge.net/alliancep2p/Alliance-$pkgver.jar 'runscript')
noextract=(Alliance-$pkgver.jar 'runscript')
md5sums=(
  'cf1ccbcfa0b4abaee5237d1ca7df3ff0'
  '533f8560ebc96390c2fe096e36107504'
) 

build()
{
  install -d  $pkgdir/usr/share/$pkgname $pkgdir/usr/bin
  install -m755 $srcdir/Alliance-$pkgver.jar $pkgdir/usr/share/$pkgname/alliancep2p.jar
  install -m755 $srcdir/runscript  $pkgdir/usr/bin/alliancep2p
}

