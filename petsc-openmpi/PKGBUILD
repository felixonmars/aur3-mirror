# Maintainer: domanov <domanov at gmail dot com>
pkgname=petsc-openmpi
pkgver=3.1_p5
_config=linux-gnu-c-opt
_petsc=petsc
pkgrel=1
provides=('petsc')
pkgdesc="Portable, extensible and highly parallel toolkit for scientific computations"
arch=('i686' 'x86_64')
url="http://www.mcs.anl.gov/petsc/petsc-as"
license=('custom')
depends=('gcc' 'openmpi' 'python2' 'libx11' 'boost' 'blas' 'lapack')
options=('!strip')
source=(http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/${_petsc}-${pkgver/_/-}.tar.gz 
        petsc.sh)

md5sums=('b286063545a52b45f5f8960acf503ce2'
         'b5820979d2b791f65be6f141c72a8a0c')

build() {
   cd ${srcdir}/${_petsc}-${pkgver/_/-}

   export PETSC_DIR=${srcdir}/${_petsc}-${pkgver/_/-}

   msg "---> Configuring..."
   python2 ./config/configure.py --prefix=${pkgdir}/usr/lib/${_petsc} \
       --with-blas-lapack-dir=/usr/lib --with-mpi-dir=/usr/lib/ \
       --with-debugging=0 --with-blas=1 --with-c++-support=1 --with-etags=0 \
       --with-boost=1 --with-boost-dir=/usr/lib --with-fortran \
       --with-shared=1 \
       COPTFLAGS='-O3 -mtune=native' FOPTFLAGS='-O3 -qtune=native' || return 1

##      for future use: 
##      --umfpack-dir=/usr/lib \
##      --download-blacs=1 --download-scalapack=1 --download-superlu_dist=1 --download-mumps=1 --download-parmetis=1 --download-umfpack=1 \ 
##      --with-umfpack=1 --with-umfpack-dir=/usr/lib \
##      --with-clanguage=c++ --with-boost-dir=/usr/lib \
##      --with-shared=1 || return 1

   msg "---> Building..."
   make || return 1
   msg "---> Building done!"
}

package() {
   msg "---> Packaging..."

   cd ${srcdir}/${_petsc}-${pkgver/_/-}

   export PETSC_DIR=${srcdir}/${_petsc}-${pkgver/_/-}
      
   ## fix the makefile for python2
   sed -i 's|\-\@.*install.py|-@python2 ./config/install.py|' makefile 
   make PETSC_DIR=${srcdir}/${_petsc}-${pkgver/_/-} PETSC_ARCH=${_config} install || return 1

   ## get rid of references to build dir
   rm -rf  ${pkgdir}/usr/lib/petsc/conf/{configure.log,make.log,configure.log.bkp}
   for i in ${pkgdir}/usr/lib/petsc/conf/*;        do sed -i "s#${pkgdir}##g" $i ; sed -i "s#${srcdir}##g" $i ;  done
   for i in ${pkgdir}/usr/lib/petsc/include/pets*; do sed -i "s#${pkgdir}##g" $i ; sed -i "s#${srcdir}##g" $i ;  done
   # for i in ${pkgdir}/usr/lib/petsc/lib/*;         do sed -i "s#${pkgdir}##g" $i ; sed -i "s#${srcdir}##g" $i ;  done

   ## export PETSC_DIR and PETSC_ARCH, sourced from /etc/profile.d/petsc.sh
   mkdir -p $pkgdir/etc/profile.d
   install -D -m755 ${startdir}/petsc.sh $pkgdir/etc/profile.d/petsc.sh || return 1
   ## ld.so.conf
   mkdir -p $pkgdir/etc/ld.so.conf.d
   echo "/usr/lib/petsc/lib" > $pkgdir/etc/ld.so.conf.d/petsc.conf || return 1

   ## custom copyright notice
   mkdir -p $pkgdir/usr/share/licenses/${_petsc} 
   install -D -m644 ${srcdir}/${_petsc}-${pkgver/_/-}/docs/copyright.html  $pkgdir/usr/share/licenses/${_petsc}/copyright.html || return 1

   msg "---> Everything done!"
}
