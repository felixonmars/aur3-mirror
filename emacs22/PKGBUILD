# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Renchi Raju <renchi@green.tam.uiuc.edu>

pkgname=emacs22
_pkgname=emacs
pkgver=22.3
pkgrel=2
pkgdesc="The extensible, customizable, self-documenting real-time display editor"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emacs/emacs.html"
license=('GPL')
depends=('gpm' 'libxpm' 'libpng12' 'gtk2' 'hicolor-icon-theme' 'desktop-file-utils')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("ftp://ftp.gnu.org/gnu/emacs/$_pkgname-$pkgver.tar.gz"
        "emacs.desktop")
md5sums=('aa8ba34f548cd78b35914ae5a7bb87eb'
         '8af038d2ba4561271e935bb444ceb4e3')
install=emacs.install

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  export CPPFLAGS="$CPPFLAGS -P -I/usr/include/libpng12"
  export LIBS="$LIBS -lpng12"
  
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --mandir=/usr/share/man \
    --without-sound \
    --with-x-toolkit=gtk

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.emacs}
  mv "$pkgdir"/usr/bin/{etags,etags.emacs}
  mv "$pkgdir"/usr/share/man/man1/{etags.1,etags.emacs.1}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.emacs.1}

  # fix all the 777 perms on directories
  find "$pkgdir"/usr/share/emacs/$pkgver -type d -exec chmod 755 {} \;

  # fix user/root permissions on usr/share files
  find "$pkgdir"/usr/share/emacs/$pkgver -exec chown root.root {} \;

  # fix perms on /var/games
  chmod 775 "$pkgdir"/var/games
  chmod 775 "$pkgdir"/var/games/emacs
  chmod 664 "$pkgdir"/var/games/emacs/*
  chown -R root:games "$pkgdir"/var/games

  # remove info dir
  rm "$pkgdir"/usr/share/info/dir
  gzip -9nf "$pkgdir"/usr/share/info/*

  # install desktop file
  install -Dm644 "../emacs.desktop" "$pkgdir/usr/share/applications/emacs.desktop"
}
