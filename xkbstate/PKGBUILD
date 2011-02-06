# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=xkbstate
pkgver=0.1
pkgrel=1
pkgdesc="Ruby utility to get/set XKB group/layout, also a C++ stub"
url="http://members.dslextreme.com/users/jbromley/"
arch=('i686' 'x86_64')
license=('custom')  # unknown! contact author!
options=()
depends=('libx11')
makedepends=('gcc')
optdepends=('swig: to use the ruby extension' 'ruby: to use the ruby extension')
source=('http://members.dslextreme.com/users/jbromley/files/ruby-xkb.tar.bz2' \
  'getxkblayout.cpp' 'Makefile.patch' 'Makefile_XKeyboard.patch')
md5sums=('96a4c87cfd9b7606867bfa87b0acd0a6' '9a4f6b97d065bcece7735e988eebfd81'\
         'cd2787ae210914eac5622d94a9e4f27a' 'a9980e42376150f4df810690828f8f0c')

_rubyname=$pkgname
_cppname=getxkblayout

build() {
  patch ${srcdir}/xkb/Makefile Makefile.patch || return 1
  cd ${srcdir}/xkb

  if [ "$CARCH" = "x86_64" ]; then
    sed -i 's/i686/x86_64/g' XKeyboard.i || return 1
  fi
  
  # see if ruby extension ('${_rubyname}') should be built/installed
  if [ -n "`pacman -Qi ruby | grep Description`" ] && \
    [ -n "`pacman -Qi swig | grep Description`" ]; then
    swig -c++ -ruby XKeyboard.i || return 1
    ruby extconf.rb || return 1
    patch Makefile_XKeyboard ../../Makefile_XKeyboard.patch || return 1
    make PREFIX=/usr DESTDIR=$pkgdir && make DESTDIR=$pkgdir install || return 1
    install -m0755 -D ${_rubyname} $pkgdir/usr/bin/${_rubyname} || return 1
  fi

  # build/install C++ stub ('${_cppname}')
  cp ../${_cppname}.cpp .
  g++ *.cpp -o ${_cppname} -L/usr/lib -lX11 || return 1
 
  install -m0755 -D ${_cppname} $pkgdir/usr/bin/${_cppname} || return 1

# install -m644 -D README $pkgdir/usr/share/doc/$pkgname/README
# TODO: man page
# TODO: license
}
