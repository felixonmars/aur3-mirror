# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=python2-dpm-git
pkgver=304.f72436e
pkgrel=1
pkgdesc="dpm (data package manager) is a command line tool and python library for working with Data Packages and interacting with data hubs like those powered by CKAN."
url="https://github.com/okfn/dpm"
arch=('any')
license=('MIT')
depends=('python2-ckanclient')
makedepends=('git' 'python2-distribute')
source=('git+https://github.com/okfn/dpm.git')
md5sums=('SKIP')


prepare() {
  cd $srcdir/dpm

  # Fix new DataHub API URL
  sed -i 's|thedatahub.org|datahub.io|' dpm/config.py
}

package() {
  cd $srcdir/dpm
  python2 setup.py install --root $pkgdir
  
  # Man page
  install -Dm644 man/dpm.1.gz $pkgdir/usr/share/man/man1/dpm.1.gz
}

pkgver() {
  cd $srcdir/dpm
  echo $(git rev-list --count master).$(git rev-parse --short master)
}