# Contributor: ugaciaka <ugaciaka@gmail.com>

pkgname=luke-sdk
pkgver=0.7.7.1
pkgrel=2
pkgdesc="An Integrated Development Environment for Boo, C, C++, C#, Java, JavaScript, Lua, OCaml, Perl, PHP, Pike, Python, Ruby and Tcl/Tk" 
arch=('i686' 'x86_64')
url="http://luke-sdk.berlios.de/" 
license=('GPL')
depends=('python>=2.6' 'wxpython>=2.8.7.1') 
source=(http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz
        'install.patch' 'luke.sh' 'luke.desktop')
md5sums=('2d0376e786632ac86681c8556cfa4874'
        'fe720a7e74a7a42e770d0d2ffe86f275'
        '9994c8c554dcab14495da2adde1be664'
        '22b8de0c4ab3f24cc3c6718dd2a81d90')

build() {
  cd "$srcdir/$pkgname"

  patch -Np1 -i "$srcdir/install.patch" || return 1
  cd install/
  PREFIX="$pkgdir/usr" ./install.sh || return 1

  install -D -m755 "$srcdir/luke.sh" "$pkgdir/usr/bin/luke" || return 1
  install -D -m644 "../images/luke.png" "$pkgdir/usr/share/pixmaps/luke.png" || return 1
  install -D -m644 "$srcdir/luke.desktop" "$pkgdir/usr/share/applications/luke.desktop" || return 1
}
