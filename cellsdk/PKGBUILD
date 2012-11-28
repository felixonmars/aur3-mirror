# Contributor: Tomas Groth <tomasgroth@yahoo.dk>
#
# MUST be run as root!! It is needed for mounting the iso images
# You'll have to download the SDK iso's yourself from IBM's website
# (requires registration):
# http://www.ibm.com/developerworks/power/cell/downloads.html?S_TACT=105AGX16&S_CMP=LP
#
# tcl and tk versions must be pre-8.5, and build without threads (--disable-threads).
#
# There are probably still some rough edges, and something that I forgot to
# mention, but it works for me so far... For now only support for x86_64, but
# should be relatively easy to add i686 support, but since I don't have a
# working i686 box I haven't tried, but feel free to mail me patches.

pkgname=cellsdk
pkgver=3.1
pkgrel=1
pkgdesc="SDK for the Cell Broadband Engine Architecture"
arch=(x86_64)
url="https://www14.software.ibm.com/webapp/iwm/web/reg/download.do?source=cellsdk&S_PKG=fedora&S_TACT=105AGX16&S_CMP=LP&lang=en_US&cp=UTF-8"
depends=(tcl tk expat perl freeglut gawk gcc bison flex)
makedepends=(rpmextract)
conflicts=()
license="GPL"
options=(!strip)
install=cellsdk.install
_sourcehost=http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk3.1/CellSDK-Open-Fedora/x86_64
source=(
    $_sourcehost/libspe2-cross-devel-2.2.80-132.noarch.rpm
	$_sourcehost/netpbm-cross-devel-10.35.41-1.fc9.noarch.rpm
	$_sourcehost/ppu-binutils-2.18.50-21.i686.rpm
	$_sourcehost/ppu-binutils-debuginfo-2.18.50-21.i686.rpm
	$_sourcehost/ppu-gcc-4.1.1-166.i686.rpm
	$_sourcehost/ppu-gcc-c++-4.1.1-166.i686.rpm
	$_sourcehost/ppu-gcc-debuginfo-4.1.1-166.i686.rpm
	$_sourcehost/ppu-gcc-fortran-4.1.1-166.i686.rpm
	$_sourcehost/ppu-gcc-gnat-4.1.1-166.i686.rpm
	$_sourcehost/ppu-gdb-6.8.50-13.i686.rpm
	$_sourcehost/ppu-gdb-debuginfo-6.8.50-13.i686.rpm
	$_sourcehost/ppu-sysroot64-f9-2.noarch.rpm
	$_sourcehost/ppu-sysroot-f9-2.noarch.rpm
	$_sourcehost/spu-binutils-2.18.50-21.i686.rpm
	$_sourcehost/spu-binutils-debuginfo-2.18.50-21.i686.rpm
	$_sourcehost/spu-gcc-4.1.1-166.i686.rpm
	$_sourcehost/spu-gcc-c++-4.1.1-166.i686.rpm
	$_sourcehost/spu-gcc-debuginfo-4.1.1-166.i686.rpm
	$_sourcehost/spu-gcc-fortran-4.1.1-166.i686.rpm
	$_sourcehost/spu-gdb-6.8.50-13.i686.rpm
	$_sourcehost/spu-gdb-debuginfo-6.8.50-13.i686.rpm
	$_sourcehost/spu-newlib-1.16.0-17.i686.rpm
	$_sourcehost/spu-newlib-debuginfo-1.16.0-17.i686.rpm
	$_sourcehost/sysroot_image-3.1-1.noarch.rpm
	systemsim-cell-3.1-25.f9.x86_64.rpm
	CellSDK-Devel-Fedora_3.1.0.0.0.iso
	CellSDK-Extras-Fedora_3.1.0.0.0.iso
	systemsim-cell.sh)
md5sums=('ff2b2c9b3a71066ba6506155c2c6ef79'
         '9824d3492b2943181e9271b04755a710'
         'e593181f9392ab8bd1d5fce88660c385'
         'a4ce7508ca74e0ef8af60462bc90d63d'
         'b77bbe5099cbcdd913127e2134535c39'
         '013e8a7e1325c2d423b6c1d69e6a3362'
         '6183d42fa327594e61ffb9aff62b81c0'
         'd8c7d09c834b9cecedc41cd4fb5302e6'
         'd6ce82f181175deaf89d22f69eeef2be'
         'd37999484707302faa1c3482c1dc014b'
         '163129f7649891b48e25d0c29ee42643'
         '2cea25b96dba3c5edc77673548d3deff'
         'ef087d2c38ac35f7fff0ff6dabb4f282'
         '66e83cafbde49e9e414a158e9e67aa62'
         '1e846fed78a193892bc8f3505dc15750'
         'd9d4dfa53aeb54eb4ff274eefef22236'
         'a4a29728157d0676e3d280fc846eec97'
         '5084564737885f275181ab8b1c796e07'
         'de7960396e73f66431d37b45c1584e11'
         '3342e06ab171dff7a1fbe2f77614108a'
         '702fa9166a3bb0745659ec02ef764a83'
         'ece9437651dedd3babcad1e889b49af3'
         '43eaf4847ae2f540699d25598c5944a1'
         '1e55e85bb23c779ac3f95a30d3ca3025'
         '4b069cebf26bd16cec8e768d2c68e830'
         '7965c321f81ab1ca5ab14991b90760d5'
         'd97eb4b06f45df618eda8079e4d7bc68'
         '045937702389d3fd8586d9047050fd0f'
         'f9582fc6f453d63b38e87622f2a12cd1')

build() {

  # Get the stuff from the iso-images
  mkdir -p $startdir/loop
  mkdir -p $startdir/pkg/
  cd $startdir/pkg/

  # First the Devel iso
  mount -o loop $startdir/src/CellSDK-Devel-Fedora_3.1.0.0.0.iso $startdir/loop
  for x in $startdir/loop/x86_64/*.rpm
  do
    rpmextract.sh $x
  done
  rpmextract.sh $startdir/loop/cell-install-3.1.0-0.0.noarch.rpm
  umount $startdir/loop

  # Then the Extras iso
  mount -o loop $startdir/src/CellSDK-Extras-Fedora_3.1.0.0.0.iso $startdir/loop
  for y in $startdir/loop/x86_64/*.rpm
  do
    rpmextract.sh $y
  done
  umount $startdir/loop

  # Extract the stuff from the rpms
  for z in $startdir/src/*.rpm
  do
    rpmextract.sh $z
  done

  mkdir -p $startdir/pkg/etc/profile.d
  cp $startdir/systemsim-cell.sh $startdir/pkg/etc/profile.d/systemsim-cell.sh

}
