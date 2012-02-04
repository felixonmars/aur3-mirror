# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kdevelop-extra-plugins-mercurial-git
pkgver=20110605
pkgrel=1
pkgdesc="Mercurial support for KDevelop"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-mercurial"
license=('GPL')
depends=('kdevelop-git' 'mercurial')
makedepends=('cmake' 'automoc4' 'git')
source=()
md5sums=()

_gitroot="git://anongit.kde.org/kdev-mercurial"
_gitname="mercurial"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname
    # Change remote url to anongit
    if [ -z $(git branch -v | grep anongit) ] ; then
      git remote set-url origin ${_gitroot}
    fi
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  if [ -e "$srcdir"/$_gitname-build ]; then
        rm -rf "$srcdir"/$_gitname-build
  fi

  mkdir -p "$srcdir"/$_gitname-build
  cd "$srcdir"/$_gitname-build

  cmake ../$_gitname -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir"/$_gitname-build
  make DESTDIR="$pkgdir" install

  # update X-KDevelop-Version to make it work with current KDevelop
  sed 's|\(X-KDevelop-Version\)=.*|\1=12|' -i "$pkgdir"/usr/share/kde4/services/kdevmercurial.desktop
}
