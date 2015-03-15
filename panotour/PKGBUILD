# Contributor: Fincer <fincer89 at hotmail dot com>
pkgname=panotour
pkgver=2.3.2
_pkgver=232_2015-03-09
_pkgname=Panotour
pkgrel=1
pkgdesc='Create quality virtual tours (trial version).'
arch=('x86_64')
url='http://kolor.com/'
license=('custom: "commercial"')
depends=("qt4>=4")
install=$pkgname.install

  source=("Panotour_Linux64_$_pkgver.tar.gz::http://download.kolor.com/pt/stable/linux64tar"
  "$pkgname" "$pkgname.desktop" "$pkgname.png")
md5sums=('c193b0b44bb6fa5628e7411b93d258a7'
         '451d82df36b338942989a89125e5c51d'
         '042e7af9eed7f0c58783b330e26cea0d'
         'd6447677a8040c96465b58f27de972aa')

package(){
  cd "$srcdir/$_pkgname" || return 1
  install -dm755 $pkgdir/opt/$pkgname || return 1
  tar -c ./ | tar -x -C $pkgdir/opt/$pkgname || return 1
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname || return 1
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

