# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: Jakub Vitak <mainiak(at)gmail(dot)com>
pkgname=ditz-git
pkgver=20101005
pkgrel=1
pkgdesc="Simple, light-weight distributed issue tracker designed to work with distributed version control systems (GIT version)"
arch=('i686' 'x86_64')
url="http://ditz.rubyforge.org"
license=('GPL')
depends=('ruby')
provides=('ditz')
conflicts=('ditz')
source=()
md5sums=()

_gitroot="git://gitorious.org/ditz/mainline.git"
_gitname="mainline"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  set -x
  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ruby setup.rb config --prefix="/usr" || return 1
  ruby setup.rb setup || return 1
  ruby setup.rb install --prefix="$pkgdir" || return 1
  set +x
}

# vim:set ts=2 sw=2 et:
