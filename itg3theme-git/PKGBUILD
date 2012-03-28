# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname="itg3theme-git"
#pkgname=('itg3theme-git' 'itg3noteskins-git') # Build noteskins as well
pkgver=20120328
pkgrel=2
arch=("any")
url="https://github.com/freem/itg3theme"
license=('unknown')
depends=('stepmania>=5')
makedepends=('git')

_gitroot="git://github.com/freem/itg3theme.git"
_gitname="itg3theme"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
}

package_itg3noteskins-git() {
  pkgdesc="A port of Lightning's ITG3 noteskins to StepMania 5"
  provides=('itg3noteskins')
  conflicts=('itg3noteskins')

  cd "$srcdir/$_gitname"
  install -d "$pkgdir/opt/stepmania"
  cp -r NoteSkins "$pkgdir/opt/stepmania"
}

package_itg3theme-git() {
  pkgdesc="A port of Lightning's ITG3 theme to StepMania 5"
  provides=('itg3theme')
  conflicts=('itg3theme')

  cd "$srcdir/$_gitname"
  install -d "$pkgdir/opt/stepmania"
  cp -r Themes "$pkgdir/opt/stepmania"
}

# vim:set ts=2 sw=2 et:
