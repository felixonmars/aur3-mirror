# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-maxmind-db-reader-git
pkgver=1.1.1.r143.05b1402
pkgrel=1
pkgdesc='Python 2 MaxMind database reader extension'
arch=('any')
url='https://github.com/maxmind/MaxMind-DB-Reader-python'
license=('APACHE2')
depends=('python2'
         'libmaxminddb-git'
         'python2-ipaddr')
makedepends=('git'
             'python2-setuptools')
source=('git+https://github.com/maxmind/MaxMind-DB-Reader-python.git')
sha256sums=('SKIP')
provides=('python2-maxmind-db-reader')
conflicts=('python2-maxmind-db-reader')

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

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd MaxMind-DB-Reader-python

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
