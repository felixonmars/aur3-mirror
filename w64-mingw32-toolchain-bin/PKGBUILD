# Maintainer: Dwight Schauer <dschauer at gmail dot com>
# Based on mingw-w64-bin by Daniele Zelante <zeldan at zeldan dot net>

_ver="4.6.3"
_dev="rubenvb"

_pkg=w64-mingw32-gcc
pkgname=w64-mingw32-toolchain-bin

_actual_file="x86_64-${_pkg}-${_ver}-linux_${_dev}.tar.lzma"

_dl_url="http://downloads.sourceforge.net/project/mingw-w64"
_repo="${_dl_url}/Toolchains%20targetting%20Win64/Personal%20Builds/${_dev}/${_ver}"

#epoch=1

pkgver="${_ver}_${_dev}"
pkgrel=1
pkgdesc="MinGW Toolchain fork for building Windows x86_64 executables - build provided by mingw-w64 upstream ${_dev}"
url="http://mingw-w64.sourceforge.net/"
arch=('x86_64')
license=('GPL')
depends=('bash' 'zlib')
makedepends=('bar' 'lzma')
options=(!strip docs zipman !emptydirs !libtool)
source=(${_repo}/${_actual_file} pkg-config)
noextract=(${_actual_file})

conflicts=(mingw-w64-bin mingw-w64-pkg-config)

install=

_prefix=x86_64-w64-mingw32-

build () {
  msg2 "Nothing to build"
}

_extract_tar_ball () {
  msg2 "Extracting files from binary tarball : "
  bar "${SRCDEST}/${_actual_file}" | tar --lzma -x
}

_fixate_permissions () {
  msg2 "Fixating permissions on files ... "
  chmod -R a+X,a+r .
  find . -name '*.a' -exec chmod -x {} \;
}

_make_bin_symlinks () {
  msg2 "Creating /usr/bin symlinks"
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  find "../../opt/${pkgname}/mingw64/bin/" \
    -type f -name ${_prefix}'*' -exec ln -s {} \;
}

_make_man_symlinks () {
  msg2 "Creating /usr/share/man symlinks"

  mkdir -p "${pkgdir}/usr/share"
  cd ${pkgdir}/usr/share
  _share_="../../opt/${pkgname}/mingw64/share"
  _share_man_=$(find "${_share_}/man" -type d)
  mkdir -p $(echo ${_share_man_} |  sed "s@${_share_}/@@g")

  _make_symlinks_=$(\
    find ${_share_}/man -type f -name ${_prefix}'*' | \
      awk '{\
        _len_=2+length("'${_share_}'");
        printf ("ln -s %s %s && ", $1, substr ($1, _len_), $0);\
      }'\
    )
  sh -c "${_make_symlinks_} true"
}

package () {
  sed s,##INSTALL_ROOT##,/opt/${pkgname}/mingw64, -i pkg-config

  mkdir -p "${pkgdir}/opt/${pkgname}"
  cd "${pkgdir}/opt/${pkgname}"

  _extract_tar_ball
  _fixate_permissions

  install -m 755 ${srcdir}/pkg-config \
    ${pkgdir}/opt/${pkgname}/mingw64/bin/${_prefix}pkg-config

  _make_bin_symlinks
  _make_man_symlinks

  msg2 "Done preparing package tree"
}

sha256sums=('832c7cb1b1e065bad64c6b1c0a1c3002533ac486a227b88ac36ddfd8d3dd50e7'
            'e0403687a2d8dfe135058a020d478eedc4895479fab734834f12e457a3194c14')
