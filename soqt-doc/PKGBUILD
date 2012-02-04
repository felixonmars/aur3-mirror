# Contributor: mickele
pkgname=soqt-doc
pkgver=1.5.0
pkgrel=2
pkgdesc="HTML documentation for SoQt library and examples from SoGuiExamples"
arch=('i686' 'x86_64')
url="http://www.coin3d.org/lib/soqt/"
license="GPL"
depends=()
makedepends=('make' 'gcc' 'doxygen' 'soqt' 'coreutils' 'mercurial')
provides=()
replaces=()
backup=()
install=
options=('docs')                                                            
source=("http://ftp.coin3d.org/coin/src/all/SoQt-${pkgver}.tar.gz")

build() {
  cd "${srcdir}" || return 1

  mkdir -p build || return 1
  cd build || return 1
  ../SoQt-${pkgver}/configure --prefix=/usr \
			      --enable-html \
    			      --disable-debug \
			      --disable-dependency-tracking \
			      --disable-maintainer-mode \
    			      --enable-shared \
			      --with-qt=/usr \
			      || return 1

  make DESTDIR="${pkgdir}" install || return 1

  rm -rf "${pkgdir}/usr/lib" || return 1
  rm -rf "${pkgdir}/usr/bin" || return 1
  rm -rf "${pkgdir}/usr/include" || return 1
  rm -rf "${pkgdir}/usr/share/Coin" || return 1
  rm -rf "${pkgdir}/usr/share/aclocal" || return 1
  rm -rf "${pkgdir}/usr/share/man" || return 1

  cd "${srcdir}" || return 1
  (cd default && hg update) || hg clone http://hg.sim.no/SoGuiExamples/default || return 1

  mkdir -p build-examples || return 1
  cd build-examples || return 1
  ../default/configure --with-soqt \
		       --disable-debug \
		       --disable-dependency-tracking \
		       --disable-maintainer-mode \
		       || return 1
  make || return 1
  for _FILE in `find ./ -name *.o`
  do
	rm -f "${_FILE}" || return 1
  done
  install -m755 -d "${pkgdir}/usr/share/doc/soqt/examples" || return 1
  for _FILE in actions \
      	       annex \
	       coin-competitions \
	       components \
	       draggers \
	       engines \
	       eyecandy \
	       manipulators \
	       nodekits \
	       nodes \
	       sensors \
	       sound \
	       volumerendering \
	       Makefile
  do
	cp -rf "${_FILE}" "${pkgdir}/usr/share/doc/soqt/examples" || return 1
  done
  cp -rf "${srcdir}/default/sound/clips" "${pkgdir}/usr/share/doc/soqt/examples/sound" || return 1
}
md5sums=('9f1e582373d66f556b1db113a93ac68e')
