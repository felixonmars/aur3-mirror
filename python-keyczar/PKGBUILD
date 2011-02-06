# Contributor: Devin Cook <devin.c.cook@gmail.com>
pkgname="python-keyczar"
pkgver=0.6b
pkgrel=2
pkgdesc="Toolkit for safe and simple cryptography"
pkgdate=061709
arch=('any')
url="http://www.keyczar.org"
license=('APACHE')
depends=('python' 'pycrypto' 'pyasn1')
source=("http://keyczar.googlecode.com/files/$pkgname-$pkgver.$pkgdate.tar.gz")
sha1sums=("6373bf2c52fbf1a88519389f476c0691034257a6") #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$startdir/pkg || return 1
}

# vim:set ts=2 sw=2 et:
