# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=khanacademy
pkgver=0.2.5
pkgrel=1
pkgdesc="KhanAcademy is a Perl script to list and play with MPlayer videos from http://www.khanacademy.org/"
arch=('any')
url="http://i51.tinypic.com/3587515.jpg"
license=('GPL')
depends=('perl-libwww' 'youtube-viewer' 'mplayer')
source=("http://trizen.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('596688e6030d5bcfc0846f68722ef95f')

package() {
  install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
