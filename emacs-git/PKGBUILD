# Maintainer: Jianwei Han <hanjianwei@gmail.com>
# Same as emacs-bzr, except that it uses GitHub mirror because
# the official bazaar repository might be slow. So there is inevitably some lag.

# Don't compile against Gtk+ 3.x by default; stick with Gtk+ 2.x
_opt_use_gtk3="n"

# Package variables.
pkgname=emacs-git
pkgver=20120523
pkgrel=1
pkgdesc='The extensible, customizable, self-documenting real-time display editor from its GitHub mirror'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/emacs/'
license=('GPL3')

# Dependencies
if [[ $_opt_use_gtk3 = "y" ]]; then
  depends=('dbus-core' 'desktop-file-utils' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk3' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
else
  depends=('dbus-core' 'desktop-file-utils' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk2' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
fi

makedepends=('git' 'pkgconfig' 'texinfo')
provides=("emacs=$pkgver")
conflicts=('emacs' 'emacs-nox' 'emacs-otf' 'emacs-cvs' 'emacs-bzr')
install=$pkgname.install

_gitname='emacs'
_gitroot='https://github.com/emacsmirror/emacs.git'

build() {
  cd $srcdir
  msg "Connecting to GitHub ...."

  if [[ -d $_gitname ]]; then
    cd $_gitname
    git pull origin || return 1
    msg "Local checkout updated or server timeout"
    cd ..
  else
    git clone --depth=1 $_gitroot $_gitname
    msg "Checkout done or server timeout"
  fi

  cp -urT $_gitname ${_gitname}-build
  cd ${_gitname}-build

  #  msg "Trying to ensure building from a clean(-ish) state..."
  #  make clean

  mandir=/usr/share/man
  msg "Starting make..."
  if [[ $_opt_use_gtk3 = "y" ]]; then
    ./autogen.sh && ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --mandir=${mandir} \
      --without-sound \
      --with-xft \
      --with-x-toolkit=gtk3
  else
    ./autogen.sh && ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --mandir=${mandir} \
      --without-sound \
      --with-xft \
      --with-x-toolkit=gtk
  fi
  make DESTDIR=${pkgdir} install

  msg "Cleaning up..."
  mv $pkgdir/usr/bin/{ctags,ctags.emacs}
  mv $pkgdir/usr/bin/{etags,etags.emacs}
  mv $pkgdir${mandir}/man1/{etags.1,etags.emacs.1}.gz
  mv $pkgdir${mandir}/man1/{ctags.1,ctags.emacs.1}.gz

  rm $pkgdir/usr/share/info/info.info.gz
  rm $pkgdir/usr/share/info/dir

  find $pkgdir/usr/share/emacs -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/emacs -exec chown root.root {} \;
  chmod 775 $pkgdir/var/games
  chmod 775 $pkgdir/var/games/emacs
  chmod 664 $pkgdir/var/games/emacs/*
  chown -R root:50 $pkgdir/var/games
}
