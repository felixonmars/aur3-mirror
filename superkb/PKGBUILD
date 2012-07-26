# Maintainer: Ruben Guerra Marin <rguerra.marin@gmail.com>
pkgname=superkb
pkgver=git
pkgrel=20110430
pkgdesc="Superkb is a graphical application launcher for Linux."
arch=(any)
url="http://superkb.sourceforge.net/"
license=('GPL')
depends=('imlib2' 'libxinerama' 'libxft' 'libxrender' 'cairo' 'pango' 'libx11' 'gdk-pixbuf2')
makedepends=('git')

build() {
  msg 'Connecting to GIT server...'
  git clone git://superkb.git.sourceforge.net/gitroot/superkb/superkb superkb-git

  cd "$srcdir/$pkgname-git"

  install -d ${pkgdir}/usr/share/man/man1/
  install -d ${pkgdir}/usr/bin/
  make configuration
  make
  make DESTDIR="${pkgdir}" install
}