# Author:   cbowman57 <http://cbowman57.deviantart.com/>
# Maintainer: sanderd17 <sanderd17 at gmail dot com>

pkgname=gnome-theme-chocolatte
pkgver=1.0.8
pkgrel=1
pkgdesc="A brown-grey Gnome-Shell and Cinnamon theme by cbowman. Also shipped with gtk and metacity themes. Good support for various extensions." 
url="http://cbowman57.deviantart.com/art/ChocoLatte-273193264"
license=('unknown')
arch=('any')
depends=('gnome-shell>=3.2')

makedepends=('p7zip')
optdepends=(
	    'gnome-shell-extension-user-theme: User Theme extension for GNOME Shell'
            'gnome-tweak-tool: A tool to customize advanced GNOME 3 options.')
source=("http://www.deviantart.com/download/273193264/chocolatte_by_cbowman57-d4inh9s.7z")

    
md5sums=('41f7b6f8222cfd7506a373d44d93e783')




build() {
  mkdir -p ${pkgdir}/usr/share/themes/
  7z x ${srcdir}/chocolatte_by_cbowman57-d4inh9s.7z
  mv ${srcdir}/ChocoLatte ${pkgdir}/usr/share/themes/ChocoLatte 
}



