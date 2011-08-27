# Contributor: ice-man <icemanf@gmail.com>
pkgname=sisfbctrl
pkgver=020305
pkgrel="1" 
pkgdesc="sisfbctrl a small utility to change the screen's position on the TV, and to enable or disable CRT1 VGA output after sisfb has been started"
provides=sisfbctrl
makedepends=('gcc' 'make')
depends=()
source=(http://www.winischhofer.net/sis/sisfbctrl_src_$pkgver-1.tar.gz)
url="http://www.winischhofer.at/linuxsisvga.shtml"
md5sums=('b190274e81098296d2d06c73b9bb0521')
license="GPL"

# This is needed due to that downloaded file is wrong so tar give an error but you can succesfully avoid that 
NOEXTRACT=1

build() {
  cd $startdir/src/

  echo -e "\033[1;32m==>\033[1;0m \033[1;1m$1\033[1;0m" >&2
  msg "Validating source files with MD5sums"
  echo "${md5sums[0]}  $file" | md5sum -c - >/dev/null 2>&1
  if [ $? -ne 0 ]; then
     echo "    $file ... FAILED" >&2
     exit;
  fi

  echo "    $file ... Passed" >&2  

  echo -e "\033[1;32m==>\033[1;0m \033[1;1m$1\033[1;0m" >&2
  msg "Extracting Sources..."
  msg "\ttar --use-compress-program=gzip -xf $file"
  tar --use-compress-program=gzip -xf $file >/dev/null 2>&1

  ./compile
 
  mkdir -p $startdir/pkg/usr/bin

  install -m 755 sisfbctrl $startdir/pkg/usr/bin
}
