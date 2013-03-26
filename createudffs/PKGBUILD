pkgname=createudffs
pkgver=0.1
pkgrel=1
pkgdesc="Create UDF Filesystem is a QT4 frontend for mkudffs from the udftools collection."
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Create+UDF+Filesystem?content=79265"
license=('GPL2	')
depends=('qt4' 'udftools')
source=("http://kde-apps.org/CONTENT/content-files/79265-${pkgname}-${pkgver}.tar.bz2"
	"${pkgname}.desktop")
md5sums=('023b05260161067873d31554bd79b4ac'
         'f0500170c3e66bfca0f9d4ca9397211d')
install=${pkgname}.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake-qt4
  make 
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 createudffs-0 ${pkgdir}/usr/bin/createudffs
  for size in 32 48 64; do
    install -Dm 644 icons/"$size"x"$size"/create_filesystem.png ${pkgdir}/usr/share/icons/hicolor/"$size"x"$size"/create_filesystem.png
  done
  install -Dm 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}  
