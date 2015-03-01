# Maintainer: Mathieu Clement <mathieu onedot clement at freebourg onedot org>
pkgname=ino-1.6-git
pkgver=r140.f23ee5c
pkgrel=1
pkgdesc="Command line toolkit for working with Arduino hardware, patched for Arduino SDK 1.6"
arch=('i686' 'x86_64')
url="http://inotool.org/"
license=('MIT')
depends=(picocom arduino avrdude \
         python2-pyserial python2-configobj python2-configargparse python2-glob2-git)
makedepends=('git')
provides=('ino')
conflicts=('ino' 'ino-git')
source=('git://github.com/amperka/ino.git')
md5sums=('SKIP') #generate with 'makepkg -g'

_gitroot=git://github.com/amperka/ino.git
_gitname=ino

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
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # PATCH 1 : argument list too long with "ino build"
  # See https://github.com/amperka/ino/issues/119
  # See https://github.com/amperka/ino/pull/214/files
  sed -i.bak "s/exclude=\['examples'\]/exclude=['examples','src']/g" \
      ino/commands/build.py 

  # PATCH 2 : "ino upload" cannot find avrdude.conf
  sed -i.bak "s/conf_places = self.e.arduino_dist_places(\['hardware', 'tools'\])/conf_places = self.e.arduino_dist_places(['hardware', 'tools', 'avr', 'etc'])/g" ino/commands/upload.py

}

package() {
  cd "$srcdir/$_gitname-build"
  make install PREFIX=/usr DESTDIR="$pkgdir/"
  install -D -m644 MIT-LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# vim:set ts=2 sw=2 et:
