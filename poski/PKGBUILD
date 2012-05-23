# Mantainer: Filippo Squillace <feel.squally at gmail.com>
pkgname=poski
pkgver=1.0.0
pkgoskiname=oski
pkgoskiver=1.0.1h

pkgrel=1
pkgdesc="Parallel Optimized Sparse Kernel Interface"
arch=('any')
url="http://bebop.cs.berkeley.edu/poski/index.php"
license=('GPL')
depends=('blas')
source=("http://iweb.dl.sourceforge.net/project/${pkgoskiname}/${pkgoskiname}/${pkgoskiver}/${pkgoskiname}-${pkgoskiver}.tar.gz" "http://bebop.cs.berkeley.edu/${pkgname}/tarballs/_${pkgname}-v${pkgver}/${pkgname}-v${pkgver}-part.tar.gz")
md5sums=('fcdf075ffc3ee5e403ee9529d1853b88' '84a094f06b9638c2b679750d80c97d1c')

build() {


  mkdir build-${pkgoskiname}-${pkgoskiver}

  export OSKIDIR=$pkgdir/opt/oski
  export OSKIBUILD=$srcdir/build-${pkgoskiname}-${pkgoskiver}

  cd build-${pkgoskiname}-${pkgoskiver}

  # So far, poski can use only int-double types. Hence, let's comment
  # this out.
  #echo "Specify the integer indices and floating-point values INT-VAL."
  #echo "Possible values are INT=(int long) and VAL=(single double scomplex dcomplex)."
  #echo "Default is int-double. You can specify multiple of them separated by space."
  #read -p ">> " intvals

  #if [ "$intvals" == "" ];
  #then
    #pairs=""
  #else

    #pairs=""
    #for iv in $intvals;
    #do
        #pairs="$pairs --enable-$iv"
    #done

  #fi

  echo "Define compiler. Example: >> icc"
  echo "Default is: gcc"
  read -p ">> " cc

  echo "Define flags compiler. Example: >> –O3"
  echo "Default is: –g –O3 –std=gnu99"
  read -p ">> " cflags

  envs=""
  if [ "$cc" != "" ];
  then
    envs="CC=$cc"
  fi
  if [ "$cflags" != "" ];
  then
    envs="$envs CFLAGS='$cflags'"
  fi


  echo "###################### OSKI INSTALLATION ###############################"

  env $envs ../${pkgoskiname}-${pkgoskiver}/configure --prefix=${OSKIDIR} #$pairs

  make
  make benchmarks


  echo "Do you want to test the oski installation?"
  echo "It could take an hour or more to run. [Y/n]"
  read -p ">> " check
  while [ "${check}" != "Y" -a "${check}" != "y" -a "${check}" != "" -a "${check}" != "n" -a "${check}" != "N" ]
  do
    echo "Do you want to test the oski installation?"
    echo "It could take an hour or more to run. [Y/n]"
    read -p ">> " check
  done

  if [ "$check" == "Y" -o "$check" == "" -o "$check" == "y"  ];
  then
    make check
  fi

  make install

  # set environment variable
  mkdir -p $pkgdir/etc/profile.d
  echo "export OSKIDIR=/opt/oski" >$pkgdir/etc/profile.d/${pkgname}.sh
  chmod a+x $pkgdir/etc/profile.d/${pkgname}.sh



  echo "###################### POSKI INSTALLATION ###############################"
  cd $srcdir

  POSKIDIR=/opt/poski

  mkdir build-${pkgname}-${pkgver}
  cd build-${pkgname}-${pkgver}


  echo "Do you want to test the poski installation?"
  echo "It could take some minutes to run. [Y/n]"
  read -p ">> " check
  while [ "${check}" != "Y" -a "${check}" != "y" -a "${check}" != "" -a "${check}" != "n" -a "${check}" != "N" ]
  do
    echo "Do you want to test the poski installation?"
    echo "It could take some minutes to run. [Y/n]"
    read -p ">> " check
  done

  withcheck=""
  if [ "$check" == "Y" -o "$check" == "" -o "$check" == "y"  ];
  then
      withcheck="--with-check=yes"
  fi

  envs=""
  if [ "$cc" != "" ];
  then
    envs="--cc=$cc"
  fi
  if [ "$cflags" != "" ];
  then
    envs="$envs --cflags='$cflags'"
  fi


  ../${pkgname}-v${pkgver}/INSTALL.sh ${withcheck} $envs --prefix=${pkgdir}/${POSKIDIR}

  # set environment variable
  mkdir -p $pkgdir/etc/profile.d
  echo "export POSKIDIR=${POSKIDIR}" >>$pkgdir/etc/profile.d/${pkgname}.sh
  chmod a+x $pkgdir/etc/profile.d/${pkgname}.sh
}
