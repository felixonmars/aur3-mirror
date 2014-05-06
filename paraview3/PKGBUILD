# Maintainer: Mathias Anselmann <mathias.anselmann@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michele Mocciola <mickele>
# Contributor: Simon Zilliken <simon____AT____zilliken____DOT____name>

pkgname=paraview3
pkgver=3.98.1
pkgrel=4
pkgdesc='Parallel Visualization Application using VTK'
arch=('i686' 'x86_64')
url='http://www.paraview.org'
license=('custom')
depends=('qtwebkit' 'openmpi' 'python2' 'ffmpeg-compat' 'boost' 'libcgns-paraview'
	 'expat' 'freetype2' 'hdf5' 'libjpeg' 'libxml2' 'libtheora' 'libpng' 'libtiff' 'zlib')
makedepends=('cmake' 'mesa')
optdepends=('python2-matplotlib: Needed to support equation rendering using MathText markup language'
	    'python2-numpy: Needed for using some filters such as "Python Calculator"')
changelog="paraview.changelog"
provides=('paraview')
source=("http://paraview.org/files/v3.98/ParaView-3.98.1-source.tar.gz"
	'paraview.png'
	'paraview.desktop'
	'vtkJPEGReader.patch')

build() {
  cd "${srcdir}/ParaView-${pkgver}-source"

  #source /home/martin/devel/PKGBUILDS/salome/env.sh
  patch -p0 < "${srcdir}/vtkJPEGReader.patch"
  
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"
  
  # flags to enable system libs
  # add PROTOBUF when http://www.vtk.org/Bug/view.php?id=13656 gets fixed
  local cmake_system_flags=""
  for lib in EXPAT FREETYPE HDF5 JPEG LIBXML2 OGGTHEORA PNG TIFF ZLIB; do
    cmake_system_flags+="-DVTK_USE_SYSTEM_${lib}:BOOL=ON "
  done

   # flags to use python2 instead of python which is 3.x.x on archlinux
   local cmake_system_python_flags="-DPYTHON_EXECUTABLE:PATH=/usr/bin/python2 \
   	 -DPYTHON_INCLUDE_DIR:PATH=/usr/include/python2.7 -DPYTHON_LIBRARY:PATH=/usr/lib/libpython2.7.so"

   # flags to use ffmpeg-compat instead of ffmpeg until
   # http://paraview.org/Bug/view.php?id=14215 gets fixed
   local ffmpeg_compat_flags="-DFFMPEG_INCLUDE_DIR:PATH=/usr/include/ffmpeg-compat \
   	 -DFFMPEG_avcodec_LIBRARY=/usr/lib/ffmpeg-compat/libavcodec.so \
   	 -DFFMPEG_avformat_LIBRARY=/usr/lib/ffmpeg-compat/libavformat.so \
   	 -DFFMPEG_avutil_LIBRARY=/usr/lib/ffmpeg-compat/libavutil.so \
   	 -DFFMPEG_swscale_LIBRARY=/usr/lib/ffmpeg-compat/libswscale.so"

   # enable when http://paraview.org/Bug/view.php?id=12852 gets fixed:
   #-DCMAKE_SKIP_RPATH:BOOL=YES \
   cmake \
   -DBUILD_SHARED_LIBS:BOOL=ON \
   -DCMAKE_BUILD_TYPE=Release \
   -DCMAKE_C_COMPILER=/usr/bin/mpicc \
   -DCMAKE_CXX_COMPILER=/usr/bin/mpicxx \
   -DCMAKE_INSTALL_PREFIX:PATH=/usr \
   -DCMAKE_VERBOSE_MAKEFILE:BOOL=OFF \
   -DPARAVIEW_ENABLE_FFMPEG:BOOL=ON \
   -DPARAVIEW_ENABLE_PYTHON:BOOL=ON \
   -DVTK_Group_Imaging:BOOL=OFF \
   -DVTK_Group_MPI:BOOL=ON \
   -DVTK_Group_CoProcessing:BOOL=OFF \
   -DVTK_Group_ParaView:BOOL=ON \
   -DVTK_Group_ParaViewCore:BOOL=ON \
   -DVTK_Group_ParaViewPython:BOOL=ON \
   -DVTK_Group_ParaViewQt:BOOL=ON \
   -DVTK_Group_ParaViewRendering:BOOL=ON \
   -DVTK_Group_Qt:BOOL=ON \
   -DVTK_Group_Views:BOOL=ON \
   -DPARAVIEW_USE_MPI:BOOL=ON \
   -DPARAVIEW_USE_VISITBRIDGE:BOOL=ON \
   -DQT_HELP_GENERATOR:FILEPATH=/usr/lib/qt4/bin/qhelpgenerator \
   -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
   -DVISIT_BUILD_READER_CGNS:BOOL=ON \
   -DBUILD_DOCUMENTATION:BOOL=ON \
   -DPARAVIEW_INSTALL_DEVELOPMENT_FILES:BOOL=ON \
   -DQT_TESTING_INSTALL_DEVELOPMENT:BOOL=ON \
   -DVTK_WRAP_TCL:BOOL=OFF \
   -DVTK_WRAP_PYTHON:BOOL=ON \
   -DBUILD_TESTING:BOOL=ON \
   ${cmake_system_flags} \
   ${cmake_system_python_flags} \
   ${ffmpeg_compat_flags} \
   ../ParaView-${pkgver}-source

   make
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install

  #Install license
  install -Dm644 "${srcdir}/ParaView-${pkgver}-source/License_v1.2.txt" "${pkgdir}/usr/share/licenses/paraview/LICENSE"
  
  # Install missing vtk file
  install -Dm644 "${srcdir}/build/VTK/VTKTargets.cmake" "${pkgdir}/usr/lib/cmake/paraview-${pkgver:0:-2}/VTKTargets.cmake"
  install -Dm644 "${srcdir}/ParaView-${pkgver}-source/VTK/CMake/TopologicalSort.cmake" "${pkgdir}/usr/lib/cmake/paraview-${pkgver:0:-2}/TopologicalSort.cmake"
  install -Dm644 "${srcdir}/ParaView-${pkgver}-source/Qt/Components/pqViewFrameActionGroup.h" "${pkgdir}/usr/include/paraview-${pkgver:0:-2}/pqViewFrameActionGroup.h"


  #Install desktop shortcuts
  install -Dm644 "${srcdir}/paraview.png" "${pkgdir}/usr/share/pixmaps/paraview.png"
  desktop-file-install --dir="${pkgdir}"/usr/share/applications "${srcdir}/paraview.desktop"
}
sha1sums=('f59dd55b295c804aa3bb75c6ab19b323ef80d861'
          'a2dff014e1235dfaa93cd523286f9c97601d3bbc'
          '1f94c8ff79bb2bd2c02d6b403ea1f4599616531b'
          '6465dd8362748566bd8698a457301a1f2e2bf74b')
