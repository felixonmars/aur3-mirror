# Maintainer: kiooeht <kiooeht@gmail.com>
pkgname=pesterchum-git
pkgver=20121113
pkgrel=1
pkgdesc="Instant messaging client copying the look and feel of clients from Andrew Hussie's webcomic Homestuck"
arch=(any)
url="https://github.com/kiooeht/pesterchum"
license=('GPL3')
depends=('python2>=2.6' 'python2-pyqt>=4.6' 'python2-pygame')
makedepends=('git')
optdepends=('python-notify: libnotify notication option'
            'twmn: extra notification option'
            'lunatic-python-bzr: lua quirks')
provides=('pesterchum')
conflicts=('pesterchum')
options=(emptydirs)

_gitroot=git://github.com/kiooeht/pesterchum.git
_gitname=pesterchum

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make PYTHON2_CMD=/usr/bin/python2 PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
