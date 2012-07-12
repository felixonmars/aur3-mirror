# Contributor: Zsolt Udvari <udvzsolt@gmail.com>
pkgname=fet-cli
pkgver=20120712
pkgrel=1
pkgdesc="Free Timetabling Software automatically schedule the timetable of a school, high-school or university. CLI version!"
arch=("i686" "x86_64")
url="https://github.com/uzsolt/fet-cli"
license=("GPL")
depends=("qt")
makedepends=("git")

_gitroot=git://github.com/uzsolt/fet-cli.git
_gitname=fet-cli


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

  cd "$srcdir/$pkgname"

  qmake
  make
}

package() {
    cd "$srcdir/$pkgname"

    # Don't install anything else, if you want documentation, install the whole
    # fet package
    install -d "$pkdir"/usr/bin
    install -Dm755 fet "$pkgdir/usr/bin/$pkgname"
}


