# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the emacs package in ABS.

pkgname=emacs-gtk3
pkgver=24.1
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (GTK3 build)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick')
provides=("emacs=$pkgver")
conflicts=("emacs")
install=emacs.install
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.bz2
        04_all_gnulib-gets.patch)
sha256sums=('eeea272732146e2be9aee2f8d71d6cf07b8654c0282da62a26b921d433f02b7c'
            'a9c39eed31b74579ca4453ce79dcf5ed2840de4665dd41ce68a1bd029ad91211')

build() {
  cd "$srcdir"/emacs-$pkgver

  # Taken from Gentoo.
  patch -p1 < ../04_all_gnulib-gets.patch

  autoreconf -i -I m4 || exit $?

  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=gtk3 --with-xft
  make
}

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  # fix all the 777 perms on directories
  find "$pkgdir"/usr/share/emacs/$_majorver -type d -exec chmod 755 {} \;
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$_majorver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
