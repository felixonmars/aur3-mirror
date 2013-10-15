# Maintainer: Neil Santos <nsantos16+aur@gmail.com>

# Compile against Gtk+ 2.x, instead of the default 3.x
_opt_use_gtk2="n"
# Emacs is leaking like a sieve on my box with the default values;
# this should be the number of bytes Emacs should allocate for pure
# storage (see Elisp manual).  Default as of writing this is 1.62 megs
# (not the final value; there are still calculations done on it).
_opt_puresize="1820000"

pkgname=emacs-bzr
_pkgname=emacs
pkgver=114669
pkgrel=1
pkgdesc='The extensible, customizable, self-documenting real-time display editor from its official Bzr repository'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/emacs/'
license=('GPL3')
if [[ $_opt_use_gtk2 = "y" ]]; then
  depends=('dbus-core' 'desktop-file-utils' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk2' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
else
  depends=('dbus-core' 'desktop-file-utils' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk3' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
fi
makedepends=('bzr' 'pkgconfig' 'texinfo')
provides=("${_pkgname}=${pkgver}")
conflicts=('emacs' 'emacs-nox' 'emacs-otf' 'emacs-cvs' 'emacs-git')
source=("${_pkgname}::bzr+http://bzr.savannah.gnu.org/r/$_pkgname/trunk/")
md5sums=('SKIP')
install=${pkgname}.install

_mandir=/usr/share/man

pkgver() {
  bzr revno "${srcdir}/${_pkgname}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg "Adjusting BASE_PURESIZE to avoid possible leaks"
  sed -i -e "s/\(define BASE_PURESIZE\s*(*\)[0-9]*/\1${_opt_puresize}/" src/puresize.h
}

build() {
  cd "${srcdir}/${_pkgname}"

  export LDFLAGS="`pkg-config --libs MagickWand`"

  msg "Starting make..."
  if [[ $_opt_use_gtk2 = "y" ]]; then
    ./autogen.sh && ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --mandir=${_mandir} \
      --without-sound \
      --with-xft \
      --with-x-toolkit=gtk2
  else
    ./autogen.sh && ac_cv_lib_gif_EGifPutExtensionLast=yes ./configure --prefix=/usr \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib \
      --mandir=${_mandir} \
      --without-sound \
      --with-xft \
      --with-x-toolkit=gtk3
  fi
  msg "Bootstrapping Emacs Lisp files..."
  make bootstrap

  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install

  msg "Cleaning up..."
  mv "${pkgdir}"/usr/bin/{ctags,ctags.emacs}
  mv "${pkgdir}${_mandir}"/man1/{ctags.1,ctags.emacs.1}.gz

  # This is mostly superfluous, and conflicts with texinfo
  rm "${pkgdir}"/usr/share/info/info.info.gz
  rm "${pkgdir}"/usr/share/info/dir

  find "${pkgdir}"/usr/share/emacs -type d -exec chmod 755 {} \;
  find "${pkgdir}"/usr/share/emacs -exec chown root.root {} \;

  chmod 775 "${pkgdir}"/var/games
  chmod 775 "${pkgdir}"/var/games/emacs
  chmod 664 "${pkgdir}"/var/games/emacs/*
  chown -R root:50 "${pkgdir}"/var/games
}
