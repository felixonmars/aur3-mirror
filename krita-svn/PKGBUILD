# Contributor: Markus Golser <elmargol@googlemail.com>

pkgname=krita-svn
pkgver=955426
pkgrel=1
arch=('any')
pkgdesc="Krita is a painting and image editing application for KOffice"
url="http://www.krita.org"
depends=('kdebindings' 'aspell' 'wv2' 'kipi-plugins' 'qimageblitz' 'qca' 'graphicsmagick' 'poppler-qt' 'glew' 'kdepimlibs' 'imagemagick' 'python' 'mysql' 'libwpd' 'libpqxx' \
         'libxslt' 'eigen')
conflicts=('krita')
provides=('krita')
makedepends=('subversion')
source=()
md5sums=()
license=('GPL')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/
_svnmod=koffice

build() {
  cd $startdir/src

  svn co $_svntrunk$_svnmod
  cd $_svnmod
  cmake . \
  	-Wno-dev \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DCMAKE_INSTALL_PREFIX=/usr \
	-DBUILD_doc=off \
	-DBUILD_generic_wrapper=off \
	-DBUILD_karbon=off \
	-DBUILD_kchart=off \
	-DBUILD_kdgantt=off \
	-DBUILD_kexi=off \
	-DBUILD_kformula=off \
	-DBUILD_kspread=off \
	-DBUILD_kivio=off \
	-DBUILD_tools=off \
	-DBUILD_kounavail=off \
	-DBUILD_kplato=off \
	-DBUILD_kpresenter=off \
	-DBUILD_kword=off \
	-DBUILD_libkowmf=off \
	-DBUILD_musicshape=off \
	-DBUILD_krita=on || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
