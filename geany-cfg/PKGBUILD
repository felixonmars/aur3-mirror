# $Id: PKGBUILD 72665 2012-06-18 19:58:17Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Ionut Biru  <ibiru@archlinux.ro>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

_pkgname=geany
pkgname=geany-cfg
pkgver=1.22
pkgrel=993
pkgdesc="Fast and lightweight IDE, patched to save the configuration at the opening/closing documents and to increase the rowspaces in Scintilla"
arch=('x86_64' 'i686')
url="http://www.geany.org/"
license=('GPL')
depends=('gtk2' 'hicolor-icon-theme' 'desktop-file-utils' 'python2')
replaces=("geany=1.22")
provides=("geany=1.22")
conflicts=("geany")
makedepends=('perlxml' 'intltool')
optdepends=("vte: for terminal support")
install=geany.install
source=(
        "http://download.geany.org/$_pkgname-$pkgver.tar.bz2"
        "conf_save_and_rowspace_larged.path")

md5sums=('0672077fe83e2a739aa0eaca426aacf0'
         'cf13e1b4ec16e5ec383d24a4e40fb261')

options=('!libtool')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  msg2 "Apply patch for row spaces"
  patch -Np1 -i "${srcdir}/conf_save_and_rowspace_larged.path"

  msg2 "Configuring..."
  ./configure --prefix=/usr
  msg2 "Compiling..."
  make
  msg2 "Python2 fix..."
	sed -i '0,/on/s//on2/' data/templates/files/main.py
  msg2 "Fixing FS#10318..."
  sed -i 's|MimeType=text/plain;|MimeType=|' geany.desktop
  msg2 "Enabling colors for PKGBUILD files..."
  sed -i 's|Sh=|Sh=PKGBUILD;|' data/filetype_extensions.conf
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

