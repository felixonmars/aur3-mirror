# Contributor: 7kry <kt[at]7kry.net>

_gitname=twsh
pkgname=python-twsh-git
pkgver=v0.1
pkgrel=1
pkgdesc='Twitter Shell for Python'
url='https://github.com/7kry/twsh'
license='MIT'
arch=('any')
depends=('python' 'python-tweepy-git' 'python-yaml' 'python-dateutil')
makedepends=('git')
source=(git://github.com/7kry/twsh.git)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_gitname
  python setup.py build
}

package() {
  cd $srcdir/$_gitname
  python setup.py install --root=$pkgdir --prefix=/usr
}
