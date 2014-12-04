# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-copper-git
pkgver=0.0.4.r272.956e9ae
pkgrel=1
pkgdesc='Fast, easy and intuitive machine learning prototyping for Python 2'
arch=('any')
url='http://github.com/danielfrg/copper'
license=('GPL')
depends=('python2'
         'python2-numpy'
         'python2-scipy'
         'python2-dateutil'
         'python2-pandas'
         'python2-scikit-learn'
         'python2-pytz'
         'python2-six'
         'ipython2'
         )
source=('git+http://github.com/danielfrg/copper.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-copper')
conflicts=('python2-copper')

pkgver() {
  cd copper
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "version = " setup.py; then
      printf "%s.%s" "$(grep -R "version = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    elif grep --quiet "version=" setup.py; then
      printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd copper

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd copper

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

  # Install Documentation
  install -D -m644 README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
}

# vim:set ts=2 sw=2 et:
