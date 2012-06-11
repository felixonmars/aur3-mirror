# Maintainer: Stephen Hassard <steve@hassard.net>

pkgname=emacs24
pkgver=24.1
pkgrel=1
pkgdesc="The Emacs Editor"
arch=(i686 x86_64)
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
provides=('emacs' 'ctags')
conflicts=('emacs' 'ctags')
options=(docs)
depends=('alsa-lib' 'desktop-file-utils' 'dbus-core' 'gpm' 'giflib' 'libtiff' 'libxpm' 'libjpeg-turbo' 'librsvg' 'libpng' 'gtk3' 'texinfo' 'hicolor-icon-theme')
source=(http://ftp.gnu.org/pub/gnu/emacs/emacs-$pkgver.tar.bz2 emacs.desktop)
sha256sums=('eeea272732146e2be9aee2f8d71d6cf07b8654c0282da62a26b921d433f02b7c'
	'dba3652cdfd4193d264cf9ebafcef3e6be4af3f83bdf187d421f8e4c07f94b39')
install=emacs.install

build() {
  cd $startdir/src/emacs-$pkgver
  mandir=/usr/share/man
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
  --localstatedir=/var --mandir=${mandir} -with-x-toolkit=gtk3
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1

  # fix all the 777 perms on directories
  find $startdir/pkg/usr/share/emacs/$pkgver -type d -exec chmod 755 {} \;

  # fix user/root permissions on usr/share files
  find $startdir/pkg/usr/share/emacs/$pkgver -exec chown root.root {} \;

  # fix perms on /var/games
  chmod 775 ${startdir}/pkg/var/games
  chmod 775 ${startdir}/pkg/var/games/emacs
  chmod 664 ${startdir}/pkg/var/games/emacs/*
  chown -R root:50 ${startdir}/pkg/var/games

  # remove info dir
  rm $startdir/pkg/usr/share/info/dir
}
