# Sam May (sam.m4y@gmail.com) 
pkgname=ekee
pkgver=2.0.2
pkgrel=1
pkgdesc="A LaTeX equation editor that produces images in several common formats"
license=('GPL')
arch=('i686' 'x86_64')
depends=('ruby' 'ruby-qt4' 'tetex' 'pstoedit' 'xdg-utils')
url="http://rlehy.free.fr/"
source=(http://rlehy.free.fr/ekee-2.0.2.tar.bz2)
md5sums=('9a703cc7894341485c9b4784c23bb963')

build() {
  cd ${srcdir}/ekee-${pkgver}
  make install DESTDIR=${pkgdir} PREFIX=/usr || return 1
  rm -r ${pkgdir}/usr/share/doc
}