# Maintainer: Yuhei Maeda <Yuhei.Maeda_at_gmail.com>

_pkgname=emacs-pdf-tools
pkgname=$_pkgname-git
pkgver=20130411
pkgrel=2
pkgdesc="Emacs support library for PDF files"
arch=(i686 x86_64)
url=https://github.com/politza/pdf-tools
license=(GPL)
depends=("poppler-glib")
makedepends=("git")
provides=("emacs-pdf-tools")
conflicts=("emacs-pdf-tools")
souce=()
md5sums=()


_gitroot=git://github.com/politza/pdf-tools.git
_gitname=emacs-pdf-tools


build() {
  # cd "{$srcdir}"

# Update the library
  msg "Connecting to GIT server...."
  if [[ -d "{$_gitname/.git}" ]]; then
      (cd "${_gitname}" && git pull origin)
      msg "The local files are updated."
  else
      git clone "${_gitroot}" "${_gitname}"
  fi
  msg "GIT checkout done or server timeout"

  rm -rf $_gitname-build/
  cp -r $_gitname/ $_gitname-build/
  cd $_gitname-build/

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname-build/
  make DESTDIR="$pkgdir" install
}

