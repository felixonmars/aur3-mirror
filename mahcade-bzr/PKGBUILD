
# Maintainer: Adam Newby <mastacheif@gmail.com>
pkgname=mahcade-bzr
pkgver=74
pkgrel=1
pkgdesc="Mah!Cade is a development branch of Wah!cade the emualtor frontend"
arch=('i686' 'x86_64')
url="http://launchpad.net/~waynemou/wahcade/devel"
license=('GPL')
depends=('pygtk>=2.8' 'python2' 'python-chardet>=1.0')
optdepends=('pil: required for image rotation in layouts'
            'gstreamer0.10: required for video & music playback'
            'pygame: required for joystick support')
makedepends=('bzr')
conflicts=('wahcade')
md5sums=() #Blank for now

_bzrtrunk="lp:~waynemou/wahcade/devel"
_bzrmod="~waynemou/wahcade/devel"

build() {
  cd "$srcdir"
  msg "Connecting to server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."
  echo "\n\n\nfrom: $srcdir to: $_bzrmod-build"
  ls
  echo "\n\n\n"
  rm -rf "$srcdir/build"
  cp -r "$srcdir/devel" "$srcdir/build"
  cd "$srcdir/build"

  # Create directories for the install script
  install -d "$pkgdir/usr/"{bin,share/pixmaps}

  #
  # Repair install for compatibility with Arch
  #
  sed -i '/\/usr\/share\/applications/d' install
  sed -i 's/env python/env python2/' *.py
  sed -e 's/python/python2/g' \
  -e 's|PREFIX=/usr/local|PREFIX=../../pkg/usr|' \
  -e 's|cd ${DESTDIR}|cd /usr/share/${NAME}|g' \
  -e 's|/usr/share/pixmaps|$PREFIX/share/pixmaps|g' \
  -i install
  ./install || return 1
}

#package() {
#  cd "$srcdir/$_bzrmod-build"
#  make DESTDIR="$pkgdir/" install
#}

# vim:set ts=2 sw=2 et:
