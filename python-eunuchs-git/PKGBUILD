# Maintainer: Visa Jokelainen <visaj&iki.fi>
pkgname=python-eunuchs-git
pkgver=20130712
pkgrel=1
pkgdesc='A library of Python extensions that complement the standard libraries in parts where full support for the UNIX API (or the Linux API) is missing.'
arch=('any')
url='https://github.com/tv42/eunuchs'
license=('LGPL')
depends=('python2')
makedepends=('git' 'gcc')
provides=('python-eunuchs')

_gitroot='https://github.com/tv42/eunuchs'
_gitname='eunuchs'

build()
{
    cd ${srcdir}
    msg "Connecting to GIT server..."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone --depth=1 $_gitroot
	fi

	msg "GIT checkout done or server timeout."
	msg "Building..."

    cd ${srcdir}/${_gitname}
    python setup.py build
}

package()
{
    cd ${srcdir}/${_gitname}
    python setup.py install --root="$pkgdir/" --optimize=1
}
