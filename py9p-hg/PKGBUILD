# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=py9p-hg
pkgver=0.0.1
pkgrel=1
pkgdesc="The the Plan9 9P2000 file system protocol implemented for Python"
arch=('i686' 'x86_64')
license=('custom:public domain') # This is the licencing of Tim Newsham's variant
# Please notify if other licencing (LPL?) applies for this variant
# Also see: http://repo.cat-v.org/py9p/
url="http://mirtchovski.com/p9/py9p/index.php"
depends=('python2')
makedepends=('mercurial')
#source=('')
#md5sums=('')

build() {
  cd $srcdir

# Update the repo, else clone a new one
	if [ -d py9p ]; then
		cd py9p
		hg pull -u
		cd $srcdir
	else
		hg clone https://bitbucket.org/f2f/py9p
	fi
  cd $srcdir/py9p
  yes | python2 setup.py build
}

package() {
  cd $srcdir/py9p
  yes | python2 setup.py install --root="${pkgdir}"
}