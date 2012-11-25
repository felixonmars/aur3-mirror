# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=buddycloud-server-git
pkgver=20121120
pkgrel=1
pkgdesc="A fully distributed social network based on XMPP - server"
arch=(i686 x86_64)
url="https://buddycloud.org/wiki/Main_Page"
license=('Apache')
depends=('nodejs' 'icu' 'expat' 'postgresql-libs')
makedepends=('git')
optdepends=('buddycloud-webclient-git: the buddycloud web client'
            'prosody: a lightweight and extensible XMPP server'
            'ejabberd: a powerful XMPP server'
            'logrotate: rotate log file automatically'
            "start-stop-daemon: daemon managment if you're not using systemd")
provides=('buddycloud-server')
conflicts=('buddycloud-server')
backup=('etc/buddycloud-server/config.js'
        'etc/logrotate.d/buddycloud-server')
install=buddycloud-server.install
source=('buddycloud-server.rc'
        'buddycloud-server.logrotate'
        'buddycloud-server.service')
md5sums=('64ea2b4f6ace15fe057a7029447ded2d'
         '555033f0880c2a40b5e16418b4f2a9f9'
         'a08735a19e3f2aa63c53e350ea53a085')
sha256sums=('0bbc3ba58abc520552c9fd47d948a7eb4dacd216dd89f437952fc7418b43c1c8'
            '1696cb64db6fe76c5c32cc32637f485f86f8ea79b0d89ecf5ac4d1615c8f9f4c'
            'fa44343bfaa00e99fa2dfc41ea4d4653bf6f16bfb6b7e06d17a05627efe20df8')

_gitroot=git://github.com/buddycloud/buddycloud-server.git
_gitname=buddycloud-server

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

  #
  # BUILD HERE
  #

  # Build tarball
  npm install .
  npm run-script install
  ./package.js

  # Extract tarball and build required modules
  mkdir build
  cd build
  bsdtar -xf ../buddycloud-server-*.tar.gz
  ./build-deps
}

package() {
  mkdir -p "$pkgdir/opt"
  cp -R "$srcdir/$_gitname-build/build" "$pkgdir/opt/$pkgname"

  cd "$pkgdir/opt/$pkgname"

  install -Dm644 config.js.example "$pkgdir/etc/buddycloud-server/config.js"
  ln -sf ../../etc/buddycloud-server/config.js "$pkgdir/opt/$pkgname/config.js"

  rm config.js.example _etc_init.d_buddycloud-server

  install -Dm755 "$srcdir/buddycloud-server.rc" "$pkgdir/etc/rc.d/buddycloud-server"
  install -Dm644 "$srcdir/buddycloud-server.service" "$pkgdir/usr/lib/systemd/system/buddycloud-server.service"
  install -Dm644 "$srcdir/buddycloud-server.logrotate" "$pkgdir/etc/logrotate.d/buddycloud-server"
}

# vim:set ts=2 sw=2 et:
