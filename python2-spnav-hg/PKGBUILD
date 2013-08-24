# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=python2-spnav-hg
pkgver=18.8aeaf357dc96
pkgrel=1
pkgdesc="A Python binding for libspnav"
arch=("i686" "x86_64")
url="https://spnav.readthedocs.org/en/latest/index.html"
license=('custom')
makedepends=('mercurial')
depends=('python2' 'libspnav')
source=("spnav::hg+https://bitbucket.org/seibert/spnav"
        "fix-libx11-dependency.patch")
md5sums=('SKIP'
         'a895d7a426573c6d7c7594d0eb07ab58')

pkgver() {
  cd spnav
  echo $(hg identify -n).$(hg identify -i)
}

build() {
  cd spnav
  patch -Np1 -i "${srcdir}/fix-libx11-dependency.patch"
  python2 setup.py build
}

package() {
  cd spnav
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
