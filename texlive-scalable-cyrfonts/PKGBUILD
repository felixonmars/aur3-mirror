# Contributor: kaptoxic@yahoo.com
# Contributor: Alexey Bakhirkin <abakhirkin@gmail.com>
pkgname=texlive-scalable-cyrfonts
pkgver="4.16"
pkgrel=1
pkgdesc="Collection of scalable cyrillic fonts for tex"
arch=(any)
url="http://packages.debian.org/sid/scalable-cyrfonts-tex"
license=('custom')
depends=('texlive-core' 'texlive-langcyrillic')
install=texlive.install

_debname=scalable-cyrfonts-tex
source=(http://mirrors.kernel.org/debian/pool/main/s/scalable-cyrfonts/${_debname}_${pkgver}_all.deb)
noextract=("${_debname}_${pkgver}_all.deb")
md5sums=('0fa4d040d8b1395d485a6ee19c137fdb')

package() {
  cd "$srcdir"
  bsdtar -xf "${_debname}_${pkgver}_all.deb" data.tar.gz
  bsdtar -xf data.tar.gz

  #rm -r etc var
  cp -r usr "$pkgdir"
  install -D "usr/share/doc/$_debname/copyright" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
