pkgname=smlnj-latest
pkgver=110.75
pkgrel=1
pkgdesc="Standard ML of New Jersey is a compiler for the Standard ML '97 programming language"
url="http://www.smlnj.org/"
license="BSD"
arch=(i686 x86_64)
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
provides=(sml)
install=
# WOW this is a bad hack since the source .tgz don't have a version
# and so makepkg picksup old versions.
SRCDEST="$SRCDEST/$pkgname-$pkgver"
echo BAD HACK:  mkdir -p $SRCDEST
mkdir -p $SRCDEST

source=(
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/MLRISC.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/boot.x86-unix.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/ckit.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/cm.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/cml.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/config.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/eXene.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/ml-burg.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/ml-lex.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/ml-yacc.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/runtime.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/smlnj-c.tgz
    http://smlnj.cs.uchicago.edu/dist/working/$pkgver/smlnj-lib.tgz
)

build() {
  SMLNJ_DEST="$startdir/pkg/usr/lib/smlnj"
  SMLNJ_REALDEST="/usr/lib/smlnj"
  unset SMLNJ_HOME
  cd $startdir/src/
  mkdir -p src/runtime/objs
  cp $startdir/mk.x86-dragonfly src/runtime/objs
  cat $startdir/*.patch | patch -p0
  ./config/install.sh || return 1
  mkdir -p $SMLNJ_DEST/bin/{.run,.heap}

  cp bin/{.run-sml,.link-sml,.arch-n-opsys,ml-makedepend,ml-build} ${SMLNJ_DEST}/bin
  cp bin/.run/* ${SMLNJ_DEST}/bin/.run
  cp bin/.heap/* ${SMLNJ_DEST}/bin/.heap

  for i in ml-lex ml-yacc sml ml-burg
    do
    ln -s .run-sml ${SMLNJ_DEST}/bin/$i
  done

  cp -Rp lib ${SMLNJ_DEST}

  mkdir $startdir/pkg/usr/bin

  ln -s ${SMLNJ_REALDEST}/bin/ml-build $startdir/pkg/usr/bin
  ln -s ${SMLNJ_REALDEST}/bin/ml-burg $startdir/pkg/usr/bin
  ln -s ${SMLNJ_REALDEST}/bin/ml-lex $startdir/pkg/usr/bin
  ln -s ${SMLNJ_REALDEST}/bin/ml-makedepend $startdir/pkg/usr/bin
  ln -s ${SMLNJ_REALDEST}/bin/ml-yacc $startdir/pkg/usr/bin
  ln -s ${SMLNJ_REALDEST}/bin/sml $startdir/pkg/usr/bin

  mkdir -p $startdir/pkg/etc/profile.d
  echo -e export SMLNJ_HOME=$SMLNJ_REALDEST > $startdir/pkg/etc/profile.d/smlnj.sh
  chmod +x $startdir/pkg/etc/profile.d/smlnj.sh
}
md5sums=(
'd04b7790f2a4f40c6a4e1c49ce39dcc9'
'b7b073a36aa750d712684b0111e4df98'
'b28a38f0b19cc854ac2aa1732108f4d6'
'938200dc27919a528017f8f2c551f29c'
'5f350710cc335afbfc65499e61750f80'
'c80764b4cd1a75f5348af4058aea2369'
'347154c01abb1637d1be068a7cdb5ae6'
'afc5c4b8e20cb9dfa02722e46f7c3fe3'
'd48b97d8d4066333867e873264608d99'
'866b82612ee8a72ed2d657508bd7cf72'
'68d37e14e1958179980df0bb21eda693'
'ff7c95535d6c87ae57618d0bb8bb916f'
'89837ef518de40afc077a9ac2c609ece'
)
