# Contributor: silasb <silas.baronda@gmail.com>

pkgname=sakura-my-patches
_pkgname=sakura
pkgver=2.3.8
pkgrel=1
pkgdesc="A terminal emulator based on GTK and VTE that allows you to double click to create a new terminal."
arch=('i686' 'x86_64')
url="http://pleyades.net/david/sakura.php"
license=('GPL')
depends=('vte' 'libxft' 'desktop-file-utils')
makedepends=('cmake')
provides=('sakura')
conflicts=('sakura')
source=(http://pleyades.net/david/projects/$_pkgname/$_pkgname-$pkgver.tar.bz2 \
	dbl_click_new_tab.patch)

install=sakura.install
md5sums=('5ce4c9498ea5eb909dbd03617087202e'
         'b92f2dac771930bdab2472aab377a752')
build() {
  cd $srcdir/${_pkgname}-${pkgver}

  # Set default font size a bit smaller
  sed -i 's|#define DEFAULT_FONT "Bitstream Vera Sans Mono 14"|#define DEFAULT_FONT "Bitstream Vera Sans Mono 10"|g' src/sakura.c

 # Disable "really close question"
  patch -Np0 -i ${srcdir}/dbl_click_new_tab.patch || return 1
   
  # build & install	
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE . || return 1
  make || return 1
}

package() {
  cd $srcdir/${_pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install || return 1

  # extract the keybindings from the installed documentation, rest is only relevant during build time
  awk '/^Keybindings/{f="'${pkgdir}'/usr/share/doc/'${_pkgname}'/KEYBINDINGS"} f{print > f} /^END/' \
        ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
  rm ${pkgdir}/usr/share/doc/${_pkgname}/INSTALL
}

