# Maintainer: SpepS <dreamspepser at yahoo dot it>

_pkg=sacks
pkgname=$_pkg-git
pkgver=20110531
pkgrel=1
pkgdesc="An integrated system to allow Digital Gathering (Adunanza Digitale).Adunanza Digitale is an assembly available on-line."
arch=('any')
url="http://riunionidigitali.net/"
license=('GPL')
depends=('python2-pyqt' 'vlc' 'python-dnspython' 'python2-pjproject' 'pyvnc')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
install=("$pkgname.install")
source=("$pkgname.desktop")
md5sums=('b1fd005d18663b8a1f2230ce3de6c146')

_gitroot="git://github.com/M0Rf30/sacks.git"
_gitname="$_pkg"

build() {
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

  #
  # BUILD HERE
  #

  sed -i "s|\(bin/python\).*|\12|" `grep -rl bin/python .`
}

package() {
  cd "$srcdir/$_gitname-build"

  # data
  install -d "$pkgdir"/usr/{share/$_pkg,bin}
  cp -a * "$pkgdir/usr/share/$_pkg"

  # desktop file and pixmaps
  install -Dm644 "$srcdir/$pkgname.desktop" \
                 "$pkgdir/usr/share/applications/$_pkg.desktop"
  install -Dm644 sacksIcon.png "$pkgdir/usr/share/pixmaps/$_pkg.png"

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_pkg/LICENSE"

  # bin
  cat << EOF >> "$pkgdir/usr/bin/$_pkg"
#!/bin/bash
cd /usr/share/$_pkg && python2 $_pkg.py
EOF

  chmod +x "$pkgdir/usr/bin/$_pkg"
} 
