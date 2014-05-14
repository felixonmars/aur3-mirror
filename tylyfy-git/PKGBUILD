# Maintainer: Kacper Żuk <kacper.b.zuk+aur@gmail.com>

_pkgname=tylyfy
pkgname=$_pkgname-git
provides=$_pkgname
pkgver=r44.851a8a3
pkgrel=1
pkgdesc="CLI-based Spotify player"
arch=(any)
url="https://bitbucket.org/kazuldur/tylyfy"
license=('BSD')
makedepends=('python-setuptools' 'git')
depends=('python' 'python-spotify-git' 'python-pyalsaaudio')
optdepends=('python-pylast: for alternative Last.fm scrobbler')
options=(!emptydirs)
source=(git+http://bitbucket.org/Kazuldur/tylyfy.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
