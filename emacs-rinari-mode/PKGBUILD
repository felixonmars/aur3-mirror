# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=emacs-rinari-mode
pkgver=20090129
pkgrel=1
pkgdesc="Major mode for editing rhtml files in emacs"
arch=("i686" "x86_64")
url="http://rinari.rubyforge.org/"
depends=("emacs")
makedepends=("emacs" "git")
source=()
md5sums=()
license=("GPL" "MPL")

_gitroot="git://github.com/eschulte/rinari.git"
_gitname="rinari"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd rinari
    git submodule init
    git submodule update
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  mkdir -p ${pkgdir}/usr/share/emacs/site-lisp/
  cp -r ${srcdir}/rinari ${pkgdir}/usr/share/emacs/site-lisp/
  cd ${pkgdir}
  find . -type d -name .git -prune -exec rm -r "{}" \;
  find . -name ".git*" -delete
}
