# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Hiroki Umezaki <raa0121@gmail.com>
pkgname=dodontof
pkgver=1.38.00
pkgrel=1
epoch=
pkgdesc="DodontoF is online RPG session site, Anyone can use."
arch=('any')
url="http://www.dodontod.com/"
license=('GPL')
groups=()
depends=('ruby' 'apache')
makedepends=('unzip')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://www.dodontof.com/Download/DodontoF_release/DodontoF_Ver.${pkgver}_kyuusaiNoGihou.zip"
        DodontoFServer.patch)
noextract=('[source].zip')

#gerate with 'makepkg -g'
md5sums=('863c516965f6e8fa23f923cd4ca57efd'
         'c67b0e7ab390413a742f54ed9b7c6754')

build() {
  mkdir -p ${pkgdir}/srv/http
  patch -p0 ${srcdir}/DodontoF_WebSet/public_html/DodontoF/DodontoFServer.rb < DodontoFServer.patch
  cd "${srcdir}/DodontoF_WebSet/public_html/DodontoF"
  chmod 755 DodontoFServer.rb ../../saveData ../imageUploadSpace ../imageUploadSpace/smallImages saveDataTempSpace fileUploadSpace replayDataUploadSpace
  chmod 666 log.txt log.txt.0
  rm src_actionScript.zip
  cd "${srcdir}/DodontoF_WebSet/public_html"
  mv DodontoF ${pkgdir}/srv/http/DodontoF
  mv imageUploadSpace ${pkgdir}/srv/http/imageUploadSpace
  cd "${srcdir}/DodontoF_WebSet"
  mv saveData ${pkgdir}/srv/saveData
  chown -R http:http ${pkgdir}/srv/http/DodontoF ${pkgdir}/srv/http/imageUploadSpace ${pkgdir}/srv/saveData
}
  
# vim:set ts=2 sw=2 et:
