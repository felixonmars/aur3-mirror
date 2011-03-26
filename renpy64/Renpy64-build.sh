#!/bin/sh
BUILD_DIR="/tmp/renpy64"
FILE_RUNTIME="renpy-6.10.2-sdk.tar.bz2"
FILE_DEPS="renpy-deps-6.10.1.tar.bz2"

RENPY_LATEST="/tmp/renpy64/renpy-6.10.2"
RENPY_DEPS="/tmp/renpy64/renpy-deps"

_runtime64="/tmp/renpy64/renpy-6.10.2/lib/linux-x86_64"
_python64="/tmp/renpy64/renpy-6.10.2/lib/linux-x86_64/lib/python2.5"

_runtime32="/tmp/renpy64/renpy-6.10.2/lib/linux-x86"

_runtime64new="/tmp/renpy64/renpy-deps/install"
_python64new="/tmp/renpy64/renpy-deps/install/lib/python2.5"

clear

usage() {
         echo -e "Usage: $0 [-j|--with-jedit] || [-s|--with-scite] [-a|--with-all]\n"
         echo "OPTIONS:"
         echo "    -j  built-in jEdit editor (depends on 'java-runtime')"
         echo "    -s  built-in SciTE editor (depends on 'gtk2')"
         echo "    -a  built-in both editors"
         echo ""
         echo "EXAMPLE:"
         echo "    $0 --with-jedit"
         echo ""
}

if [ "$1" == "" ]; then
  usage
  exit 0
fi

while [ "$1" != "" ]; do
   case "$1" in
      --with-all|-a)
         WITH_JEDIT="true"
         WITH_SCITE="true"
         shift
         ;;
      --with-jedit|-j)
         WITH_JEDIT="true"
         WITH_SCITE="false"
         shift
         ;;
      --with-scite|-s)
         WITH_JEDIT="false"
         WITH_SCITE="true"
         shift
         ;;
      *)
         usage
         exit 1
         ;;
   esac
done

echo -e "Building renpy 6.10.2-3 with Linux x86_64 support patch\n"

cd ${BUILD_DIR}
echo -e "Decompressing renpy source...\n"
tar jxvf ${FILE_RUNTIME} > /dev/null 2>&1 || exit 1
echo -e "Decompressing renpy dependencies source...\n"
tar jxvf ${FILE_DEPS} > /dev/null 2>&1 || exit 1

cd ${RENPY_DEPS}
echo -e "Applying x86_64 build patches..."
patch -p0 < ${BUILD_DIR}/Renpy-build_python.patch || exit 1
patch -p0 < ${BUILD_DIR}/Renpy-build.patch || exit 1
echo -e "\nBuilding python...\n(This may take several minutes)\n"
./build_python.sh > /dev/null 2>&1 || exit 1
echo -e "Building dependencies...\n(This may take several minutes)\n"
./build.sh > /dev/null 2>&1 || exit 1

cd ${RENPY_LATEST}/lib
echo -e "Applying x86_64 renpy patches..."
patch -p0 < ${BUILD_DIR}/Renpy-python-x86_64.patch || exit 1
cd ${RENPY_LATEST}/launcher
patch -p0 -R < ${BUILD_DIR}/Renpy-distribute-x86_64.patch || exit 1

###########################################
## FIXME: Need patch for new game folder ##
###########################################

source ${RENPY_DEPS}/env.sh || exit 1
cd ${RENPY_LATEST}/module
echo -e "\nBuilding py4renpy...\n"
python setup.py install_lib -d $PYTHONPATH > /dev/null 2>&1 || exit 1

echo -e "Copying Ren'Py x86_64 runtime...\n"
cp -Rf ${_runtime32} ${_runtime64} > /dev/null 2>&1 || exit 1
rm -Rf ${_python64}/_md5.so ${_python64}/_sha.so  ${_python64}/_sha256.so  ${_python64}/_sha512.so > /dev/null 2>&1 || exit 1

cp -Rf ${BUILD_DIR}/scale.py ${RENPY_LATEST}/renpy/display/scale.py > /dev/null 2>&1 || exit 1

cp -Rf ${_runtime64new}/bin/python ${_runtime64}/python.real || exit 1

