# Maintainer: Tianjiao Yin <ytj000@gmail.com>

_realname=84344-BlackFate.tar.gz
pkgname=gtk2-theme-black-fate
pkgver=1.4
pkgrel=1
pkgdesc="The objetive is create the most readable ambient united with the blackest style."
arch=('any')
url="http://gnome-look.org/content/show.php/?content=84344"
license=('GPL')
groups=('gtk2-themes')
install='theme.install'
source=(http://gnome-look.org/CONTENT/content-files/${_realname})
md5sums=('f5743f25d4c4ee87e041a2607257414c')

build() {
  cd ${srcdir}
  rm ${_realname}
  mkdir -p ${pkgdir}/usr/share/themes
  mv ${srcdir}/* ${pkgdir}/usr/share/themes
}

# vim:set ts=2 sw=2 et:
