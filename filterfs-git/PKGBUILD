# Contributor: Zsolt Udvari <udvzsolt@gmail.com>

pkgname=filterfs-git
pkgver=20111214
pkgrel=1
pkgdesc="FUSE-based virtual filesystem that allows filtering existing filesystems"
arch=("i686" "x86_64")
url="http://filterfs.sourceforge.net/"
license=("GPL3")
depends=("fuse")
makedepends=("git")

_gitroot=git://filterfs.git.sourceforge.net/gitroot/filterfs/filterfs
_gitname=filterfs


build() {
  cd "${srcdir}"

# Download or update the library
  msg "Connecting to GIT server over HTTP..."
  if [[ -d "${_gitname}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local repository was updated."
  else
      git clone "${_gitroot}" "${_gitname}"
      msg "The remote repository was cloned."
  fi
  msg "GIT sync done or server timeout."

  cd "${_gitname}"/src
  gcc -Wall `pkg-config fuse --cflags --libs` $CFLAGS filterfs.c -o filterfs
}

package() {
  cd "${srcdir}/${_gitname}"

  install -d "${pkgdir}/usr/bin"
  install -m755 "src/filterfs" "${pkgdir}/usr/bin"

  install -d "${pkgdir}/usr/share/doc/filterfs"
  install -m644 AUTHORS ChangeLog NEWS README "${pkgdir}/usr/share/doc/filterfs"
}
