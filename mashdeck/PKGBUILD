# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>
pkgname=mashdeck
pkgver=0.26
pkgrel=1
pkgdesc="Twitter application using adobe-air,similar to tweetdeck"
arch=('i686' 'x86_64')
url="http://mashable.com/mashdeck/"
license=('unknown')
depends=('adobe-air')
source=(http://downloads.tweetdeck.com/cobrands/mashable/TweetDeck_0_26.3.air $pkgname.sh)
md5sums=('133316a94253fffecd43dfe45d7130ab'
         '9a434545a7377e58d1dd3b0e5c1b281e')
build() {
cd $srcdir/
  
 install -d $pkgdir/{usr/bin,opt/$pkgname}
 install TweetDeck_0_26.3.air $pkgdir/opt/$pkgname/mashdeck.air
 install -m755 mashdeck.sh $pkgdir/usr/bin/mashdeck 
}
