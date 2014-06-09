# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=make_ext4fs-git
pkgver=20140608
pkgrel=1
pkgdesc="A utility for creating ext4 filesystem images"
arch=('i686' 'x86_64')
url="https://android.googlesource.com/platform/system/extras/+/master/ext4_utils/"
license=('GPL')
depends=('zlib')
makedepends=('git')

_gitroot=('https://android.googlesource.com/platform/system/core'
          'https://android.googlesource.com/platform/system/extras'
          'https://android.googlesource.com/platform/external/libselinux')

prepare() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  for giturl in ${_gitroot[@]}; do
    gitdir=$(basename ${giturl})
    if [[ -d "${gitdir}" ]]; then
      pushd "${gitdir}"
      git pull origin
      popd
      msg "The local files are updated."
    else
      git clone --depth 1 "${giturl}" "${gitdir}"
    fi

    msg "${gitdir} checkout done or server timeout"
  done

  msg "Cloning extras for build..."
  rm -rf "$srcdir/extras-build"
  git clone "$srcdir/extras" "$srcdir/extras-build"
}

build() {
  cd "$srcdir/extras-build/ext4_utils"

  cc ${CFLAGS} -Wall \
    -o make_ext4fs \
    -DHAVE_ANDROID_OS -DHOST \
    -I${srcdir}/core/libsparse/include \
    -I${srcdir}/libselinux/include \
    -lz \
    make_ext4fs_main.c \
    make_ext4fs.c \
    ext4fixup.c \
    ext4_utils.c \
    allocate.c \
    contents.c \
    extent.c \
    indirect.c \
    uuid.c \
    sha1.c \
    wipe.c \
    crc16.c \
    ext4_sb.c \
    ${srcdir}/core/libsparse/backed_block.c \
    ${srcdir}/core/libsparse/output_file.c \
    ${srcdir}/core/libsparse/sparse.c \
    ${srcdir}/core/libsparse/sparse_crc32.c \
    ${srcdir}/core/libsparse/sparse_err.c \
    ${srcdir}/core/libsparse/sparse_read.c \
    ${srcdir}/libselinux/src/callbacks.c \
    ${srcdir}/libselinux/src/check_context.c \
    ${srcdir}/libselinux/src/freecon.c \
    ${srcdir}/libselinux/src/init.c \
    ${srcdir}/libselinux/src/label.c \
    ${srcdir}/libselinux/src/label_android_property.c \
    ${srcdir}/libselinux/src/label_file.c
}

package() {
  cd "$srcdir/extras-build/ext4_utils"

  install -Dm755 make_ext4fs "${pkgdir}/usr/bin/make_ext4fs"
}

# vim:set ts=2 sw=2 et:
