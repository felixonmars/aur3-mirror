# Contributor : wizzomafizzo <wizzomafizzo@gmail.com>
pkgname=nethack-spoilers
pkgver=343
pkgrel=2
arch=(any)
pkgdesc="Spoiler files for the roguelike Nethack"
url="http://www.spod-central.org/~psmith/nh/"
license=(custom)
depends=()
source=(http://www.spod-central.org/~psmith/nh/spoi-$pkgver.tar.gz \
        http://www.spod-central.org/~psmith/nh/gazetteer.tar.gz)
md5sums=('3caa587331fa851e2af028c4b9c33275'
         '83d160115d2d48ab6ee08b502ac2d325')

build() {
  cd $startdir/src
  mkdir -p $startdir/pkg/usr/share
  cp -ar nhspoilers $startdir/pkg/usr/share/$pkgname

  install -Dm644 nhspoilers/README \
          $startdir/pkg/usr/share/licenses/$pkgname/README.spoilers
  install -Dm644 nhspoilers/gazetteer/README \
          $startdir/pkg/usr/share/licenses/$pkgname/README.gazetteer
}
