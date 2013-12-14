# Maintainer: Ben Hagan <ben dot hagan09 at gmail dot com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=gebc
pkgver=1.07
pkgrel=2
arch=(i686 x86_64)
pkgdesc="GNU External Ballistic Calculator with ballistic and target plotting."
url="https://sourceforge.net/projects/balcomp/?source=directory"
license=('GPL')
depends=('libharu' 'fltk')
groups=()
makedepends=('automake' 'autoconf' 'libtool' 'gcc')
conflicts=()
provides=("${pkgname}-${pkgver}")
replaces=()

source=("http://downloads.sourceforge.net/project/balcomp/GNU%20Ballistics%20-%20Source/Version%201.07/gebc-1.07-src.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fbalcomp%2Ffiles%2FGNU%2520Ballistics%2520-%2520Source%2FVersion%25201.07%2F&ts=1385419553&use_mirror=superb-dca2"
        'gebc.diff'
        'gebc-fl_draw.diff'
	      'autogen.sh')

md5sums=('6d284172ac0a665d03d7cdbcf4194bfe'
         '659fd7a4640fc2361273f5ec8437eea5'
         '02f8f35bb6e544818655af019b3ae0db'
	       'e223d4b6e48cc5f4f4326046e76982af')

build() {

#  cd ${srcdir}
  ## Patching with V2 patch from Mike Nix as SourceForge
  msg "Patching to update to V2........."
  patch -Np0 -i gebc.diff

  msg "Patching fl_draw.h -> H........."
  patch -Np0 -i gebc-fl_draw.diff
  
  #symlink autotools autogen script to build directory
  cp autogen.sh "${pkgname}-${pkgver}/"

#   msg "Copying system libtool files...."
#   cp /usr/share/aclocal/libtool.m4 ./admin/libtool.m4.in
#   cp /usr/share/libtool/config/ltmain.sh ./admin

  msg "Running autoreconf ...."
  cd "${pkgname}-${pkgver}"
  ./autogen.sh

  ## configure
  msg "Configuring - ${pkgname}..."
  ./configure --prefix=/usr

  make
}

package() {
  msg "Packaging ${pkgname}-${pkgver}"
  cd ${pkgname}-${pkgver}
  make -j1 DESTDIR="${pkgdir}/" install
}
