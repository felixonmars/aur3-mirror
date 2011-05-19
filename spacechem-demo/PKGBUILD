# Contributor: Alex Griffin <griffin.aj@gmail.com>
pkgname=spacechem-demo
_realname=SpaceChemDemo
# Uncomment the following lines to work with the full game
#pkgname=spacechem
#_realname=SpaceChem
pkgver=1007
pkgrel=1
pkgdesc="SpaceChem is an obscenely addictive, design-based puzzle game about machine building and fake science."
arch=('i686' 'x86_64')
url="http://www.spacechemthegame.com/"
license=('custom')
depends=('mono' 'sdl' 'sdl_image' 'sdl_mixer' 'xclip')
source=("http://collinarnold.net/zachtronics/$_realname-$pkgver.tar.gz")
md5sums=('9baebb54638bfd4936d40c3b62653ef2')

if [ "$pkgname" = spacechem ]; then
  source=("$_realname-$pkgver.tar.gz")
  md5sums=('92fe56288c0369e756248857031eea8d')
fi

build() {
  cd "$srcdir"
  tar xzf ../$_realname-$pkgver.tar.gz

  if [ `arch` = x86_64 ]; then
    ./make-amd64-package.sh
    ar x $_realname-amd64.deb
  else
    ar x $_realname-i386.deb
  fi
}

package() {
  cd "$pkgdir"
  tar xzf "$srcdir/data.tar.gz"

  mkdir -p usr/share/{applications,licenses/$pkgname,pixmaps}
  mv opt/zachtronicsindustries/$pkgname/readme/* usr/share/licenses/$pkgname/
  mv opt/zachtronicsindustries/$pkgname/icon.png usr/share/pixmaps/zachtronicsindustries-$pkgname.png
  mv opt/zachtronicsindustries/$pkgname/zachtronicsindustries-$pkgname.desktop usr/share/applications/
  mv usr/bin/{zachtronicsindustries-$pkgname,$pkgname}
  rm -r opt/zachtronicsindustries/$pkgname/readme/ usr/share/menu/

  chown -Rh root:root *
}

