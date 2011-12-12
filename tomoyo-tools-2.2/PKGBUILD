# Maintainer: mainframe alex.mainframe@gmail.com
pkgname=tomoyo-tools-2.2
_pkg=tomoyo-tools
pkgver=2.2.0
_timestamp=20110211
pkgrel=2
pkgdesc="TOMOYO 2.2.x MAC userland tools (for kernel 2.6.30-35)"
arch=('i686' 'x86_64')
depends=('ncurses')
url="http://tomoyo.sourceforge.jp"
license=('GPL')
install=$_pkg.install
replaces=('tomoyo-tools=2.2.0')
conflicts=('ccs-tools' 'tomoyo-tools>=2.3')
_patch_1="linux-includes.patch"
source=("http://sourceforge.jp/frs/redir.php?f=/tomoyo/41908/$_pkg-$pkgver-$_timestamp.tar.gz"
        $_pkg.rc $_pkg.install $_patch_1)
md5sums=('66660a16f989fac0cbda209fe2867f42'
         'e4f7a10e17cf5453bdca984cb5ea7f4e'
         'f10a0cf3bf56b5b1bb24e346f4e8bda8'
         'a33f9b8e252eb85d8c18266abe6b3693')

build()
{
  cd "$srcdir/$_pkg"

  patch -p0 -i "../$_patch_1"
  make || return 1
}

package()
{
  cd "$srcdir/$_pkg"

  make INSTALLDIR="$pkgdir/" install
  install -D -m755 "$srcdir/$_pkg.rc" "$pkgdir/etc/rc.d/tomoyo"
  install -D -m644 "COPYING.tomoyo" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
# vim:set ts=2 sw=2 et:
