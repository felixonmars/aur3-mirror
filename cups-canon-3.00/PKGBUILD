# Maintainer: Axel Utech <axel.utech at gmail dot com>
# Contributor: Orivej Desh <orivej@gmx.fr>
pkgname=cups-canon-3.00
pkgver=3.00
pkgrel=6
pkgdesc="Canon iP3600, iP4600, MP630, MP540, MP240, MP190 and iP1900 CUPS drivers"
arch=("i686" "x86_64")
url="http://software.canon-europe.com/software/0031332.asp"
license=("custom")
depends=("gtk2" "popt" "libpng12" "libtiff3" "pangox-compat")
[ "$CARCH" = "x86_64" ] && depends=("gtk2" "popt" "lib32-libpng12" "lib32-libxml2" "lib32-gtk2" "lib32-popt" "lib32-libtiff3" "pangox-compat")
makedepends=("xz")
provides=()
conflicts=()
replaces=()
source=("http://gdlp01.c-wss.com/gds/6/0100001606/01/cnijfilter-common-3.00-1.tar.gz" "bin64.tar.xz" "cups-ppd.patch" "bjcupsmon_cups.patch")
md5sums=('b4c3dab3c491fbe3f9dc830dae401a45' '79ac112c41d4e2804ed8e812c732d687' '1f567e61aa44f2cb60139d46990f0ebe' '32f1834ea3f746d6176572723fd634fb')

build() {
  MODELS=(ip1900 ip3600 ip4600 mp190 mp240 mp540 mp630)

  cd "$srcdir/cnijfilter-common-$pkgver"
  patch -Np1 -i ../cups-ppd.patch
  
  patch -Np1 -i ../bjcupsmon_cups.patch
  

  # Common
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 LICENSE* "$pkgdir/usr/share/licenses/$pkgname"

  for i in libs cngpij pstocanonij backend; do
    cd $i
    echo "......... $i"
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
    make
    make DESTDIR="$pkgdir" install
    cd ..
  done

  install -d "$pkgdir/usr/share/cups/model"
  install -m644 ppd/*ppd "$pkgdir/usr/share/cups/model"

  # Particular
  TARGETS=(lgmon cngpijmon)
  for model in ${MODELS[@]}; do
    echo -e "..........\n. $model\n.........."
    for target in ${TARGETS[@]}; do
      cd $target
      echo ".......... $target"
      ./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --enable-progpath=/usr/bin --program-suffix=$model
      make clean
      make
      make DESTDIR="$pkgdir" install
      cd ..
    done
  done

  # Prepackaged TARGETS=(cnijfilter printui)
  install ../bin64/* "$pkgdir/usr/bin"

  install -d "$pkgdir/usr/lib/bjlib"
  for i in 333 334 336 338 341 342 346; do
    install -m644 $i/database/* "$pkgdir/usr/lib/bjlib"
    install $i/libs_bin/*.so.* "$pkgdir/usr/lib"
  done
}

