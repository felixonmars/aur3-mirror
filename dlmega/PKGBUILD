pkgname=dlmega
pkgver=1.1.4
pkgrel=1
pkgdesc='Tiny mega.nz and mega.co.nz file downloader for the command line.'
arch=(any)
url='http://dlme.ga'
license=('Freeware')
source=('dlmega::http://dlme.ga')
pacman -Qo xxd >/dev/null || depends=('xxd')
md5sums=('a6ae0ccd500ad14bbc7782a60ff15424')
package() {
  install -Dm755 "$srcdir/dlmega" "$pkgdir/usr/bin/dlmega"
}
