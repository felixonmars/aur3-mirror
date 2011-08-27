# Contributor: Oguz Han Asnaz <O.Asnaz@gmx.net>

pkgname=lostgeektools
pkgver=0.2.4
pkgrel=1
pkgdesc='Collection of useful tools.'
arch=('i686' 'x86_64')
url="http://lostgeek.de/doku.php/en/linux/lostgeektools"
depends=('python' 'libqalculate' 'readline')
license=('GPL')
source=("http://files.lostgeek.de/lostgeektools/lostgeektools-$pkgver.tar.gz")

build() {
  cd ${srcdir}/lostgeektools-${pkgver}/src/

  # translations
  cd ../setup
  ./setup_translations.py --path $pkgdir || return 1
  cd ../src

  # batstat
  install -D -m755 "batstat/batstat.py" "${pkgdir}/usr/bin/batstat"
  
  # lsh
  python ../setup/setup_lsh.py build || return 1
  python ../setup/setup_lsh.py install --root=$pkgdir || return 1

  # jrnl
  install -D -m755 "jrnl/jrnl.py" "${pkgdir}/usr/bin/jrnl"

}

# vim:set sts=2 ts=2 sw=2 et:
