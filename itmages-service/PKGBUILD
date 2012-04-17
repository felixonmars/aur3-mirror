# Maintainer: Raizner Evgeniy <razrfalcon@gmail.com>
pkgname=itmages-service
pkgver=0.38
pkgrel=1
pkgdesc="Uploading daemon for ITmages."
arch=('any')
url="https://launchpad.net/itmages"
license=('GPL')
groups=('network')
depends=('python2' 'python-pycurl' 'dbus-python' 'python2-lxml' 'pygobject')
makedepends=('bzr')
md5sums=() #generate with 'makepkg -g'

_bzrtrunk="https://code.launchpad.net/~itmages/itmages/"$pkgname

build() {
  bzr --no-plugins branch $_bzrtrunk $pkgname
  cd "$srcdir/$pkgname"
  python2 ./setup.py install --root="${pkgdir}"
}     
