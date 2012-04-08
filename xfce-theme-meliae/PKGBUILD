# Maintainer: Dirk <lowph at lotje . com>

pkgname=xfce-theme-meliae
pkgver=1.2
pkgrel=1
pkgdesc="xfce4 theme icon meliae"
arch=('any')
license=('GPL')
makedepends=()
options=(!strip)
install=meliae.install
url=('http://gnome-look.org/content/show.php/Meliae+SVG+%28dark+and+light+panels%29?content=118676')
source=(http://www.deviantart.com/download/151155215/Meliae_SVG_Icon_Theme_v__1_2_by_sora_meliae.zip
        http://www.deviantart.com/download/155756091/Meliae_SVG_Dark_v__1_2_by_sora_meliae.zip)
md5sums=('3a4092b83ea8a935ab7e2b0e9074ec23'
         '5deea7afa77d896a384bbc7dfee52d32')

build() {
  cd ${srcdir}
  tar xvf MeliaeSVG.tar.gz >> /dev/null
  mkdir -p ${pkgdir}/usr/share/icons
  cp -rf MeliaeSVG{,-Dark} "${pkgdir}"/usr/share/icons/
}
