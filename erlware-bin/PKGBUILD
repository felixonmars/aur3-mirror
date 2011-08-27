# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Felix Lange <fjl at twurst dot com>
pkgname=erlware-bin
pkgver=9
pkgrel=1
pkgdesc="A dynamic erlang distribution"
arch=(i686 x86_64)
url="http://www.erlware.org/"
license=('MIT')
groups=()
depends=('glibc' 'ncurses' 'bash')
makedepends=('awk')
optdepends=()
provides=('erlware' 'faxien')
conflicts=('erlware' 'faxien')
replaces=()
backup=()
options=()
install=erlware.install
source=(erlware.sh LICENSE)
noextract=()
md5sums=('7fa6b8ffa121cdf849151aca77841cd4' 
         'c0ae2ae4bbda74755a729fb8254a4536')

# switch source urls on CARCH
case ${CARCH} in
  i686)   
    source=(${source[@]} "launcher.sh::http://faxien.googlecode.com/files/faxien-launcher-i686-Linux-V$pkgver.sh") 
    md5sums=(${md5sums[@]} '73147da47cafea498f6d5dcd65cf61f5') ;;
  x86_64) 
    source=(${source[@]} "launcher.sh::http://faxien.googlecode.com/files/faxien-launcher-x86_64-Linux-2.6.29-V$pkgver.sh")
    md5sums=(${md5sums[@]} 'bcfeb76a8af2efc63ee9ad59b8b8ff7d') ;;
esac

build() {
  LAUNCHER="${startdir}/launcher.sh"
  PREFIX=${pkgdir}/opt/erlware 
  SKIP=$(awk '/^__ARCHIVE_FOLLOWS__/ { print NR + 1; exit 0; }' "$LAUNCHER")
  
  mkdir -p "$PREFIX"
  tail -n +$SKIP "$LAUNCHER" | tar -zxvf - -C "$PREFIX"
  
  chown -R root "$PREFIX"
  chgrp -R root "$PREFIX"  

  mkdir -p "${pkgdir}/etc/profile.d"
  install -Dm644 "${startdir}/erlware.sh" "${pkgdir}/etc/profile.d/"  

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
  install ${startdir}/LICENSE ${pkgdir}/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
