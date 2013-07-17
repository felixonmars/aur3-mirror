# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=mangoquest
pkgver=0.6.4
pkgrel=2
pkgdesc="1st person view pacman"
arch=(i686 x86_64)
depends=('sdl_mixer' 'mesa' 'libgl' 'sdl_image' 'sdl_ttf')
source=( http://downloads.sourceforge.net/mangoquest/${pkgname}-${pkgver}.tar.bz2 mangoquest-0.6.diff
        mangoquest.desktop)
url="https://sourceforge.net/projects/mangoquest/"
license=('GPL')
md5sums=('2433d792151bd87baacb33935b1e94d1' 'bc9b646cc61a1d6678c7bd8cd656d317' '4b51a103ae66c65d81f7f44c83323217')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  patch -p1 < ../mangoquest-0.6.diff || return 1
  ./configure --prefix=/usr
  make || return 1
  make prefix=${pkgdir}/usr install
  mkdir -p ${pkgdir}/usr/share/applications
  install ${srcdir}/mangoquest.desktop ${pkgdir}/usr/share/applications
}
