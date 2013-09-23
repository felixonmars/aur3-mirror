# Contributor: lang2 <wenzhi.liang@gmail.com>
# Maintainer: sylvain alborini  <sylvain dot alborini at gmail dot com>

pkgname=pyzenity
_pkg_name=PyZenity
pkgver=0.1.7
pkgrel=1
pkgdesc="python bindings for zenity"
url="http://www.brianramos.com/?page_id=38"
depends=('python2' 'zenity')
		  arch=('any')
license=('GPL')
source=(http://brianramos.com/software/${_pkg_name}/${_pkg_name}-${pkgver}.tar.gz)
md5sums=('dcacadafafaa1d71abfec06805936aef')



build() 
{
  cd "$srcdir/$_pkg_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
