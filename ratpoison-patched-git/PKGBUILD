# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintained by ivoarch <ivkuzev@gmail.com>
# Patch from @JohannesSM64
pkgname=ratpoison-patched-git
pkgver=v1.4.7.5.ga65cdf8
pkgrel=1
pkgdesc="Ratpoison from git (patched with ignore window size hints)"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/ratpoison/"
license=('GPL')
depends=('libxinerama' 'readline' 'bash' 'perl' 'libxtst' 'libxft')
makedepends=('git')
optdepends=('rxvt-unicode-patched: to avoid artifacts')
provides=('ratpoison')
replaces=('ratpoison')
conflicts=('ratpoison')
source=("git://git.savannah.nongnu.org/ratpoison.git"
        "ignore-size-hints.patch")
md5sums=('SKIP'
         'ceba3767a1730c3ca40468f54b5e67f9')
gitname=ratpoison

pkgver() {
  cd "${srcdir}/${gitname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${gitname}"
  msg "Applying ignore window size hints patch..."
  patch -p0 -i ../../ignore-size-hints.patch "${srcdir}/${gitname}/src/manage.c"
  ./autogen.sh
  ./configure --prefix=/usr
  make
  cd contrib/
  ./genrpbindings
  make
  cd ..
}

package() {
  cd "$srcdir/$gitname"
  install -d "$pkgdir/usr/share/$gitname/bindings"

  make DESTDIR="$pkgdir" install
  install -m 644 contrib/{Ratpoison.pm,ratpoison-cmd.el,ratpoison.rb,ratpoison.lisp,ratpoison.py} \
    "$pkgdir/usr/share/$gitname/bindings"

  chmod a+x $pkgdir/usr/share/$gitname/{rpws,clickframe.pl,allwindows.sh,ratdate.sh,rpshowall.sh,split.sh}
  rm -rf "$pkgdir/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et:
