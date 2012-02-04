# Mantainer: Denilson Paião <depaiao@gmail.com>

pkgname=hycons-icon-theme
_pkgname=Hycons
pkgver=14.07.11
pkgrel=2
pkgdesc="Icon theme created especially for KDE 4"
arch=('any')
url="http://kde-look.org/content/show.php/Hycons?content=101767"
license=('Creative Commons')
source=("https://dl.dropbox.com/s/ww4ee68rm2dg80l/${_pkgname}.tar.gz")
md5sums=('fa694573bf24c0883b4b04054b4cb67e')
          
build() {
  cd "${srcdir}/${_pkgname}"

  # fixing permissions
  find -type f -print0 | xargs -0 chmod 644
  find -type d -print0 | xargs -0 chmod 755
  # Delete dot files
  find . -iname '._*' | xargs rm -rf
  find . -iname '.DS_Store' | xargs rm -rf
}

package() {
  install -d "${pkgdir}/usr/share/icons/"
  cp -R "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/icons/"
}
