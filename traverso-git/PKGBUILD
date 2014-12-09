# Maintainer: 
# Contributor: sekret, mail=$(echo c2VrcmV0QHBvc3Rlby5zZQo= | base64 -d)
# Contributor: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Philipp Überbacher <murks at lavabit dot com>
pkgname=traverso-git
pkgver=3429.4f4a708
pkgrel=1
pkgdesc="DAW with an innovative and fast Graphical User Interface"
arch=('i686' 'x86_64')
url="http://traverso-daw.org"
license=('GPL')
depends=('jack' 'lame' 'wavpack' 'qt4' 'fftw' 'libmad' 'lilv')
makedepends=('git' 'cmake')
provides=("traverso")
conflicts=("traverso")
install="traverso.install"
# traverso.1 taken from:
# http://ftp.debian.org/debian/pool/main/t/traverso/traverso_0.49.4-1.debian.tar.xz
source=("$pkgname::git://git.sv.gnu.org/traverso.git" traverso.1 )
md5sums=('SKIP'
         'da7454cb60b276aa1637ad79250e9ffb')

pkgver() {
	cd "$pkgname"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "$pkgname"
  [[ -d bld ]] || mkdir bld && cd bld
  cmake ..	-DCMAKE_INSTALL_PREFIX="/usr" \
		-DCMAKE_SHARED_LINKER_FLAGS+=" -Wl,--no-undefined -Wl,--as-needed" \
		-DCMAKE_MODULE_LINKER_FLAGS+=" -Wl,--no-undefined -Wl,--as-needed" \
		-DUSE_INTERNAL_SLV2_LIB=OFF \
		-DWANT_MP3_ENCODE=ON \
		-DWANT_DEBUG=OFF
  make
}

package() {
  cd "$pkgname"
  cd bld; make DESTDIR="$pkgdir/" install
  cd ../resources
  # desktop file
  sed '/Path/d' -i traverso.desktop 
  install -Dm644  traverso.desktop "$pkgdir"/usr/share/applications/traverso.desktop

  # icons
  install -dm755 "$pkgdir"/usr/share/icons/hicolor
  cp -a freedesktop/icons/* "$pkgdir"/usr/share/icons/hicolor

  # mime & docs & man
  install -Dm644 x-traverso.xml "$pkgdir"/usr/share/mime/packages/x-traverso.xml
  install -Dm644 help.text "$pkgdir"/usr/share/doc/traverso/help.txt
  install -Dm644 "${srcdir}"/traverso.1 "$pkgdir"/usr/share/man/man1/traverso.1
}
