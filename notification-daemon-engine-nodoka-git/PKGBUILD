# Contributor: Spyros "Foucault" Stathopoulos <foucault.online@gmail.com>
pkgname=notification-daemon-engine-nodoka-git
pkgver=20091002
pkgrel=2
pkgdesc="Nodoka theme for gnome-notification-daemon (git version)."
arch=('i686' 'x86_64')
url="https://fedorahosted.org/nodoka/wiki"
license=('GPL3')
depends=('notification-daemon>=0.4')
makedepends=('git')
provides=('notification-daemon-engine-nodoka' 'notification-daemon-engine-nodoka-git')
conflicts=('notification-daemon-engine-nodoka')
replaces=('notification-daemon-engine-nodoka')
source=()
md5sums=()

_gitroot="git://git.fedorahosted.org/nodoka"
_gitname="notification-daemon-engine-nodoka"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
	msg "git clone $_gitroot $_gitname"
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/$_gitname"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
