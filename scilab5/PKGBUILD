# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Simon Lipp <sloonz+aur@gmail.com>
# Paulo Matias
# Holger Nahrstaedt

pkgname=scilab5
pkgver=5.5.0
pkgrel=7
pkg_addon=-beta-1
pkgdesc='A scientific software package for numerical computations.(5.5.0-beta-1)'
arch=('i686' 'x86_64')
provides=("scilab5=$pkgver$pkg_addon")
conflicts=('scilab' 'scilab-master' 'scilab5-bin' 'scilab-git')
url='http://www.scilab.org/'
license=('custom:CeCILL')
depends=('pcre' 'fftw' 'tk' 'hdf5' 'java-environment' 'arpack' 'shared-mime-info'  'desktop-file-utils' 'hicolor-icon-theme' 'java-commons-beanutils' 'gcc-fortran')
makedepends=('apache-ant' 'antlr2' 'awk' 'umfpack' 'ocaml')
[[ $CARCH == x86_64 ]] && \
  source=(
   "http://www.scilab.org/download/$pkgver${pkg_addon}/prerequirements-scilab-$pkgver${pkg_addon}-x86_64-src.tar.gz" 
  "http://www.scilab.org/download/${pkgver}${pkg_addon}/scilab-${pkgver}${pkg_addon}-src.tar.gz" 
  'scilab5.desktop')

[[ $CARCH == i686 ]] && \
  source=("http://www.scilab.org/download/$pkgver${pkg_addon}/prerequirements-scilab-${pkgver}${pkg_addon}-src.tar.gz" \
"http://www.scilab.org/download/${pkgver}${pkg_addon}/scilab-${pkgver}${pkg_addon}-src.tar.gz" \
  'scilab5.desktop')
[[ $CARCH == x86_64 ]] && md5sums=(
  'c3007994385666eff7ec768ac6e83989'
  '94b3538d731b2e16395574360bc239e9'
  'ad6286f324891fe8b86c60e4012a36b7')
[[ $CARCH == i686 ]] && md5sums=('0e1a5a45f6d921afe204be9fe02d8de9'
  '94b3538d731b2e16395574360bc239e9'
  'ad6286f324891fe8b86c60e4012a36b7')
 
install=$pkgname.install
options=('!libtool' '!emptydirs')

build() {
  LDFLAGS=${LDFLAGS/ -Wl,--as-needed}
  cd $srcdir/scilab-$pkgver$pkg_addon
 [[ $CARCH == x86_64 ]] && ./configure \
    --prefix=/usr \
    --enable-build-localization \
    --without-matio \
    --with-umfpack \
    --with-fftw \
    --with-modelica \
    --with-gfortran  # Needed for 64 bits, don't hurt for 32 bits

 [[ $CARCH == i686 ]] && ./configure \
    --prefix=/usr \
    --enable-build-localization \
    --without-matio \
    --with-umfpack \
    --with-fftw \
    --with-modelica 

  cp etc/classpath.xml.vc etc/classpath.xml
  make all doc
}

package() {
  cd scilab-${pkgver}${pkg_addon}
  make DESTDIR="${pkgdir}" install install-html

  install -d ${pkgdir}/usr/share/licenses/scilab
  install -Dm644 ${srcdir}/scilab-${pkgver}${pkg_addon}/COPYING \
	${pkgdir}/usr/share/licenses/scilab
  install -Dm644 ${srcdir}/${pkgname}.desktop \
	${pkgdir}/usr/share/applications/${pkgname}.desktop
  sed -i 's#/jni##' ${pkgdir}/usr/share/scilab/etc/librarypath.xml
  cd $srcdir/scilab-${pkgver}${pkg_addon}/thirdparty
  for _i in *.jar
  do
    install -Dm644 ${_i} $pkgdir/usr/share/scilab/thirdparty/${_i}
  done
  #cd $srcdir/scilab-${pkgver}${pkg_addon}/bin
  #install -Dm644 libgluegen2-rt.so $pkgdir/usr/lib/scilab/libgluegen2-rt.so
  #install -Dm644 libjogl_cg.so $pkgdir/usr/lib/scilab/libjogl_cg.so
  #install -Dm644 libjogl_desktop.so $pkgdir/usr/lib/scilab/libjogl_desktop.so
  #install -Dm644 libnativewindow_awt.so $pkgdir/usr/lib/scilab/libnativewindow_awt.so
  #install -Dm644 libnativewindow_x11.so $pkgdir/usr/lib/scilab/libnativewindow_x11.so
  #install -Dm644 libnewt.so $pkgdir/usr/lib/scilab/libnewt.so

}
