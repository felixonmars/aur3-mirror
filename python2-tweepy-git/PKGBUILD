# Contributor: Lex Black <autumn-wind at web dot de>

_gitname=tweepy
pkgname=python2-tweepy-git
pkgver=1.7.1.r26.g3484472
pkgrel=1
pkgdesc='Twitter api library for python'
url='https://github.com/tweepy/tweepy'
license='MIT'
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
conflicts=('python2-tweepy')
provides=('python2-tweepy')
source=(git://github.com/m00n/tweepy.git)
md5sums=('SKIP')


pkgver() {
  cd "$_gitname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_gitname
  python2 setup.py build
}

package() {
  cd $srcdir/$_gitname
  python2 setup.py install --root=$pkgdir --prefix=/usr
}
