# Maintainer: sesc <sesc at unibw dot de>
# Contributor: Sebastian Schneider <sesc at unibw dot de>
# Contributor: Thorsten Luettel <thorsten.luettel at unibw dot de>

pkgname=ros-electric-ros-base
pkgver=1.0.0
pkgrel=5
pkgdesc="The Robot Operating System (ROS) base system"
url="http://www.ros.org"
arch=('x86_64')
license=('BSD')
install=${pkgname}.install
#we need boost-1.46, but let's try a newer version
depends=('python2-yaml' 'cmake' 'subversion' 'boost' 'boost-libs' 'log4cxx')
source=('http://packages.ros.org/ros/ubuntu/pool/main/r/ros-electric-ros-base/ros-electric-ros-base_1.0.0-s1328581685~oneiric_amd64.deb' \
	'http://packages.ros.org/ros/ubuntu/pool/main/r/ros-electric-common-rosdeps/ros-electric-common-rosdeps_1.0.2-s1328509597~oneiric_amd64.deb' \
	'http://packages.ros.org/ros/ubuntu/pool/main/r/ros-electric-ros/ros-electric-ros_1.6.8-s1328287473~oneiric_amd64.deb' \
	'http://packages.ros.org/ros/ubuntu/pool/main/r/ros-electric-ros-comm/ros-electric-ros-comm_1.6.6-s1328299450~oneiric_amd64.deb' \
	'arch.py.patch' \
	'installers.py.patch'
	)

build() {
  cd "${srcdir}"

  msg "Extracting *.tar.gz files from *.deb files..."
  for i in *.deb; do
    ar xv "$i" control.tar.gz data.tar.gz
    mv control.tar.gz "$i-control.tar.gz"
    mv data.tar.gz "$i-data.tar.gz"
  done
}

