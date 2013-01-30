# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=filezilla-iceglass
_name=iceglass
pkgver=4.10
pkgrel=1
pkgdesc="Iceglass icon theme for Filezilla."
url='http://kde-look.org/content/show.php/Iceglass?content=121145'
arch=('any')
license=('GPL')
depends=('filezilla')
source=("https://dl.dropbox.com/u/6596386/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('45252281aca8bdb75f7d2a6d4d7b56af')

build() {
  cd "${srcdir}"
  rm -fr "${_name}-build"
  cp -R "${_name}" "${_name}-build"
}

package() {
  cd "${srcdir}/${_name}-build"
  install -d "${pkgdir}/usr/share/filezilla/resources/${_name}"
  cp -R "${srcdir}/${_name}-build/"* "${pkgdir}/usr/share/filezilla/resources/${_name}"
}
