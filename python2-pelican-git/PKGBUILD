# Contributor: solsTiCe d'Hiver <solstice.dhiver@gmail.com>
# Maintainer: utdemir <utdemir@riseup.net>

pkgname=python2-pelican-git
pkgver=20130120
pkgrel=1
pkgdesc="Static blog generator in python, using ReST or Markdown syntax"
arch=('any')
url="http://pelican.notmyidea.org/"
license=("GPL3")
depends=('python2-six' 'python2-docutils' 'python2-jinja' 'python2-feedgenerator' 'python2-pygments' 'python2-pytz' 'python2-blinker' 'python-unidecode')
optdepends=('python2-markdown: for markdown support')
makedepends=('git')
conflicts=('pelican' 'pelican-git')
source=()

_gitroot="https://github.com/getpelican/pelican.git"
_gitname="pelican"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

	cd "$srcdir/$_gitname-build"
	python2 ./setup.py install --root=$pkgdir
	#rm -f $pkgdir/usr/bin/*.bat
}

