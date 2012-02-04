# $Id: PKGBUILD 22255 2010-07-20 05:18:40Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=vlock-cmatrixreloaded
pkgver=0.01
pkgrel=9
pkgdesc="A small console locking program, hack'n'patched for matrix goodness."
url="http://cthulhu.c3d2.de/~toidinamai/vlock/vlock.html"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('pam' 'ncurses')
install=vlock-cmatrixreloaded.install
source=(http://login.icu.uzh.ch/~archer/${pkgname}-${pkgver}.tar.gz)
md5sums=('4d7557081d8fb914c26a2ee3cb345278')


build() {
  if (getent group vlockcmr); then
    echo "Group vlockcmr already exists. Continuing..."
  else 
        echo "Need to add vlockcmr group..."
      if $(LD_PRELOAD="" pacman -Qi sudo >/dev/null 2>&1); then
        LD_PRELOAD="" sudo groupadd vlockcmr
        echo "Added vlockcmr group"
      elif (( $(LD_PRELOAD="" id -u) != 0 )); then
        echo "Need to have sudo or be logged in as root!"
        return 1
      else
        groupadd vlockcmr
      fi
  fi
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install
}
