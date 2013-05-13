# Maintainer: J.J. Oomkes <jeruntu at gmail dot com>
# ----------------------
# This package is intended as a replacement for the Halcon installation script.
# It adds to the default installation a .desktop, icons, and mimetype
# ----------------------
# BUILD INSTRUCTIONS:
# You need to download the files listed in the source=() array from the MVTec website. 
# Register (for free) at the MVTec website in order to download the files. 
# Place the downloaded tarball(s) in the same directory as this PKGBUILD file, then run makepkg.
# Copy a license (*.dat) and put it in /opt/${pkgname}/${pkgname}-${pkgver}

pkgname=halcon
pkgver=11.0.1
pkgrel=1
pkgdesc="Machine vision library with an integrated development environment (IDE)"
arch=('i686' 'x86_64')
url="http://www.mvtec.com/"
license=('custom')
depends=('shared-mime-info' 'xdg-utils' 'hicolor-icon-theme')
makedepends=('imagemagick')
PKGEXT='.pkg.tar'
options=('!strip' '!upx')
install=$pkgname.install

if [ "$CARCH" = "i686" ]; then
    _arch="x86sse2-linux2.4-gcc40"
    _notarch="x64-linux2.4-gcc40"
elif [ "$CARCH" = "x86_64" ]; then
    _arch="x64-linux2.4-gcc40"
    _notarch="x86sse2-linux2.4-gcc40"
fi

source=('halcon-11.0.1-linux.tar.gz'
	'halcon-11.0.1-images.tar.gz'
	'halcon.desktop'
	'halcon.png'
	'halcon.xml')
md5sums=('3a15b6a3e765d68856e2bda291dd5fb6'
         '0da679588b7f0a45aa0d5207da61f2be'
         '13568831c9b7f84510319556f6358e2b'
         '527fcfe8e59ac82691735e25483a0f76'
         'c77f2a00021c5233c17ed1315b6e6907')

