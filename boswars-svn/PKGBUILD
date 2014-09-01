# Maintainer: pauld <dufresnep@gmail.com>
# Contributor: Gadget3000 <gadget3000 at msn dot com>
# Contributor: Chris Feldman <t27man89@gmail.com>
pkgname=boswars-svn
pkgver=r10239
pkgrel=1
pkgdesc="Bos Wars is a real-time strategy game that uses a modified version of the Stratagus game engine"
arch=('i686' 'x86_64')
url="http://www.boswars.org/index.shtml"
license=('GPL2')
depends=('sdl' 'mesa' 'lua51' 'libvorbis' 'libtheora' 'python' 'libpng')
makedepends=('subversion' 'scons' 'glu')
conflicts=('boswars')
provides=('boswars')
source=('boswars::svn+svn://bos.seul.org/svn/bos/bos/trunk' boswars.sh boswars.png boswars.desktop)
md5sums=('SKIP'
         '700c1ec74564c334a77403b1b2a84d74'
         '26d251560c5c4171462494d9778406c1'
         '9dd495a2f125c5b97a9523257397c492')
pkgver() {
  cd "$srcdir/boswars"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}
build() {
  cd "$srcdir/boswars"
  #./make.py  # does not work anymore with same r10225, with this new PKGBUILD
  scons
}
package() {
  mkdir -p ${pkgdir}/{opt/bos,usr/bin,usr/share/pixmaps,usr/share/applications}
  # install files
  cd "$srcdir/boswars"
  cp -rf campaigns doc graphics intro languages maps music patches scripts sounds units ${pkgdir}/opt/bos
# install -D -m 755 ${srcdir}/boswars-build/fbuild/release/boswars \
#	  ${pkgdir}/opt/bos/boswars
  install -D -m 755 ${srcdir}/boswars/build/boswars-release \
      ${pkgdir}/opt/bos/boswars
  install -D -m 755 ${srcdir}/boswars.sh \
	  ${pkgdir}/usr/bin/boswars
  install -D -m 644 ${srcdir}/boswars.png \
	  ${pkgdir}/usr/share/pixmaps/boswars.png
  install -D -m 644 ${srcdir}/boswars.desktop \
	  ${pkgdir}/usr/share/applications/boswars.desktop		
}
