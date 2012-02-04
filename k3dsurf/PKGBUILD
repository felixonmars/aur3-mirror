# Maintainer: moostik <mooostik_at_gmail.com>
# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=k3dsurf
pkgver=0.6.2.4
pkgrel=2
pkgdesc="A program to visualize and manipulate multi-dimensional surfaces by using Mathematical equations"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/?content=50062"
license=('GPL2')
depends=('qt3')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz" \
        "${pkgname}.desktop")
md5sums=('21602ba004d532f8fd367c29bde5ab08'
         'bfc0e296f7de91ffb130533f7790a3e5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  source /etc/profile.d/qt3.sh
  export PATH="$QTDIR/bin:$PATH"

  rm src/Makefile 
  rm Makefile

  "$QTDIR/bin/qmake"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install executable
  install -D -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Install shortcut and icon
  install -D -m644 "icon/catenoid_mini_64x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}