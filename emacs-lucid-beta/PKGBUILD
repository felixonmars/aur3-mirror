# Maintainer: Jonathan Kotta <jpkotta AT gmail DOT com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>
# Based on emacs from [extra] and emacs-bzr from the AUR

pkgname=emacs-lucid-beta
pkgver=24.4.90
_tarball_ver=${pkgver/.rc/-rc}
_real_ver=${pkgver/.rc?/}
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Lucid toolkit version)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'hicolor-icon-theme' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls' 'libxaw')
install=emacs.install
conflicts=('emacs')
provides=('emacs')
source=(ftp://alpha.gnu.org/gnu/emacs/pretest/emacs-${_tarball_ver}.tar.xz)
md5sums=('3daaeddb982b37961d1eebc6dff1b44f')

build() {
  cd "$srcdir"/emacs-$_real_ver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=lucid --with-xft --without-gconf --without-gsettings
  make
}

package() {
  cd "$srcdir"/emacs-$_real_ver
  make DESTDIR="$pkgdir" install
  
  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$_real_ver -exec chown root:root {} \;
  
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
  
  # remove conflict with texinfo package
  rm "$pkgdir"/usr/share/info/info.info.gz
  rm "$pkgdir"/usr/share/info/dir
}
