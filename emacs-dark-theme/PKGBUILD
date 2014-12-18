# $Id: PKGBUILD 225139 2014-10-21 08:48:55Z juergen $
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-dark-theme
pkgver=24.4
pkgrel=1
pkgdesc="The extensible, customizable, self-documenting real-time display editor. Patched to enable dark mode in GTK3"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('librsvg' 'gpm' 'giflib' 'libxpm' 'libotf' 'm17n-lib' 'gtk3' 'hicolor-icon-theme' 'gconf' 'desktop-file-utils' 'alsa-lib' 'imagemagick' 'gnutls')
install=emacs.install
provides=('emacs')
conflicts=('emacs')
source=(ftp://ftp.gnu.org/gnu/emacs/emacs-$pkgver.tar.xz{,.sig} https://raw.githubusercontent.com/manmatteo/aur-emacs-prefer-dark-theme/master/prefer-dark-mode.patch)
md5sums=('ad487658ad7421ad8d7b5152192eb945'
         'SKIP'
         'deb33f87324428fef01585e99505e866')
 prepare() {
   cd $srcdir/emacs-$pkgver
   patch -p1 -i $srcdir/prefer-dark-mode.patch
 }
 build() {
   cd $srcdir/emacs-$pkgver
   ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
     --localstatedir=/var --with-x-toolkit=gtk3 --with-xft
   make
 }

package() {
  cd "$srcdir"/emacs-$pkgver
  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1}
  # remove conflict with texinfo
  rm "$pkgdir"/usr/share/info/info.info.gz
  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root:root {} \;
  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games
}
