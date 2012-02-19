# Maintainer: cuihao <cuihao dot leo at gmail dot com>

# Original PKGBUILD extra/unzip:
# $Id: PKGBUILD 150453 2012-02-17 23:22:29Z allan $
# Maintainer:
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Robson Peixoto

pkgname=unzip-beta
_pkgname=unzip
pkgver=6.10b
pkgrel=1
pkgdesc="Beta release of unzip. With iconv (to set ISO and OEM character sets) supported."
arch=('i686' 'x86_64')
url="http://www.info-zip.org/"
license=('custom')
depends=('bzip2' 'bash')
provides=('unzip=6.10b')
conflicts=('unzip')
source=('http://downloads.sourceforge.net/project/infozip/unreleased%20Betas/UnZip%20betas/unzip610b.zip')
sha1sums=('849aae577f4f94ef88c47b127f20265913750921')

build() {
  cd ${srcdir}/${_pkgname}${pkgver/./}

  # set CFLAGS -- from Debian
  # I added "-DUSE_ICONV_MAPPING"
  export CFLAGS="$CFLAGS -D_FILE_OFFSET_BITS=64 -DACORN_FTYPE_NFS \
  -DWILD_STOP_AT_DIR -DLARGE_FILE_SUPPORT -DUNICODE_SUPPORT \
  -DUNICODE_WCHAR -DUTF8_MAYBE_NATIVE -DNO_LCHMOD -DDATE_FORMAT=DF_YMD \
  -DUSE_BZIP2 -DNATIVE -DUSE_ICONV_MAPPING"

  sed -i "/MANDIR =/s#)/#)/share/#" unix/Makefile

  # make -- from Debian
  # I added "LF2=-lbz2"
  make -f unix/Makefile LOCAL_UNZIP="$CFLAGS" prefix=/usr LF2="" \
  D_USE_BZ2=-DUSE_BZIP2 L_BZ2=-lbz2 LF2=-lbz2 unzips
}

package() {
  cd ${srcdir}/${_pkgname}${pkgver/./}

  # install -- from Debian
  make -f unix/Makefile prefix=${pkgdir}/usr INSTALL_PROGRAM="install" install

  # install the license file
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/unzip/LICENSE
}

