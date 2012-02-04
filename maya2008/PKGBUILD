# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=maya2008
pkgver=2008
pkgrel=4
pkgdesc="Professional 3d Animation"
arch=('i686' 'x86_64')
license=('Proprietary')
url="http://usa.autodesk.com/"
depends=('tcsh' 'libxp' 'libxpm' 'libxinerama')
provides=()
conflicts=()
makedepends=('rpmextract')
source=('maya2008_0-20080-116i686.rpm'
        'maya2008_0-docs_en_us-2008.rpm'
        'awcommon-1080-13i686.rpm'
        'awcommon-server-1080-13i68.rpm')
md5sums=('3ef50e19ab22db6301bc89531613f6cb'
         '0d3091a7786a562c9ddd3bc4cbd2f93f'
         '29a29fe99b25d5006e205e0007f36a3c'
         '1ff04c9cc79593b91fa96cadc8d6d55f')
[ "$CARCH" = "x86_64" ] && source=('maya2008_0_64-20080-134x86.rpm'
                                   'maya2008_0_64-docs_en_us-2.rpm'
                                   'awcommon-1080-15x86_64.rpm'
                                   'awcommon-server-1080-15x86.rpm')
[ "$CARCH" = "x86_64" ] && md5sums=('e0085b3c1e38b431d37cc0dd8bcfe863'
                                    'ae856d5f0f2a93887d1296ad14c4acf4'
                                    '3647012826d80c5577191d8a607365b6'
                                    '19a9160e2b7961f08aa19277f3553b84')
options=('emptydirs')
install=('maya.install')
_archext=""
[ "$CARCH" = "x86_64" ] && _archext="-x64"

build() {
  cd ${srcdir}

  msg2 "Extracting packages..."
  rpmextract.sh ${source[0]}
  rpmextract.sh ${source[1]}
  rpmextract.sh ${source[2]}
  rpmextract.sh ${source[3]}

  msg2 "Copying package data..."
  # Create necessary paths
  install -d ${pkgdir}/usr
  install -d ${pkgdir}/usr/{bin,local}
  install -d ${pkgdir}/usr/local/bin
  install -d ${pkgdir}/usr/share
  install -d ${pkgdir}/usr/share/{applications,desktop-directories,pixmaps}
  install -d ${pkgdir}/var
  install -d -m777 ${pkgdir}/var/flexlm
  install -d -m1777 ${pkgdir}/tmp
  # Copy the pkg files
  cp -R ./usr/aw ${pkgdir}/usr || return 1
  cp -R ./usr/autodesk ${pkgdir}/usr || return 1
  mv ${pkgdir}/usr/autodesk/maya${pkgver}${_archext}/desktop/Autodesk-Maya.desktop \
     ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop
  mv ${pkgdir}/usr/autodesk/maya${pkgver}${_archext}/desktop/Autodesk-Maya.directory \
     ${pkgdir}/usr/share/desktop-directories/Autodesk-Maya.directory
  mv ${pkgdir}/usr/autodesk/maya${pkgver}${_archext}/desktop/Maya.png \
     ${pkgdir}/usr/share/pixmaps/Maya.png
  # Fix broken icons and paths
  sed -i 's|Exec=/usr/autodesk/maya|Exec=/usr|g' \
          ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop
  sed -i 's|Icon=Maya.png|Icon=/usr/share/pixmaps/Maya.png|g' \
          ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop
  sed -i 's|Icon=Maya2008.png|Icon=/usr/share/pixmaps/Maya.png|g' \
          ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop

  msg2 "Creating symbolic links..."
  # Unsure if all of these are necessary
  cd ${pkgdir}/usr
  ln -s ../usr/autodesk/maya${pkgver}${_archext} maya
  cd ${pkgdir}/usr/bin
  ln -s ../../usr/autodesk/maya${pkgver}${_archext}/bin/Maya${pkgver} maya
  cd ${pkgdir}/usr/local/bin
  ln -s ../../../usr/autodesk/maya${pkgver}${_archext}/bin/fcheck fcheck
  ln -s ../../../usr/autodesk/maya${pkgver}${_archext}/bin/Maya${pkgver} maya
  ln -s ../../../usr/autodesk/maya${pkgver}${_archext}/bin/imgcvt imgcvt
  ln -s ../../../usr/autodesk/maya${pkgver}${_archext}/bin/Render Render
  cd ${pkgdir}/usr
  ln -s ../tmp tmp
}
