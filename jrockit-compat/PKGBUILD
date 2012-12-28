# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=jrockit-compat
pkgver=1.6.0_37
_relver=28.2.5-4.1.0
pkgrel=1
pkgdesc="JRockit is a high performace JVM from Oracle (formerly from BEA)"
url="http://www.oracle.com/technetwork/middleware/jrockit/"
depends=('alsa-lib' 'unixodbc' 'libxtst' 'gtk2')
license=('custom')
arch=('i686' 'x86_64')
install=${pkgname}.install
options=(!strip !zipman)
_archive="jrockit-jdk${pkgver}-R${_relver}-linux-x64.bin"
_archive_md5="07cdb8b85f5393378511c5e1aa1bef35"

source=(
	license.html
	silent.xml
)

md5sums=(
	'9212c2dbe1fefa6cea5163497661d704'
	'cb117b969a643a2ed7b9f10d5afba44c'
)

if test "$CARCH" == i686; then
	_archive=jrockit-jdk${pkgver}-R${_relver}-linux-ia32.bin
	_archive_md5='50b63adb2d6eb896b3948bda92fbc7ab'
fi

build() {
	_get_local_source "${_archive}" --md5 "${_archive_md5}" || {
    error "Unable to find the jrockit archive. Please download ${_archive} from http://www.oracle.com/technetwork/middleware/jrockit/downloads/index.html , and place it into one of the above locations."
    exit 1; }	
	mkdir -p $startdir/pkg/opt/jrockit
	cd $pkgdir/opt/jrockit
	chmod 755 $srcdir/$_archive
	$srcdir/$_archive -mode=silent -silent_xml=$srcdir/silent.xml
	cd $srcdir
	install -D -m 644 $srcdir/license.html $startdir/pkg/usr/share/licenses/$pkgname/license.html
}

###### HELPER FUNCTIONS ######

# Locates a file or folder provided by the user, and symlinks it into $srcdir
_get_local_source() {
  msg "Looking for '$1'..."; rm -f "$srcdir/$1"
  declare -A _search=(['build dir']="$startdir"
                      ['$LOCAL_PACKAGE_SOURCES']="$LOCAL_PACKAGE_SOURCES")
  for _key in "${!_search[@]}"; do local _dir="${_search["$_key"]}"
    echo -n "    - in $_key [${_dir:-<undefined>}] ... ";
    if [[ -z "$_dir" || ! -e "$_dir/$1" ]]; then
      echo "NOT FOUND"
    elif [[ -n $2 && "$(${2#--}sum "$_dir/$1"|awk '{print $1}')" != $3 ]]; then
      echo "CHECKSUM FAILED";
    else
      echo "FOUND"; ln -sfT "$(readlink -f "$_dir/$1")" "$srcdir/$1"; break; fi
  done
  if [ ! -e "$srcdir/$1" ]; then return 1; fi
}
