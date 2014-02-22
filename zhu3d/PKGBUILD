# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Ray Kohler <ataraxia937@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: moostik <mooostik_at_gmail.com>

pkgname=zhu3d
pkgver=4.2.4
pkgrel=2
pkgdesc="View, animate, and solve up to three functions in 3D-space in an interactive manner"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php?content=43071"
license=('GPL3')
depends=('qt4' 'mesa')
options=('docs')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz" \
        "${pkgname}.desktop"
	"${pkgname}.pri.patch"
	"${pkgname}.pro.patch")
md5sums=('c298c95936acce297a3d5616b2ea9d26'
         '48770d40bf1d9dd8f420365f2b0238cf'
         '60ae9163e2e34d87e9c13def14a46a11'
         '5e9fbe67d6fe3bddc15e1994b376c28e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Redefine the locations of the default directories
  patch -p0 < "${srcdir}/${pkgname}.pri.patch"
  # Adding a link to libGLU
  patch -p0 < "${srcdir}/${pkgname}.pro.patch"

  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install data files
  mkdir -p "${pkgdir}/usr/share/zhu3d"
  cp -r {system,work,doc} "${pkgdir}/usr/share/zhu3d/"

  # Install binary
  install -D -m755 zhu3d "${pkgdir}/usr/bin/zhu3d"

  # Install shortcut
  install -D -m644 ../"${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  rm "${pkgdir}/usr/share/zhu3d/system/icons/.directory"
}
