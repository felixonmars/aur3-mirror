# Maintainer: David Zaragoza <david@zaragoza.com.ve>
pkgname=poa
pkgver=0.1
pkgrel=1
pkgdesc="PagesOfAdventure is a puzzle adventure in a strange world."
arch=('i686' 'x86_64')
url="http://pagesofadventur.sourceforge.net"
license=('GPL')
groups=()
depends=('libxxf86vm' )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('https://downloads.sourceforge.net/project/pagesofadventur/PagesOfAdventure%200.1/PagesOfAdventure-0.1-bin.tar.gz'
        'poa.png'
        'poa.desktop')
noextract=()
md5sums=('ea40fd7071536aee372e974914f7d516'
         '06b2db9ed330147a02f5b95f5fab8363'
         '60d62a371e07c552d132c8ea0f11d550')

#build() {
    #Nothing to do
#}

package() {
  mkdir -p $pkgdir/opt $pkgdir/usr/bin
  mv "$srcdir/PagesOfAdventure" $pkgdir/opt/poa
  echo "cd /opt/poa;./pagesofadventure.sh" > $pkgdir/usr/bin/poa
  chmod +x $pkgdir/usr/bin/poa
  #ln -s /opt/poa/pagesofadventure.sh $pkgdir/usr/bin/poa
  # Desktop icon
  install -Dm644 $startdir/poa.png $pkgdir/usr/share/pixmaps/poa.png
  install -Dm644 $startdir/poa.desktop $pkgdir/usr/share/applications/poa.desktop
}
