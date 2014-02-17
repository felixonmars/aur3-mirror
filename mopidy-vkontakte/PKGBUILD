# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=mopidy-vkontakte
_pypiname=Mopidy-VKontakte
pkgver=0.2.0
pkgrel=1
pkgdesc="Mopidy extension for VKontakte allows to listen to music from VKontakte social network"
arch=('any')
url="http://www.mopidy.com"
license=('APACHE')
depends=(
	'mopidy>=0.18'
	'python2-setuptools')
makedepends=('python2' 'git')
source=("git+https://github.com/jodal/mopidy-vkontakte.git")
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  git checkout mopidy-0.18-updates
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
