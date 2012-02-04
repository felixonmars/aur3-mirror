# Contributor: Josef Gosch <josef.gosch@gmail.com>

pkgname=ffscreenvid
pkgver=0.01
pkgrel=1
pkgdesc="Record your screen into a video file."
arch=(i686 x86_64)
url="http://tintifax.dyndns.org"
license="GPL"
depends=('perl>=5.10.0' 'gtk2-perl' 'ffmpeg')
source=(http://shellbox.nvita.org/~tintifax/${pkgname}-${pkgver}.tar.gz)
md5sums=('15ba9b7fec53480832e243d1d3868f5a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/
  mkdir -p $pkgdir/usr/lib/ffscreenvid/ffscreenvid
  mkdir -p $pkgdir/usr/share/ffscreenvid
  mkdir -p $pkgdir/usr/bin
  cp ffscreenvid/*.pm $pkgdir/usr/lib/ffscreenvid/ffscreenvid
  cp ffscreenvid.pm $pkgdir/usr/lib/ffscreenvid/
  cp CHANGELOG TODO $pkgdir/usr/share/ffscreenvid/
  cp run.pl $pkgdir/usr/bin/ffscreenvid
  chmod +x $pkgdir/usr/bin/ffscreenvid
}
