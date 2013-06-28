# Maintainer: Kevin Cox (kevincox - kevincox.ca@gmail.com)
pkgname=entr-hg
pkgver=0
pkgrel=3
pkgdesc='A utility for running arbitrary commands when files change.'
url='http://entrproject.org/'
license=('MIT')
arch=('i686' 'x86_64')
depends=('mercurial')
optdepends=()

_hgurl='https://bitbucket.org/eradman/entr'

build()
{
	msg 'Connecting to mercurial server....'

	if [[ -d "$srcdir/entr" ]]; then
		cd "$srcdir/entr"

		if hg pull ; then
			msg 'The local files have been updated.'
		else
			msg 'Problem updating sources.'
		fi
	else
		if hg clone "$_hgurl" "$srcdir/entr" ; then
			msg 'Sources successfully downloaded.'
		else
			msg 'Problem retrieving sources.'
		fi
	fi
	
	msg 'Starting build...'
	cd "$srcdir/entr"

	./configure
	make
}

package() 
{
	cd "$srcdir/entr"
	make install "PREFIX=$pkgdir/usr"
}
