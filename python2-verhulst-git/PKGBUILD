# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-verhulst-git
pkgver=0.1.0.r1180.eb8680e
pkgrel=1
pkgdesc='Python 2 library for evaluating binary logistic regressions fitted with scikit-learn. Statistical analysis and plotting routines to evaluate binary logistic regressions'
arch=('any')
url='https://github.com/rpetchler/verhulst'
license=('MIT')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-matplotlib')
source=('git+https://github.com/rpetchler/verhulst.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-verhulst')
conflicts=('python2-verhulst')

pkgver() {
  cd verhulst
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  if [ -f "verhulst/__init__.py" ]; then
      printf "%s.%s" "$(grep -R "__version__ =" verhulst/__init__.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd verhulst

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

check() {
  cd verhulst
  python2 setup.py test --verbose
}

package() {
  cd verhulst

  # We don't need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
}

# vim:set ts=2 sw=2 et:
