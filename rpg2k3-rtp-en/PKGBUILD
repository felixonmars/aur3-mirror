pkgname=rpg2k3-rtp-en
pkgver=1.08
pkgrel=2
pkgdesc="The unofficial English RPG Maker 2003 runtime package"
arch=('i686' 'x86_64')
url="http://www.rpgmakerweb.com/"
license=('unknown')
source=('https://dl.dropboxusercontent.com/u/5968004/rpg2k3-rtp-en-1.08.tar.gz')
md5sums=('59c4a1e617da3e32aef08f5fca184b32')
optdepends=('wine: running RPG_RT.exe'
            'rpglauncher: RPG Maker game launcher utility')

build() {
  echo "Built"
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/rpgrtp/2003/en"
  mv "$pkgname-$pkgver"/* "$pkgdir/usr/share/rpgrtp/2003/en"
}
