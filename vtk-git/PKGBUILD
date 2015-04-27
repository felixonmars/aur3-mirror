# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

#http://vtk.org/gitweb

_gitname='VTK'
#_gitbranch="release" #Maintenance of latest release
_gitbranch="master" #Development

pkgname=vtk-git
pkgver=6.2.0.r595.gaf02b2f
pkgrel=1
pkgdesc='A software system for 3D computer graphics, image processing, and visualization.'
arch=('i686' 'x86_64')
url='http://www.vtk.org/'
license=('BSD')
options=(!strip staticlibs)
conflicts=('vtk')
provides=('vtk')
depends=('libjpeg-turbo' 'boost'
         'ffmpeg' 'qt4' 'lesstif'
         'mariadb' 'gdal' 'glu'
         'libgl' 'gl2ps' 'netcdf-fortran'
         'netcdf-cxx-legacy'
         'jsoncpp' 'openmpi'
         'qtwebkit' 'java-environment')
makedepends=('cmake' 'git' 'java-environment' 
             'doxygen' 'gnuplot' 'tk' 'wget'
             'python2-matplotlib' 'python2-twisted')
optdepends=('python2: python bindings'
            'java-runtime: java bindings'
            'tk: tcl bindings'
            'gnuplot: plotting tools'
            'graphviz: drawing tools'
            'python2-matplotlib: for Matplotlib rendering'
            'python2-twisted: for vtkWeb')
source=("VTK::git+http://gitlab.kitware.com/vtk/vtk.git#branch=${_gitbranch}"
        "VTKData::git://vtk.org/${_gitname}Data.git#branch=${_gitbranch}")
sha256sums=('SKIP'
            'SKIP')

pkgver()
{
  cd "$srcdir/VTK"
  if [ $_gitbranch == "release" ]; then
    git describe --tags | sed -E 's|([^-]*-g)|r\1|;s|-|.|g;s|v||g'
  else
    git describe --long | sed -E 's|([^-]*-g)|r\1|;s|-|.|g;s|v||g'
  fi
}

prepare()
{
  # clearing old building directory...
  rm -rf "${srcdir}/${pkgname}-build"
  mkdir  "${srcdir}/${pkgname}-build"
}

