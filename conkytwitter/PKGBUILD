# Contributor: MatÃ­as HernÃ¡ndez <msdark@archlinux.cl>
pkgname=conkytwitter
pkgver=0.1
pkgrel=4
pkgdesc="Little python script to get your twitter timeline and put in your desktop using conky"
arch=("i686")
url="http://www.msdark.archlinux.cl/conkytwitter/"
license=('GPL')
groups=()
depends=("python" "python-twitter" "conky")
source=(http://dl.dropbox.com/u/1364555/conkyTwitter-0.1.tar.gz)
md5sums=('39ec472a097388fd2cdbae66c06b01b1')

build() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/usr/bin"
  #cp conkyTwitter.py "$pkgdir/usr/local/bin/"
  #chmod +x "$pkdir/usr/local/bin/conkyTwitter.py"
  install -D -m755 conkyTwitter.py ${pkgdir}/usr/bin/conkyTwitter.py
}
