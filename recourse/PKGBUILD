# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
pkgname=recourse
pkgver=1.7.1
pkgrel=2
pkgdesc="An IMS Learning Design Editor"
arch=('i686' 'x86_64')
url="http://www.tencompetence.org/ldauthor/"
license=('BSD')
depends=('java-runtime' 'x-server')
install=$pkgname.install

_arch='lnx32'
[ "$CARCH" = "x86_64" ] && _arch='lnx64'

source=(http://www.tencompetence.org/ldauthor/download/ReCourse-$_arch-$pkgver.tar.gz \
        $pkgname.desktop)
md5sums=('0e250fa33dd984a7845216c713baa6b4'
         '857ffc72ec6be73f63a151a4eeccd087')

[ "$CARCH" = "x86_64" ] && md5sums[0]='4582ef8f598a2eb08c1531e821a064cd'

build() {
  cd "$srcdir"/ReCourse
  install -D -m644 docs/licence.txt \
      "$pkgdir"/usr/share/licenses/$pkgname/licence.txt
  install -d -m755 "$pkgdir"/usr/{share/$pkgname,bin}
  cp -R . "$pkgdir"/usr/share/$pkgname
  install -D -m644 icon.xpm "$pkgdir"/usr/share/pixmaps/$pkgname.xpm
  ln -s ../share/$pkgname/ReCourse "$pkgdir"/usr/bin/$pkgname
  install -D -m644 ../$pkgname.desktop \
      "$pkgdir"/usr/share/applications/$pkgname.desktop
}
