pkgname=zopeedit
pkgver=0.9.11
pkgrel=3
pkgdesc="Zope External Editor client helper application"
arch=('any')
license=('ZPL')
url="http://plone.org/products/zope-externaleditor-client/"
depends=('python' 'tk')
_patch='zopeedit.py-0.10.2.patch'
source=("$url/releases/$pkgver/$pkgname.py"
        "$_patch")
md5sums=('9342a1d9d151ac8d89120df01356f20e'
         'abcb4d4677e1f75178e296ea18cf7dc4')

build() {
  filename="$pkgdir/usr/bin/$pkgname.py"
  install -D -m 0755 $pkgname.py "$filename" || return 1
  patch "$filename" "$_patch" || return 1
}
