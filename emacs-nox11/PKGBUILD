# $Id: PKGBUILD 191914 2013-08-01 06:59:43Z bpiotrowski $
# Maintainer: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs-nox11
pkgver=24.3
_name=emacs
pkgrel=3
pkgdesc="The extensible, customizable, self-documenting real-time display editor (Without X11 support)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL3')
depends=('gpm' 'libxpm')
conflicts=('emacs')
provides=('emacs')
install=emacs.install
source=(ftp://ftp.gnu.org/gnu/emacs/$_name-$pkgver.tar.xz{,.sig}
       )
md5sums=('ea9ed000ca165280265aabb55b9afbd7'
         'SKIP'
        )

build() {
  cd "$srcdir"/$_name-$pkgver
  ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib \
    --localstatedir=/var --with-x-toolkit=no --with-xpm --without-gif --without-jpeg --without-png --without-rsvg --without-tiff --with-dbus --with-gpm
  make
}

package() {
  cd "$srcdir"/$_name-$pkgver
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
