# Maintainer: killown <archlinux@killown.com>

pkgname=cherrytree-hg
pkgver=0.35.7
pkgrel=1
pkgbasever=0.35
_hgroot="https://code.google.com/p/giuspen-cherrytree/"
_hgname="hg_cherrytree"
makedepends=()
conflicts=()
replaces=()
backup=()
conflicts=('cherrytree')
pkgdesc="A hierarchical note taking application, featuring rich text and 
syntax highlighting, storing data in a single xml or sqlite file."
url="http://www.giuspen.com/cherrytree/"
arch=('any')
license=('GPL')
install='cherrytree-hg.install'
md5sums=()
depends=(pygtksourceview2  hicolor-icon-theme  desktop-file-utils 
mercurial)

build() {
    echo $srcdir
    if [ ! -d ${srcdir}/$_hgname ] ; then
        hg clone $_hgroot $_hgname
    else
        cd "${srcdir}/$_hgname"
        hg pull -u
    fi
    
    cd "${srcdir}/$_hgname"



}
 
package() {
	cd "${srcdir}/$_hgname"
  	python2 setup.py install --root=$pkgdir/ --optimize=1
}
