# Contributor: Frozen Fox <frozenfoxz@gmail.com>

pkgname=maya8.5
pkgver=8.5
pkgrel=4
pkgdesc="Professional 3d Animation"
arch=('i686' 'x86_64')
license=('Proprietary')
url="http://usa.autodesk.com/"
depends=('tcsh' 'libxp' 'libxpm' 'libxinerama')
provides=()
conflicts=()
makedepends=('rpmextract')
source=('Maya-8.5-111.i686.rpm'
        'Maya-docs_en_US-8.5-119.i686.rpm'
        'AWCommon-10.80-13.i686.rpm'
        'AWCommon-server-10.80-13.i686.rpm')
md5sums=('e5acca72e0f207638adb990f1223dc71'
         '7d355ba6ce780d0eacf485308c144345'
         '29a29fe99b25d5006e205e0007f36a3c'
         '1ff04c9cc79593b91fa96cadc8d6d55f')
[ "$CARCH" = "x86_64" ] && source=('Maya64-8.5-159.x86_64.rpm'
                                   'Maya64-docs_en_US-8.5-123.x86_64.rpm'
                                   'AWCommon-10.80-15.x86_64.rpm'
                                   'AWCommon-server-10.80-15.x86_64.rpm')
[ "$CARCH" = "x86_64" ] && md5sums=('1f055fd801fc66a4517355528da8025a'
                                    'ca71dc6d7a07dee8af3a0c7c5f859395'
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
     ${pkgdir}/usr/share/pixmaps/maya.png
  # Fix broken icons and paths
  sed -i 's|Exec=/usr/autodesk/maya|Exec=/usr|g' \
          ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop
  sed -i 's|Icon=Maya.png|Icon=/usr/share/pixmaps/maya.png|g' \
          ${pkgdir}/usr/share/applications/Autodesk-Maya.desktop
  sed -i 's|Icon=Maya85.png|Icon=/usr/share/pixmaps/maya.png|g' \
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
