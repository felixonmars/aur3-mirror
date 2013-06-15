# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=openwatcom-extras-hg
pkgver=2
pkgrel=1
pkgdesc="extension to openwatcom to make building libraries easier"
url="https://bitbucket.org/GregorR/openwatcom/"
arch=('any')
license=('')
depends=('open_watcom' 'bash')
makedepends=('mercurial')

_hgroot='https://bitbucket.org/GregorR'
_hgrepo='openwatcom'

build() {
	cd $srcdir

	# Update the repo, else clone a new one
	if [ -d $_hgrepo ]; then
		cd $_hgrepo
		make clean
		hg pull -u
	else
		hg clone ${_hgroot}/${_hgrepo}
		cd $_hgrepo
	fi
}

package() {
  cd $srcdir/$_hgrepo/rel2-extras/binl
  mkdir -p $pkgdir/opt/watcom/binl
  install -m755 {owranlib,owar} $pkgdir/opt/watcom/binl/
  
}


