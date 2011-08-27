# Contributor: perpetrator <evil.perpetrator@googlemail.com>
pkgname=indigo-unstable
pkgver=1.1.18
_expver=v1114
pkgrel=1
pkgdesc="Physically-based unbiased render engine (unstable version)"
arch=('i686' 'x86_64')
url="http://www.indigorenderer.com"
license=('custom')
depends=('wxgtk')
conflicts=('indigo')
backup=('opt/indigo/inifile.xml')
options=(docs)
install=indigo.install
if [ $CARCH = "i686" ]; then
  source=('http://www.indigorenderer.com/dist/indigo_v1.1.18.tar.gz'\
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.smartden.de/uploads/File/Indigo/blendigo_$_expver.zip)
  md5sums=('b40cff790f1bb9af0c6511bc2c0a7a73'
           '3d1ee12344502bda3a41f496e97a4cf4'
           '19fde0fa8b9151f7d2aa56710a1296d6'
           'a186f890883ab81744904a93ff91f56e'
           '09062de09facc7652f8fe9e6e4de635f'
           'b11b4c7c6ae7bed32020f42bcf922ed6')
elif [ $CARCH = "x86_64" ]; then
  source=('http://www.indigorenderer.com/dist/indigo_x64_v1.1.18.tar.gz' \
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.smartden.de/uploads/File/Indigo/blendigo_$_expver.zip)
  md5sums=('e5eb620e97237c165cb615c8500b6374'
           '3d1ee12344502bda3a41f496e97a4cf4'
           '19fde0fa8b9151f7d2aa56710a1296d6'
           'a186f890883ab81744904a93ff91f56e'
           '09062de09facc7652f8fe9e6e4de635f'
           'b11b4c7c6ae7bed32020f42bcf922ed6')
fi

build() {
  mkdir -p $pkgdir/opt

if [ $CARCH = "i686" ]; then

  cp -a $srcdir/indigo_v${pkgver} \
    $pkgdir/opt/indigo

elif [ $CARCH = "x86_64" ]; then

  cp -a $srcdir/indigo_x64_v${pkgver} \
    $pkgdir/opt/indigo


fi

  touch $pkgdir/opt/indigo/log.txt
  chmod 777 $pkgdir/opt/indigo/log.txt
  chmod 1777 $pkgdir/opt/indigo
  chmod 1777 $pkgdir/opt/indigo/renders
  chmod 1777 $pkgdir/opt/indigo/tree_cache
  rm $pkgdir/opt/indigo/changelog.txt
  rm -rf $pkgdir/opt/indigo/testscenes
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mv "$pkgdir/opt/indigo/Indigo Manual.pdf" $pkgdir/usr/share/doc/$pkgname/IndigoManual.pdf
  
  install -D -m755 $srcdir/indigo.sh $pkgdir/usr/bin/indigo
  install -D -m755 $srcdir/indigo_console.sh $pkgdir/usr/bin/indigo_console
  # install desktop file and icon
  install -D -m644 $srcdir/indigo.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -D -m644 $srcdir/indigo.png $pkgdir/usr/share/pixmaps/$pkgname.png
  # install the license
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  mv $pkgdir/opt/indigo/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
  # install blendigo
  install -D -m644 $srcdir/blendigo_$_expver.py $pkgdir/usr/share/blender/scripts/blendigo.py
  mkdir -p $pkgdir/usr/share/blender/scripts/bpydata/
  echo "/opt/indigo" > $pkgdir/usr/share/blender/scripts/bpydata/IndigoWrapper.conf
  cp -r $srcdir/previews $pkgdir/opt/indigo
}

# vim:set ts=2 sw=2 et:
