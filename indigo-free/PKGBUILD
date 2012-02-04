# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: perpetrator
pkgname=indigo-free
pkgver=1.0.9_2
_expver=v109
pkgrel=1
pkgdesc="Physically-based unbiased render engine"
arch=('i686' 'x86_64')
url="http://www.indigorenderer.com"
license=('custom')
depends=('wxgtk')
conflicts=('indigo')
backup=('opt/indigo/inifile.xml')
options=(docs)
install=indigo.install
if [ $CARCH = "i686" ]; then
  source=(http://www.indigorenderer.com/dist/indigo_linux_v${pkgver}.tar.gz \
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.smartden.de/uploads/File/Indigo/blendigo_$_expver.zip)
  md5sums=('a4855e1312a78462028484737c1f65fd'
           '3d1ee12344502bda3a41f496e97a4cf4'
           '19fde0fa8b9151f7d2aa56710a1296d6'
           'a186f890883ab81744904a93ff91f56e'
           '09062de09facc7652f8fe9e6e4de635f'
           '5810b4ceb64a2e255a6afc240a1b008a')
elif [ $CARCH = "x86_64" ]; then
  source=(http://www.indigorenderer.com/dist/indigo_x64_linux_v${pkgver}.tar.gz \
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.smartden.de/uploads/File/Indigo/blendigo_$_expver.zip)
  md5sums=('9228bdbf30f0999301614ad9ebc77235'
           '3d1ee12344502bda3a41f496e97a4cf4'
           '19fde0fa8b9151f7d2aa56710a1296d6'
           'a186f890883ab81744904a93ff91f56e'
           '09062de09facc7652f8fe9e6e4de635f'
           '5810b4ceb64a2e255a6afc240a1b008a')
fi

build() {
  mkdir -p "$pkgdir"/opt

  if [ $CARCH = "i686" ]; then
    cp -a "$srcdir"/indigo_linux_v${pkgver} \
      "$pkgdir"/opt/indigo
  elif [ $CARCH = "x86_64" ]; then
    cp -a $srcdir/indigo_x64_linux_v${pkgver} \
      $pkgdir/opt/indigo
  fi

  touch "$pkgdir"/opt/indigo/log.txt
  chmod 777 "$pkgdir"/opt/indigo/log.txt
  chmod 1777 "$pkgdir"/opt/indigo
  chmod 1777 "$pkgdir"/opt/indigo/renders
  chmod 1777 "$pkgdir"/opt/indigo/tree_cache
  rm "$pkgdir"/opt/indigo/changelog.txt
  rm -rf "$pkgdir"/opt/indigo/testscenes
  mkdir -p "$pkgdir"/usr/share/doc/indigo
  mv "$pkgdir/opt/indigo/Indigo Manual.pdf" "$pkgdir"/usr/share/doc/indigo/IndigoManual.pdf
  
  install -D -m755 "$srcdir"/indigo.sh "$pkgdir"/usr/bin/indigo
  install -D -m755 "$srcdir"/indigo_console.sh "$pkgdir"/usr/bin/indigo_console
  # install desktop file and icon
  install -D -m644 "$srcdir"/indigo.desktop "$pkgdir"/usr/share/applications/indigo.desktop
  install -D -m644 "$srcdir"/indigo.png "$pkgdir"/usr/share/pixmaps/indigo.png
  # install the license
  mkdir -p "$pkgdir"/usr/share/licenses/indigo
  mv "$pkgdir"/opt/indigo/license.txt "$pkgdir"/usr/share/licenses/indigo/license.txt
  # install blendigo
  install -D -m644 "$srcdir"/blendigo_$_expver.py "$pkgdir"/usr/share/blender/scripts/blendigo.py
  mkdir -p "$pkgdir"/usr/share/blender/scripts/bpydata/
  echo "/opt/indigo" > "$pkgdir"/usr/share/blender/scripts/bpydata/IndigoWrapper.conf
  cp -r "$srcdir"/previews "$pkgdir"/opt/indigo
}

# vim:set ts=2 sw=2 et:
