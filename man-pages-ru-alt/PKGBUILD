 # Contributor: Artem Sereda <overmind88@gmail.com>
arch=('any')
pkgname=man-pages-ru-alt
_pkgname=man-pages-ru
pkgver=0.98
pkgrel=23
_pkg=$_pkgname-$pkgver-alt$pkgrel.noarch.rpm
pkgdesc="Russian Linux man pages with additions from ALT Linux"
url="http://www.linuxshare.ru/projects/trans/"
depends=('man')
makedepndes=('rpmextract')
conflicts=('man-pages-ru')
provides=('man-pages-ru')
license="FDL"
source=(ftp://ftp.altlinux.org/pub/distributions/ALTLinux/Sisyphus/files/noarch/RPMS/$_pkgname-$pkgver-alt$pkgrel.noarch.rpm)
md5sums=('0274763bbd96ae2df68ae6a1c891fce7')
install=man-pages-ru.install

build() {
  cd $srcdir
  rpmextract.sh $_pkg
  cp -r usr/ $pkgdir
  cd $pkgdir/usr/share/man/ru
  rm -f man5/passwd.5*
  rm -f man1/groups.1*
  rm -f man1/passwd.1*
}
