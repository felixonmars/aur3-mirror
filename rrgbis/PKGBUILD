# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jacek Poplawski <jacekpoplawski@gmail.com>
# Contributor: Ivan Dimitrov <madcat87@gmail.com>

pkgname=rrgbis
pkgver=1.15
pkgrel=1
pkgdesc="Really Rather Good Battles In Space"
arch=('i686' 'x86_64')
url="http://rrgbis.sourceforge.net/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'freetype2' 'glu')
options=('!makeflags')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2
        http://downloads.sourceforge.net/rrgbis/$pkgname-1.13-data.tar.bz2)
md5sums=('d2f29bf9162e743fe843927a84741986'
         'bfce20dae3b114e67bc2f6196f1248f0')

build() {
  cd "${srcdir}"/rrgbis/src/FTGL
  ./configure --prefix=/usr --sysconfdir=/etc

  cd "${srcdir}"/rrgbis
  make
}

package() {
  cd "${srcdir}"/rrgbis

  install -d "${pkgdir}"/usr/share
  cp -R "${srcdir}"/rrgbis "${pkgdir}"/usr/share


  install -d "${pkgdir}"/usr/share/{applications,icons}
  mv "${pkgdir}"/usr/share/rrgbis/rrgbis.png "${pkgdir}"/usr/share/icons/rrgbis.png
  mv "${pkgdir}"/usr/share/rrgbis/rrgbis.desktop "${pkgdir}"/usr/share/applications/rrgbis.desktop
  install -Dm755 rrgbis.sh "${pkgdir}"/usr/bin/$pkgname
  rm -rf "${pkgdir}"/usr/share/rrgbis/src
}
