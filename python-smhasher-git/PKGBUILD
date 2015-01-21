# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python-smhasher-git
pkgver=0.150.1.0.136.2.r8.gd71532c
pkgrel=1
pkgdesc='Python 3 wrapper for the SMHasher library'
arch=('i686' 'x86_64')
url='https://github.com/phensley/python-smhasher'
license=('MIT')
depends=('python')
source=('git+https://github.com/phensley/python-smhasher.git')
sha256sums=('SKIP')
makedepends=('git' 'svn' 'python-setuptools')
provides=('python-smhasher')
conflicts=('python-smhasher')

pkgver() {
  cd python-smhasher
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )

  # If there is a setup.py then pull the version tag from the file
  if [ -f "setup.py" ]; then
    if grep --quiet "VERSION = " setup.py; then
      printf "%s.%s" "$(grep -R "VERSION = " setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
    else
      printf "%s" $_gitversion
    fi
  else
    printf "%s" $_gitversion
  fi
}

build() {
  cd python-smhasher
  sh refresh.sh

  python setup.py build
}

package() {
  cd python-smhasher

  # We don't need anything related to git in the package
  rm -rf .git*

  python setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