cp -Rf ${_runtime64new}/lib/libavcodec.so.52.20.0 ${_runtime64}/lib/libavcodec.so.52 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libavformat.so.52.31.0 ${_runtime64}/lib/libavformat.so.52 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libavutil.so.49.15.0 ${_runtime64}/lib/libavutil.so.49 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libfreetype.so.6.3.22 ${_runtime64}/lib/libfreetype.so.6 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libfribidi.so.0.3.1 ${_runtime64}/lib/libfribidi.so.0 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libpython2.5.so.1.0 ${_runtime64}/lib/libpython2.5.so.1.0 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libSDL-1.2.so.0.11.2 ${_runtime64}/lib/libSDL-1.2.so.0 > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/lib/libSDL_ttf-2.0.so.0.6.2 ${_runtime64}/lib/libSDL_ttf-2.0.so.0 > /dev/null 2>&1 || exit 1

cp -Rf ${_python64new}/lib-dynload/_hashlib.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/ossaudiodev.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/pyexpat.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/zlib.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_socket.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/cPickle.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/cStringIO.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/parser.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/binascii.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/select.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/fcntl.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/grp.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/operator.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_bisect.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_heapq.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/collections.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/itertools.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/datetime.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_random.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/time.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/strop.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/math.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/array.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_ctypes.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_weakref.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/_struct.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_python64new}/lib-dynload/bz2.so ${_python64} > /dev/null 2>&1 || exit 1

cp -Rf ${_runtime64new}/python/_renpy.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/_renpy_font.so ${_python64} > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/_renpybidi.so ${_python64} > /dev/null 2>&1 || exit 1

cp -Rf ${_runtime64new}/python/pygame/base.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/cdrom.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/color.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/constants.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/display.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/draw.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/event.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/fastevent.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/font.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/imageext.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/image.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/joystick.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/key.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/mask.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/mouse.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/overlay.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/pixelarray.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/rect.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/rwobject.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/surface.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/surflock.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/time.so ${_python64}/pygame > /dev/null 2>&1 || exit 1
cp -Rf ${_runtime64new}/python/pygame/transform.so ${_python64}/pygame > /dev/null 2>&1 || exit 1

cp -Rf ${_runtime64new}/python/pysdlsound/sound.so ${_python64}/pysdlsound > /dev/null 2>&1 || exit 1

mkdir -p ${BUILD_DIR}/PACKAGE/usr/share/renpy64
mkdir -p ${BUILD_DIR}/PACKAGE/usr/bin

if [ "${WITH_JEDIT}" == "false" ]; then
  echo -e "Removing Ren'py jEdit support...\n"
  rm -rf ${RENPY_LATEST}/jedit
else
  echo -e "Adding Ren'py jEdit support...\n"
fi

if [ "${WITH_SCITE}" == "true" ]; then
  echo -e "Copying Ren'py SciTE support...\n"
  cd ${RENPY_LATEST}
  bsdtar -x -f ${BUILD_DIR}/scite-renpy-20090803.zip > /dev/null 2>&1 || exit 1

  echo -e "Decompressing SciTE 2.11 source...\n"
  mkdir -p ${BUILD_DIR}/scite-x86_64
  mkdir -p ${BUILD_DIR}/scite-x86_64/build
  cd ${BUILD_DIR}/scite-x86_64
  tar xzvf ${BUILD_DIR}/scite211.tgz > /dev/null 2>&1 || exit 1

  echo -e "Building SciTE 2.11 for x86_64...\n"
  cd ${BUILD_DIR}/scite-x86_64/scintilla/gtk
  make > /dev/null 2>&1 || exit 1
  cd ${BUILD_DIR}/scite-x86_64/scite/gtk
  make prefix=${BUILD_DIR}/scite-x86_64/build > /dev/null 2>&1 || exit 1
  make install prefix=${BUILD_DIR}/scite-x86_64/build > /dev/null 2>&1 || exit 1

  echo -e "Copying SciTE x86_64 support...\n"
  cp -rf ${BUILD_DIR}/scite-x86_64/build/bin/SciTE ${RENPY_LATEST}/scite/scite.linux-x86_64
fi

