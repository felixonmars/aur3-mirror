# Maintainer: peace4all <markspost at rocketmail dot com>
pkgname=rhythmbox-repeat-one-song
pkgver=0.2
pkgrel=1
pkgdesc="Repeat one song feature for Rhythmbox"
url="https://launchpad.net/repeat-one-song"
arch=('i686' 'x86_64')
license=('GPL')
depends=('rhythmbox>=2.96')
source=("https://launchpad.net/repeat-one-song/precise/${pkgver}/+download/repeat-one-song_${pkgver}_stable.tar.gz")
md5sums=('d1ed5a2fe75ae82c5864c62873df44f3')


package() {
  cd "${srcdir}/repeat-one-song"
  mkdir -p "$pkgdir/usr/lib/rhythmbox/plugins/repeat-one-song"
  cp -R {*.py,*.plugin,README} "$pkgdir/usr/lib/rhythmbox/plugins/repeat-one-song"

  mkdir -p "$pkgdir/usr/share/rhythmbox/plugins/repeat-one-song"
  cp -R *.svg "$pkgdir/usr/share/rhythmbox/plugins/repeat-one-song/"
}