package() {
  cd "${pkgdir}"

  msg "Unpacking *.tar.gz files..."
  for i in "${srcdir}"/*.tar.gz; do
    tar -zxf "$i"
  done

  # apply the patches needed for rosdep to work on arch (this won't be
  # necessary for newer versions of ROS, since the patch seems to be included
  # according to ticket 3700, https://code.ros.org/trac/ros/ticket/3700
  msg "Patching sources..."
  set CURR_DIR=$PWD
  cd $pkgdir/opt/ros/electric/ros/tools/rosdep/src/rosdep/
  patch -p0 -i $srcdir/arch.py.patch
  patch -p0 -i $srcdir/installers.py.patch
  cd $CURR_DIR
  unset $CURR_DIR

  msg "Changing python to python2..."
  # ROS electric only works with python2, so go through all *.py files in
  # $pkgdir and replace '#!/usr/bin/python' with '#!/usr/bin/python2'
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(grep -iRIl -e "/usr/bin/env python" -e "usr/bin/python" $pkgdir/)

  # ROS needs boost-1.46.1, but instead of blocking newer boost version,
  # we hope a few symlinks will do.
  msg "Creating symlinks for boost, db, and gdbm..."
  mkdir -p "${pkgdir}/usr/lib/"
  ln -s /usr/lib/libboost_chrono.so "${pkgdir}/usr/lib/libboost_chrono.so.1.46.1"
  ln -s /usr/lib/libboost_date_time.so "${pkgdir}/usr/lib/libboost_date_time.so.1.46.1"
  ln -s /usr/lib/libboost_filesystem.so "${pkgdir}/usr/lib/libboost_filesystem.so.1.46.1"
  ln -s /usr/lib/libboost_graph.so "${pkgdir}/usr/lib/libboost_graph.so.1.46.1"
  ln -s /usr/lib/libboost_graph_parallel.so "${pkgdir}/usr/lib/libboost_graph_parallel.so.1.46.1"
  ln -s /usr/lib/libboost_iostreams.so "${pkgdir}/usr/lib/libboost_iostreams.so.1.46.1"
  ln -s /usr/lib/libboost_locale.so "${pkgdir}/usr/lib/libboost_locale.so.1.46.1"
  ln -s /usr/lib/libboost_math_c99.so "${pkgdir}/usr/lib/libboost_math_c99.so.1.46.1"
  ln -s /usr/lib/libboost_math_c99f.so "${pkgdir}/usr/lib/libboost_math_c99f.so.1.46.1"
  ln -s /usr/lib/libboost_math_c99l.so "${pkgdir}/usr/lib/libboost_math_c99l.so.1.46.1"
  ln -s /usr/lib/libboost_math_tr1.so "${pkgdir}/usr/lib/libboost_math_tr1.so.1.46.1"
  ln -s /usr/lib/libboost_math_tr1f.so "${pkgdir}/usr/lib/libboost_math_tr1f.so.1.46.1"
  ln -s /usr/lib/libboost_math_tr1l.so "${pkgdir}/usr/lib/libboost_math_tr1l.so.1.46.1"
  ln -s /usr/lib/libboost_mpi.so "${pkgdir}/usr/lib/libboost_mpi.so.1.46.1"
  ln -s /usr/lib/libboost_mpi_python.so "${pkgdir}/usr/lib/libboost_mpi_python.so.1.46.1"
  ln -s /usr/lib/libboost_prg_exec_monitor.so "${pkgdir}/usr/lib/libboost_prg_exec_monitor.so.1.46.1"
  ln -s /usr/lib/libboost_program_options.so "${pkgdir}/usr/lib/libboost_program_options.so.1.46.1"
  ln -s /usr/lib/libboost_python.so "${pkgdir}/usr/lib/libboost_python.so.1.46.1"
  ln -s /usr/lib/libboost_python3.so "${pkgdir}/usr/lib/libboost_python3.so.1.46.1"
  ln -s /usr/lib/libboost_random.so "${pkgdir}/usr/lib/libboost_random.so.1.46.1"
  ln -s /usr/lib/libboost_regex.so "${pkgdir}/usr/lib/libboost_regex.so.1.46.1"
  ln -s /usr/lib/libboost_serialization.so "${pkgdir}/usr/lib/libboost_serialization.so.1.46.1"
  ln -s /usr/lib/libboost_signals.so "${pkgdir}/usr/lib/libboost_signals.so.1.46.1"
  ln -s /usr/lib/libboost_system.so "${pkgdir}/usr/lib/libboost_system.so.1.46.1"
  ln -s /usr/lib/libboost_thread.so "${pkgdir}/usr/lib/libboost_thread.so.1.46.1"
  ln -s /usr/lib/libboost_timer.so "${pkgdir}/usr/lib/libboost_timer.so.1.46.1"
  ln -s /usr/lib/libboost_unit_test_framework.so "${pkgdir}/usr/lib/libboost_unit_test_framework.so.1.46.1"
  ln -s /usr/lib/libboost_wave.so "${pkgdir}/usr/lib/libboost_wave.so.1.46.1"
  ln -s /usr/lib/libboost_wserialization.so "${pkgdir}/usr/lib/libboost_wserialization.so.1.46.1"

  # ROS needs libdb in version 5.2
  ln -s /usr/lib/libdb.so "${pkgdir}/usr/lib/libdb-5.2.so"

  # ROS needs libgdbm in version .3
  ln -s /usr/lib/libgdbm.so "${pkgdir}/usr/lib/libgdbm.so.3"

  msg "Cleaning up..."
  rm "${pkgdir}"/{control,md5sums,postinst}
}


md5sums=('8de6f1d305f1893d76ffd1f93b0cd7fc'
         'b67e6f345f7f8c21967d228e3bd291e5'
         'cd49f3a02d67869f00680f1fcd284673'
         'd86c0d40443d1ce1c92ac13e54237f8e'
         '2a9d352d0b60141446af88e3b6eb3abf'
         '6f3da2cc101cde7560a7d9d04b095027')