echo -e "Copying renpy64 files...\n"
cp -fr ${RENPY_LATEST}/* ${BUILD_DIR}/PACKAGE/usr/share/renpy64 > /dev/null 2>&1 || exit 1

echo -e "Cleaning up temp files...\n"
rm -rf ${BUILD_DIR}/renpy-6.10.2 ${BUILD_DIR}/renpy-deps ${BUILD_DIR}/scite-x86_64

echo -e "Writing renpy64 wrapper...\n"
echo "if [ -d ~/renpy_projects ]; then
echo 'The renpy_projects is already existing, using it.'
else
mkdir ~/renpy_projects
fi
cd ~/renpy_projects
/usr/share/renpy64/renpy.sh || zenity --error --text="There were an error while trying to run renpy64.\nRun "renpy64" in a terminal to see output.\n\nIf you updated core parts of your system, you\nmay need to recompile renpy64."
" > ${BUILD_DIR}/PACKAGE/usr/bin/renpy64

chmod +x ${BUILD_DIR}/PACKAGE/usr/bin/renpy64

echo -e "Adding renpy64 desktop files...\n"
mkdir -p ${BUILD_DIR}/PACKAGE/usr/share/pixmaps
cp ${BUILD_DIR}/renpy_logo.png ${BUILD_DIR}/PACKAGE/usr/share/pixmaps/renpy64.png
install -D -m644 ${BUILD_DIR}/renpy64.desktop ${BUILD_DIR}/PACKAGE/usr/share/applications/renpy64.desktop

cd ${BUILD_DIR}
echo -e "Building renpy64 source package...\n"
tar jcvf renpy64-6.10.2-3.source.tar.bz2 PACKAGE > /dev/null 2>&1 || exit 1
rm -Rf ${BUILD_DIR}/PACKAGE > /dev/null 2>&1 || exit 1

SOURCE_MD5SUM=`md5sum renpy64-6.10.2-3.source.tar.bz2 | cut -b1-32`

cat > "${BUILD_DIR}/PKGBUILD" << 'EOF'
#Contributor: Franz Rogar <franzrogar at gmail dot com>
pkgname=renpy64
pkgver=6.10.2
pkgrel=3
pkgdesc="A free and cross-platform engine that helps you use words, pictures, and sounds to tell stories with the computer."
arch=('any')
url="http://www.renpy.org"
license=('MIT')
EOF

if [ "${WITH_JEDIT}" == "true" ]; then
  cat >> "${BUILD_DIR}/PKGBUILD" << 'EOF'
depends=('java-runtime' 'zenity')
EOF
elif [ "${WITH_SCITE}" == "true" ]; then
  cat >> "${BUILD_DIR}/PKGBUILD" << 'EOF'
depends=('zenity' 'gtk2')
EOF
else
  cat >> "${BUILD_DIR}/PKGBUILD" << 'EOF'
depends=('java-runtime' 'zenity' 'gtk2')
EOF
fi

cat >> "${BUILD_DIR}/PKGBUILD" << EOF
source=('renpy64-6.10.2-3.source.tar.bz2')
md5sums=('${SOURCE_MD5SUM}')

EOF

cat >> "${BUILD_DIR}/PKGBUILD" << 'EOF'
build() {
  cp -Rf $srcdir/PACKAGE/* ${pkgdir} || exit 1
}
EOF

echo -e "Building renpy64 6.10.2-3 package...\n"
makepkg -s

echo -e "Cleaning up temp files...\n"
rm -rf ${BUILD_DIR}/pkg ${BUILD_DIR}/src ${BUILD_DIR}/*.desktop \
       ${BUILD_DIR}/*.patch ${BUILD_DIR}/*.png ${BUILD_DIR}/*.sh \
       ${BUILD_DIR}/renpy-6.10.2-sdk.tar.bz2 ${BUILD_DIR}/PKGBUILD \
       ${BUILD_DIR}/renpy-deps-6.10.1.tar.bz2 ${BUILD_DIR}/*.py \
       ${BUILD_DIR}/renpy64-6.10.2-3.source.tar.bz2 ${BUILD_DIR}/*.zip \
       ${BUILD_DIR}/*.tgz ${BUILD_DIR}/ChangeLog

