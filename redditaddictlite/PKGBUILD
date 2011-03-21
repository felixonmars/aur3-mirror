# Contributor: Wido <widomaker2k7@gmail.com>

pkgname=redditaddictlite
pkgver=1.0
pkgrel=2
pkgdesc="track your karma in real-time."
arch=('i686' 'x86_64')
url="http://www.reddit.com/redditaddict/"
license=('custom')
depends=('adobe-air')
makedepends=('unzip')
source=('http://addons.reddit.com/redditaddict/RedditAddictLite.air'
        'redditaddictlite.desktop' 'redditaddictlite.sh')

build()
{
   cd ${srcdir}/

   install -m644 -D ${srcdir}/assets/icons/128.png ${startdir}/pkg/usr/share/pixmaps/$pkgname.png
   install -m644 -D ${srcdir}/RedditAddictLite.air ${startdir}/pkg/opt/$pkgname/$pkgname.air
   install -m755 -D ${srcdir}/$pkgname.sh ${startdir}/pkg/usr/bin/$pkgname
   install -m644 -D ${srcdir}/$pkgname.desktop ${startdir}/pkg/usr/share/applications/$pkgname.desktop
}
md5sums=('169ddf5680770a3d21f71a355a775375'
         '9d14d7957b01d212892bb93d19476222'
         'cbd66f6e85ea9b1e8e0785e2e5ce7855')
