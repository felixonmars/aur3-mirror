# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=ikvm-cvs
pkgver=20110223
pkgrel=1
pkgdesc="An implementation of Java for Mono."
arch=('i686' 'x86_64')
url="http://www.ikvm.net/"
license=('custom:GPLv2')
conflicts=(ikvm)
depends=(mono)
makedepends=(java-environment nant pkgconfig)
source=(http://www.frijters.net/openjdk6-b21-stripped.zip
ikvm.pc.in
ikvm.dll.config)
md5sums=('b5e835edb3a9f139333a8f110e703dec'
         '8d9fc2977ac79b09c29ba402dcda6471'
         'b25dcece089a9fe6e7e516265835e89a')
_cvsroot=":pserver:anonymous@ikvm.cvs.sourceforge.net:/cvsroot/ikvm"
_cvsmod="ikvm"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  ln -sf /usr/lib/mono/2.0/ICSharpCode.SharpZipLib.dll bin/ICSharpCode.SharpZipLib.dll

  nant
  nant native
}

package() {
  cd "$srcdir/$_cvsmod-build"

  mkdir -p $pkgdir/usr/lib/ikvm
  cp bin/libikvm-native.so $pkgdir/usr/lib/ikvm/

  mkdir -p $pkgdir/usr/bin
  pushd bin
  for dllFile in IKVM.*.dll
  do
    cp -v $dllFile $pkgdir/usr/lib/ikvm/
    cp -v $srcdir/ikvm.dll.config $pkgdir/usr/lib/ikvm/$dllFile.config
  done
  for exeFile in *.exe
  do
    cp -v $exeFile $pkgdir/usr/lib/ikvm/
    base=`basename $exeFile .exe`
    wrapper=$pkgdir/usr/bin/$base
    echo "#!/bin/sh
env mono /usr/lib/ikvm/$exeFile \"\$@\"
" >$wrapper
    chmod +x $wrapper
  done
  popd

  mkdir -p $pkgdir/usr/lib/pkgconfig
  cp -v $srcdir/ikvm.pc.in $pkgdir/usr/lib/pkgconfig/ikvm.pc
  sed -i "s|@VERSION@|$pkgver|" $pkgdir/usr/lib/pkgconfig/ikvm.pc

  install -m755 -d ${pkgdir}/usr/share/licenses/${pkgname}
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
