# Maintainer: Neil Santos <nsantos16+aur@gmail.com>
# Modification: Sam Kleinman <sam@tychoish.com>

# Don't compile against Gtk+ 3.x by default; stick with Gtk+ 2.x
_opt_use_gtk3="n"

pkgname=emacs24-lucid
pkgver=108103
pkgrel=1
pkgdesc='The extensible, customizable, self-documenting real-time display editor from its official Bzr repository'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/emacs/'
license=('GPL3')
if [[ $_opt_use_gtk3 = "y" ]]; then
  depends=('dbus-core' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk3' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
else
  depends=('dbus-core' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk2' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
fi

makedepends=('bzr' 'pkgconfig' 'texinfo')
provides=("emacs=$pkgver")
conflicts=('emacs' 'emacs-nox' 'emacs-otf' 'emacs-cvs' 'emacs-git' 'emacs-bzr-lucid')
install=$pkgname.install

#_bzrtrunk='http://bzr.savannah.gnu.org/r/emacs/trunk'
_bzrtrunk='http://bzr.savannah.gnu.org/r/emacs/emacs-24'
_bzrmod='emacs'

build() {
  cd $srcdir
  msg "Connecting to Savannah..."

  if [[ -d $_bzrmod/.bzr ]]; then
    (cd $_bzrmod && bzr update -v && cd ..)
    msg "Local checkout updated or server timeout"
  else
    bzr co --lightweight -v $_bzrtrunk $_bzrmod
    msg "Checkout done or server timeout"
  fi

  cp -urT $_bzrmod/ ${_bzrmod}-build
  cd ${_bzrmod}-build

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
      --with-x-toolkit=lucid || return 1
  else
    ./autogen.sh && ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --mandir=${mandir} \
      --without-sound \
      --with-xft \
      --with-x-toolkit=lucid || return 1
  fi
  make -j bootstrap || return 1
  make -j || return 1
  make -j DESTDIR=${pkgdir} install || return 1

  msg "Cleaning up..."
  mv $pkgdir/usr/bin/{ctags,ctags.emacs} || return 1
  mv $pkgdir/usr/bin/{etags,etags.emacs} || return 1
  mv $pkgdir${mandir}/man1/{etags.1,etags.emacs.1}.gz || return 1
  mv $pkgdir${mandir}/man1/{ctags.1,ctags.emacs.1}.gz || return 1

  find $pkgdir/usr/share/emacs -type d -exec chmod 755 {} \;
  find $pkgdir/usr/share/emacs -exec chown root.root {} \;
  chmod 775 $pkgdir/var/games
  chmod 775 $pkgdir/var/games/emacs
  chmod 664 $pkgdir/var/games/emacs/*
  chown -R root:50 $pkgdir/var/games

  rm $pkgdir/usr/share/info/dir || return 1
}