build()
{
  cd "${srcdir}/${pkgname}-build"

  # Cache for external data needed during compilation
  mkdir -p "${srcdir}/ExternalData"

  export JAVA_HOME="/usr/lib/jvm/default"

  # NOTE: -DVTK_USE_SYSTEM_LIBPROJ4=OFF because vtk still
  #       uses the old v4.3 api. add 'proj' to depends
  #       when the issue is fixed.

  cmake "${srcdir}/VTK" \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DVTK_DATA_STORE="${srcdir}/VTKData" \
    -DExternalData_OBJECT_STORES="${srcdir}/ExternalData" \
    -DCMAKE_CXX_FLAGS="-D__STDC_CONSTANT_MACROS" \
    -DCMAKE_C_COMPILER=mpicc \
    -DCMAKE_CXX_COMPILER=mpicxx \
    -DCMAKE_BUILD_TYPE="Release" \
    -DVTK_USE_LARGE_DATA=OFF \
    -DVTK_USE_SYSTEM_EXPAT=ON \
    -DVTK_USE_SYSTEM_FREETYPE=ON \
    -DVTK_USE_SYSTEM_GL2PS=ON \
    -DVTK_USE_SYSTEM_HDF5=ON \
    -DVTK_USE_SYSTEM_JPEG=ON \
    -DVTK_USE_SYSTEM_LIBXML2=ON \
    -DVTK_USE_SYSTEM_LIBRARIES=ON \
    -DVTK_USE_SYSTEM_LIBPROJ4=OFF \
    -DVTK_USE_SYSTEM_PNG=ON \
    -DVTK_USE_SYSTEM_TIFF=ON \
    -DVTK_USE_SYSTEM_TWISTED=ON \
    -DVTK_USE_SYSTEM_ZLIB=ON \
    -DVTK_USE_SYSTEM_JSONCPP=ON \
    -DVTK_USE_SYSTEM_XDMF2=OFF \
    -DNETCDF_CXX_INCLUDE_DIR=/usr/include/ \
    -DNETCDF_CXX_LIBRARY=/usr/lib/libnetcdf_c++.so \
    -DLIBPROJ4_INCLUDE_DIR=/usr/include/ \
    -DLIBPROJ4_LIBRARIES=/usr/lib/libproj.so \
    -Dxdmf2_DIR=/usr/lib/XdmfCMake/ \
    -Dxdmf3_DIR=/usr/lib/cmake/xdfm3 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_DOCUMENTATION=ON \
    -DDOCUMENTATION_HTML_HELP=ON \
    -DDOCUMENTATION_HTML_TARZ=ON \
    -DBUILD_EXAMPLES=ON \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python2.7 \
    -DPYTHON_LIBRARY=/usr/lib/libpython2.7.so \
    -DPYTHON_UTIL_LIBRARY=/usr/lib/libutil.so \
    -DModule_vtkAcceleratorsDax=OFF \
    -DModule_vtkAcceleratorsPiston=OFF \
    -DModule_vtkDomainsChemistryOpenGL2=OFF \
    -DModule_vtkFiltersMatlab=OFF \
    -DModule_vtkFiltersParallelFlowPaths=ON \
    -DModule_vtkFiltersParallelStatistics=ON \
    -DModule_vtkFiltersReebGraph=OFF \
    -DModule_vtkFiltersStatisticsGnuR=OFF \
    -DModule_vtkIOADIOS=OFF \
    -DModule_vtkIOFFMPEG=ON \
    -DModule_vtkIOGDAL=ON \
    -DModule_vtkIOGeoJSON=OFF \
    -DModule_vtkIOMySQL=OFF \
    -DModule_vtkIOODBC=OFF \
    -DModule_vtkIOParallelExodus=ON \
    -DModule_vtkIOParallelLSDyna=ON \
    -DModule_vtkIOPostgreSQL=ON \
    -DModule_vtkIOVPIC=ON \
    -DModule_vtkIOXdmf2=ON \
    -DModule_vtkIOXdmf3=OFF \
    -DModule_vtkInfovisBoost=OFF \
    -DModule_vtkInfovisBoostGraphAlgorithms=OFF \
    -DModule_vtkInfovisParallel=OFF \
    -DModule_vtkPythonInterpreter=ON \
    -DModule_vtkRenderingContextOpenGL2=OFF \
    -DModule_vtkRenderingFreeTypeFontConfig=OFF \
    -DModule_vtkRenderingFreeTypeOpenGL2=OFF \
    -DModule_vtkRenderingMatplotlib=ON \
    -DModule_vtkRenderingOpenGL2=OFF \
    -DModule_vtkRenderingParallel=ON \
    -DModule_vtkRenderingParallelLIC=ON \
    -DModule_vtkRenderingVolumeAMR=ON \
    -DModule_vtkRenderingVolumeOpenGL2=OFF \
    -DModule_vtkRenderingVolumeOpenGLNew=OFF \
    -DModule_vtkVPIC=OFF \
    -DModule_vtkWebApplications=OFF \
    -DModule_vtkWebCore=OFF \
    -DModule_vtkWebGLExporter=ON \
    -DModule_vtkWebInstall=OFF \
    -DModule_vtkWebJavaScript=OFF \
    -DModule_vtkWebPython=OFF \
    -DModule_vtkWrappingJava=ON \
    -DModule_vtkWrappingPythonCore=ON \
    -DModule_vtkWrappingTcl=ON \
    -DModule_vtkglew=OFF \
    -DModule_vtkxdmf2=OFF \
    -DModule_vtkxdmf3=OFF \
    -DVTK_USE_FFMPEG_ENCODER=ON \
    -DVTK_USE_TK=ON \
    -DVTK_USE_X=ON \
    -DVTK_WRAP_JAVA=ON \
    -DVTK_WRAP_PYTHON=ON \
    -DVTK_WRAP_TCL=ON \
    -DVTK_TCL_TK_STATIC=ON \
    -DVTK_Group_Imaging=ON \
    -DVTK_Group_Qt=ON \
    -DVTK_Group_Rendering=ON \
    -DVTK_Group_StandAlone=ON \
    -DVTK_Group_Tk=ON \
    -DVTK_Group_Views=ON \
    -DVTK_Group_MPI=ON \
    -DVTK_Group_Web=OFF \
    -Wno-dev

  make ${MAKEFLAGS}

  echo "export VTK_DATA_ROOT=/usr/share/vtk/VTKData" > vtk.sh
  echo "export VTK_ROOT_DIR=/usr" >> vtk.sh
}

package()
{
  cd "${srcdir}/${pkgname}-build"

  make DESTDIR="${pkgdir}" install

  for subd in $(find $pkgdir/usr/lib/tcltk -maxdepth 1 -type d -name "vtk*")
  do
    echo "export TCLLIBPATH=\"\${TCLLIBPATH} /usr/lib/tcltk/$(basename $subd)\"" \
      >> vtk.sh
  done

  install -dv "${pkgdir}/usr/share/vtk/VTKData"
  install -dv "${pkgdir}/usr/share/java/vtk"

  mv -v "${pkgdir}/usr/lib/vtk.jar" "${pkgdir}/usr/share/java/vtk"

  mkdir -p "${pkgdir}/usr/lib/qt4/plugins/designer/"
  mv -v "${pkgdir}/usr/plugins/designer/libQVTKWidgetPlugin.so" "${pkgdir}/usr/lib/qt4/plugins/designer/libQVTKWidgetPlugin.so"
  rm -r "${pkgdir}/usr/plugins/"

  cp -dpr --no-preserve=ownership -f "${srcdir}/VTKData/Data" \
      "${pkgdir}/usr/share/vtk/VTKData/Data"

  install -Dm644 "${srcdir}/VTK/Copyright.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/Copyright.txt"

  install -Dm644 "${srcdir}/VTKData/Copyright.txt" \
      "${pkgdir}/usr/share/licenses/${pkgname}/Copyright-Data.txt"

  install -Dm755 "${srcdir}/$pkgname-build/vtk.sh" \
      "$pkgdir/etc/profile.d/vtk.sh"

  find "${pkgdir}" \
    -type f \
    -exec /usr/bin/sed \
      -e "s|#![ ]*/usr/bin/env[ ]+python[ ]*$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/usr/bin/python[ ]*$|#!/usr/bin/python2|" \
      -i '{}'\
  \;
}
