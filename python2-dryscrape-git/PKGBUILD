# Maintainer:  jyantis <yantis@yantis.net>

pkgname=python2-dryscrape-git
pkgver=0.9.1.r67.8c016e6
pkgrel=2
pkgdesc='A lightweight Python 2 library that uses Webkit to enable easy scraping of dynamic, Javascript-heavy web pages'
arch=('any')
url='https://github.com/niklasb/dryscrape'
license=('custom')
depends=('python2'
         'python2-lxml'
         'python2-webkit-server-git')
optdepends=('xorg-server-xvfg: for headless usage')
source=('git+https://github.com/niklasb/dryscrape.git')
sha256sums=('SKIP')
makedepends=('git' 'python2-setuptools')
provides=('python2-dryscrape')
conflicts=('python2-dryscrape')

pkgver() {
  cd dryscrape
  _gitversion=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  printf "%s.%s" "$(grep -R "version=" setup.py | awk -F\' '{print $2}')" $_gitversion | sed 's/-/./g'
}

build() {
  cd dryscrape

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  python2 setup.py build
}

package() {
  cd dryscrape

  # We dont need anything related to git in the package
  rm -rf .git*

  python2 setup.py install --root="${pkgdir}" --optimize=1

  # Install License
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