package() {    
  # Install all directories and filter files which are unnecessary 
  _destdir="${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}"
  
  mkdir -p $_destdir/bin
  find "$srcdir"/bin -mindepth 1 -type d ! -name $_notarch -exec cp -r {} $_destdir/bin \;
 
  cp -r "$srcdir"/calib $_destdir/calib
  
  # Install the documentation in local language if possible
  msg2 "Available documentation languages: English, German, Japanese"
  msg2 "Install language as set in /etc/locale.conf: ${LANG} when available"
  if [ ${LANG:0:2} == "de" ]; then
    msg2 "German documentation will be installed"
    cp -r "$srcdir"/doc $_destdir/doc_de_DE
  elif [ ${LANG:0:2} == "ja" ]; then
    msg2 "Japanese documentation will be installed"
    cp -r "$srcdir"/doc $_destdir/doc_ja_JP
  else
    msg2 "(Default) English documentation will be installed"
    cp -r "$srcdir"/doc $_destdir/doc
  fi
  
  # Select every example dir one by one
  mkdir -p $_destdir/examples
  cp -r "$srcdir"/examples/3d_models $_destdir/examples/3d_models
  cp -r "$srcdir"/examples/c $_destdir/examples/c
  cp -r "$srcdir"/examples/c# $_destdir/examples/c#
  cp -r "$srcdir"/examples/codelets $_destdir/examples/codelets
  cp -r "$srcdir"/examples/cpp $_destdir/examples/cpp
  cp -r "$srcdir"/examples/extension_package $_destdir/examples/extension_package
  cp -r "$srcdir"/examples/hdevelop $_destdir/examples/hdevelop
  cp -r "$srcdir"/examples/hdevengine $_destdir/examples/hdevengine
  cp -r "$srcdir"/examples/ia_integration $_destdir/examples/ia_integration
  cp -r "$srcdir"/examples/images $_destdir/examples/images
  cp -r "$srcdir"/examples/solution_guide $_destdir/examples/solution_guide
  
  cp -r "$srcdir"/filter $_destdir/filter
  
  mkdir -p $_destdir/FLEXlm
  cp -r "$srcdir"/FLEXlm/${_arch:0:3}* $_destdir/FLEXlm
  
  cp -r "$srcdir"/help $_destdir/help
  
  # Copy all files except the undesired $CARCH in /genicam/bin
  mkdir -p $_destdir/genicam/bin
  find "$srcdir"/genicam -mindepth 1 -maxdepth 1 ! -name bin -exec cp -r {} $_destdir/genicam \;
  cp -r "$srcdir"/genicam/bin/*${_arch:0:3} $_destdir/genicam/bin
  
  # Copy everything except for com directory
  mkdir -p $_destdir/include
  find "$srcdir"/include -mindepth 1 -type d ! -name com -exec cp -r {} $_destdir/include \;
  find "$srcdir"/include -mindepth 1 -maxdepth 1 -type f -exec cp -r {} $_destdir/include \;
  
  # Copy only the disired $CARCH lib
  mkdir -p $_destdir/lib
  cp -r "$srcdir"/lib/$_arch* $_destdir/lib
  
  cp -r "$srcdir"/license $_destdir/license
  cp -r "$srcdir"/lut $_destdir/lut
  cp -r "$srcdir"/ocr $_destdir/ocr
  cp -r "$srcdir"/procedures $_destdir/procedures
  
  # Install all files which are not in sub directories except for the installation script
  find "$srcdir" -maxdepth 1 -type f ! -name *.sh -exec cp {} $_destdir \;
  
  # Create bash script which sets session specific environment variables 
  msg2 "Create bash script which sets environment variables"
  ld_lib="LD_LIBRARY_PATH"
  {
  echo "#!/usr/bin/bash"
  echo "HALCONARCH=\"$_arch\"; export HALCONARCH"
  echo "HALCONROOT=\"/opt/${pkgname}/${pkgname}-${pkgver}\"; export HALCONROOT"
  echo "HALCONEXAMPLES=\"\${HALCONROOT}/examples\"; export HALCONEXAMPLES"
  echo "HALCONIMAGES=\"\${HALCONROOT}/examples/images\"; export HALCONIMAGES"
  echo "PATH=\"\${HALCONROOT}/bin/\${HALCONARCH}:\${HALCONROOT}/FLEXlm/\${HALCONARCH}:\${PATH}\"; export PATH"
  echo "if [ \"\${$ld_lib}\" ] ; then"
  echo "  $ld_lib=\"\${HALCONROOT}/lib/\${HALCONARCH}:\${$ld_lib}\"; export ${ld_lib}"
  echo "else"
  echo "  $ld_lib=\"\${HALCONROOT}/lib/\${HALCONARCH}\"; export ${ld_lib}"
  echo "fi"
  echo "/opt/${pkgname}/${pkgname}-${pkgver}/bin/${_arch}/hdevelop"
  } > "$_destdir/profile_halcon"
  chmod 755 "$_destdir/profile_halcon"
  
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}-${pkgver}/profile_halcon" "${pkgdir}/usr/bin/halcon"
  
  # Install .desktop, icon and mime-type
  msg2 "Install .desktop, icons and mime-type"
  install -Dm644 "$srcdir"/halcon.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "$srcdir"/halcon.png "${pkgdir}"/usr/share/icons/${pkgname}.png
  install -Dm644 ${pkgname}.xml "${pkgdir}"/usr/share/mime/packages/${pkgname}.xml
  
  _iname="application-x-hdevelop" 
  for i in 16 22 24 32 48 64 72 96 128; do
    convert 2>/dev/null -background none -resize ${i}x${i} ${pkgname}.png _${pkgname}.png
    install -Dm644 _${pkgname}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/${_iname}.png"
  done
  
  # Install 
  install -D -m644 "$srcdir"/eula.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  msg2 "Installation complete"
  msg2 "Copy your license *.dat to /opt/${pkgname}/${pkgname}-${pkgver}/license"
}

# vim: set ts=2 sw=2 ft=sh noet: