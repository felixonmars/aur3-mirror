# Maintainer: mitsuse <mitsuset - gmail>
pkgname=python2-blohg
pkgver=0.9.1
pkgrel=3
pkgdesc="blohg is a simple and easy to use blog engine, that uses the Mercurial SCM as backend, to store the content of the posts and pages."
arch=('any')
url='http://blohg.org'
license=('GPL-2')
depends=(
    'docutils>=0.7'
    'python2-flask>=0.7'
    'python2-flask-babel>=0.6'
    'python2-flask-script>=0.3'
    'python2-frozen-flask>=0.7'
    'python2-jinja>=2.5.2'
    'python2-yaml'
    'python2-pygments'
    'mercurial')
optdepends=()
makedepends=('setuptools')
source=("http://pypi.python.org/packages/source/b/blohg/blohg-0.9.1.tar.gz")
md5sums=('9490274a2edf68374953652bd9f3d370')

build() {
    cd $srcdir/blohg-$pkgver
    python2 setup.py install --root="$pkgdir" --prefix=/usr
}
