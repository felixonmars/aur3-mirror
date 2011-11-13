# Maintainer: Bernardo Barros <bernardobarros@gmail.com>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=emacs-gtk3-bzr
pkgver=106359
pkgrel=1
pkgdesc='Emacs from official Bazaar repository, GTK3 toolkit'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/emacs/'
license=('GPL3')
depends=('dbus-core' 'libpng' 'libtiff' 'librsvg' 'giflib' 'gtk3' 'libxpm' 'libjpeg>=7' 'hicolor-icon-theme')
makedepends=('bzr' 'pkgconfig' 'texinfo' 'gpm')
provides=('emacs=$pkgver')
conflicts=('emacs' 'emacs-nox' 'emacs-otf' 'emacs-cvs' 'emacs-git')
install=emacs.install

_bzrtrunk='http://bzr.savannah.gnu.org/r/emacs/trunk'
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

  mandir=/usr/share/man

  msg "Starting make..."

  ./autogen.sh 

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --mandir=${mandir} \
    --without-sound \
    --with-x-toolkit=gtk3

  make bootstrap 

  make 

}

package() {
    cd $srcdir/$_bzrmod-build
    make DESTDIR=$pkgdir install

    # remove conflict with ctags packages
    mv $pkgdir/usr/bin/{ctags,ctags.emacs}
    mv $pkgdir/usr/bin/{etags,etags.emacs}
    mv $pkgdir/usr/share/man/man1/{etags.1.gz,etags.emacs.1.gz}
    mv $pkgdir/usr/share/man/man1/{ctags.1.gz,ctags.emacs.1.gz}

    # fix user/root permissions on usr/share files
    find $pkgdir/usr/share/emacs/24* -exec chown root.root {} \;
    # fix perms on /var/games
    chmod 775 $pkgdir/var/games
    chmod 775 $pkgdir/var/games/emacs
    chmod 664 $pkgdir/var/games/emacs/*
    chown -R root:games $pkgdir/var/games

}
