# Contributor: Oleg Lavrovsky <@loleg>
pkgname=hyena-git
pkgver=20110629
pkgrel=1
pkgdesc="A library of useful GUI and non-GUI C sharp code"
arch=('i686' 'x86_64')
url="http://live.gnome.org/Hyena"
license=('GPL')
depends=('mono' 'gnome-sharp')
makedepends=('git')
provides=('hyena' 'hyena-git')

_gitroot="git://gitorious.org/hyena/hyena.git"
_gitname="hyena"

build() {
  export MONO_SHARED_DIR="${srcdir}/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"
  
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  sh autogen.sh || return 1
  make || return 1
  make DESTDIR="$pkgdir/" install
  
  msg "On some systems you will need to add your local pkgconfig path, e.g.:"
  msg " export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig"
} 
