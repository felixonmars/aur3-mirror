# Maintainer: Dany Martineau  <dany.luc.martineau at gmail.com>

pkgname="plasma-stasks-patched-plasmoid-hg"
pkgver=383
pkgrel=1
pkgdesc="Patched version of mbaszczewskis STasks plasmoid."
url="http://www.kde-look.org/content/show.php/Smooth+Tasks?content=101586&PHPSESSID=957cd5cbd5b3064757ef261629337a19"
license="GPL"
arch=("i686" "x86_64")
makedepends=('mercurial' 'cmake' 'gcc' 'automoc4')
depends=('kdebase-workspace')

_hgroot="http://bitbucket.org/panzi"
_hgrepo="smooth-tasks"

build() {
	cd ${srcdir}
	# update the repo, else clone a new one
	if [ -d ${_hgrepo} ]; then
		cd ${_hgrepo}
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd ${_hgrepo}
	fi

   cmake -DCMAKE_INSTALL_PREFIX=/usr .
   make
   make DESTDIR=$pkgdir install
}
