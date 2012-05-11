# Maintainer: forcyy <forcyy.zh AT gmail DOT com>

pkgname=tweets2pdf-git
pkgver=20120511
pkgrel=1
pkgdesc="Backup your tweets into FANTANSTIC PDF files, with GUI"
arch=('any')
url="http://basiccoder.com/tweets2pdf"
license=('GPL2')
depends=('python2' 'pygtk' 'python-reportlab' 'python-imaging')
makedepends=('git')
conflicts=('tweets2pdf')
source=()                                                           
md5sums=() 

_gitroot='https://github.com/levin108/tweets2pdf.git'
_gitname='tweets2pdf'
_builddir="$srcdir/$_gitname-build"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server......"

    if [[ -d "$_gitname" ]]; then
	cd "$_gitname" && git pull origin || return 1
	msg "The local files are updated."
    else
	git clone "$_gitroot" "$_gitname" || return 1
    fi

    msg "GIT checkout done or server timeout"
    msg "Starting build......."

    rm -rf "$_builddir"
    git clone "$srcdir/$_gitname" "$_builddir"
    cd $_builddir

    python2 setup.py install --root=${pkgdir}
}

