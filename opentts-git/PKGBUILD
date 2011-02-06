# maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>

pkgname=opentts-git
pkgver=20100607
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="High-level device independent layer for speech synthesis interface"
license=('GPL2' 'FDL')
depends=('glib2' 'alsa-lib' 'python' 'dotconf')
optdepends=('festival-freebsoft-utils: Speech output using Festival.' 'espeak: Speech output using ESpeak.')
makedepends=('pkgconfig' 'espeak' 'dotconf' 'automake')
provides=("opentts=$pkgver")
conflicts=('opentts')
options=('!libtool') 
url="http://www.openttsorg/projects/opentts"
source=("openttsd.sh")

install="opentts.install"

backup=(etc/opentts/openttsd.conf \
        etc/opentts/clients/* \
	etc/opentts/modules/*)

_gitroot="git://git.opentts.org/opentts.git"
_gitname="opentts"

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

  # Building opentts
  autoreconf -i
  ./configure --prefix=/usr --sysconfdir=/etc --with-alsa --with-libao || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  rm -f ${pkgdir}/usr/share/info/dir
  gzip -9nf ${pkgdir}/usr/share/info/*
  install -D -m755 ${srcdir}/openttsd.sh ${pkgdir}/etc/rc.d/openttsd
  mkdir -p ${pkgdir}/var/log/opentts
}

md5sums=('d26699d15c5a59d7be10c7c16934e3fc')
