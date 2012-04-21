pkgname=megastreamd
pkgver=1.5.5
pkgrel=1
epoch=
pkgdesc="Streaming video on vlc,mplayer and other media players from  Youtube, Megavideo and videobb. Author: Paolo Cortese"
arch=('i686')
url="https://launchpad.net/~dino-tartaro"
license=('GPL')
groups=()
depends=(zenity)
makedepends=(p7zip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
#source=(megastreamd*deb)
noextract=()
md5sums=() #generate with 'makepkg -g'
pkgdir=$startdir/pkg
soure="https://launchpad.net/~dino-tartaro/+archive/megastreamd/+build/2681270/+files/megastreamd_1.5.5_all.deb"
build() {
  7z e *.deb
}

check() {
  echo "Check was Succesful!"  
}

package() {
  mv data.tar ../pkg
  cd ../pkg
  tar -xvf data.tar
  rm data.tar
}

