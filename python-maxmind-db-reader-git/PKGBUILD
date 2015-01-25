# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-maxmind-db-reader-git
pkgver=1.1.1.r143.05b1402
pkgrel=1
pkgdesc='Python 3 MaxMind database reader extension'
arch=('any')
url='https://github.com/maxmind/MaxMind-DB-Reader-python'
license=('APACHE2')
depends=('python'
         'libmaxminddb-git')
makedepends=('git'
             'python-setuptools')
source=('git+https://github.com/maxmind/MaxMind-DB-Reader-python.git')
sha256sums=('SKIP')
provides=('python-maxmind-db-reader')
conflicts=('python-maxmind-db-reader')

pkgver() {
  cd MaxMind-DB-Reader-python
  set -o pipefail
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "maxminddb/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" maxminddb/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd MaxMind-DB-Reader-python

  python setup.py build
}

package() {
  cd MaxMind-DB-Reader-python

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
