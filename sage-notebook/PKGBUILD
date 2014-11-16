# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-notebook
pkgver=0.11.1
pkgrel=1
pkgdesc='Web-based notebook interface for Sage'
arch=('any')
url='http://www.sagemath.org'
license=('GPL3')
depends=('sage-mathematics' 'python2-twisted' 'python2-flask-oldsessions' 'python2-flask-openid' 'python2-flask-autoindex' 'python2-flask-babel' 'python2-flask-silk' 'python2-webassets')
optdepends=('python2-pyopenssl: to use the notebook in secure mode')
source=("https://github.com/sagemath/sagenb/archive/$pkgver.tar.gz")
md5sums=('74d9ddd0f1b77ff8ef9d0f5b0007cf00')

prepare() {
  cd sagenb-$pkgver
  
# Use python2
  find -name *.py | xargs sed -e 's|#! /usr/bin/python|#! /usr/bin/python2|' -i
  sed -e 's|python %s|python2 %s|' -i sagenb/notebook/run_notebook.py
  sed -e "s|python = 'python'|python = 'python2'|" -i sagenb/interfaces/expect.py 
}

build() {
  cd sagenb-${pkgver}

  python2 setup.py build
}

package() {
  cd sagenb-${pkgver}

  python2 setup.py install --root "$pkgdir" --optimize=1

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/${pkgname}/COPYING
}
