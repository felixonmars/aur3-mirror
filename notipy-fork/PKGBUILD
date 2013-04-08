# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=notipy-fork
pkgver=0.6
pkgrel=3
pkgdesc='A minimalistic gtk3 notification daemon written in python.'
arch=('any')
url='https://github.com/LaraCraft304/notipy'
license=('GPL')
conflicts=('notification-daemon')
provides=('notification-daemon' "notipy=$pkgver")
depends=('python2-gobject' 'gtk3' 'dbus-python')
optdepends=('libcanberra: for sound support')
options=(!emptydirs)
install="${pkgname}.install"
source=("https://github.com/LaraCraft304/notipy/tarball/npf-$pkgver"
        "${pkgname}.install")
md5sums=('6a87b7c123e1b467bc33dc6e23fa5cc9'
         '8b991923cb5f70083a303787dca95923')

package() {
  cd "$srcdir/LaraCraft304-notipy-10d4cc8"
  
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}
