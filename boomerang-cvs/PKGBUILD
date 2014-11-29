# Maintainer: lukas (lukas <dot> graetz <at> web <dot>  de)
pkgname=boomerang-cvs
pkgver=20141125
pkgrel=2
pkgdesc="A general, open source, retargetable decompiler of machine code programs"
arch=('i686' 'x86_64')
license=('BSD')
url="http://boomerang.sourceforge.net/"
makedepends=('cvs')
source=("boomerang_use_misc_types.patch")
md5sums=('538d9b262217a540997d01ebe127a4a6')

_cvsmod=boomerang

pkgver() {
  # FIXME
  date +%Y%m%d 
}

prepare() {
  # Download the package and get its version.
  # The "source"-array appearingly not supports CVS.
  # There should be a svn version of boomerang but I can't find it.
  cd "$srcdir"
  msg "Connecting to CVS server...."

  if [[ -d "$_cvsmod" ]]; then
    cd "$_cvsmod"
    cvs -z3 update -d
  else
    cvs -z3 -d:pserver:anonymous@boomerang.cvs.sourceforge.net:/cvsroot/boomerang co -P "$_cvsmod"
    cd "$_cvsmod"
  fi

  msg "CVS checkout done or server timeout"

  rm -rf "$srcdir/$_cvsmod-build"
  cp -p -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"

  cd "${srcdir}/$_cvsmod-build"
  patch -Np1 -i "${srcdir}/boomerang_use_misc_types.patch"
}

build() {
  cd "${srcdir}/$_cvsmod-build"

  # All Libs are located in /usr/lib/
  # CPPFLAGS+=" -Ddlopen(file,flag)=dlopen(\"/usr/\"file,flag)"
  echo $CPPFLAGS
  CXXFLAGS+=" -ldl"

  ./configure --prefix=/usr

  # I don't no where the #line -1 statements come from but this must be fixed
  sed -i 's|#line -1|#line 0|g' frontend/*decoder.cpp

  make
}
package() {
  cd "${pkgdir}"

  install -d opt/${pkgname}/{lib,signatures,transformations}
  install -d opt/${pkgname}/frontend/machine/{286,arm,hppa,mc68k,mips,pentium,ppc,sparc,st20}
  install -d usr/bin
  install -d usr/share/licenses/${pkgname}

  # Add Link
  cat > "usr/bin/${pkgname}" <<EOF
#!/usr/bin/sh
# Caution! All arguments must be given with absote path names.
cd /opt/${pkgname}
./boomerang \$@
EOF

  chmod 755 "${pkgdir}/usr/bin/${pkgname}"

  cd "${srcdir}/$_cvsmod-build"
  install -m 644 LICENSE.TERMS "${pkgdir}/usr/share/licenses/${pkgname}/"
  install lib/lib*.so "${pkgdir}/opt/${pkgname}/lib/"
  install signatures/{*.h,*.hs} "${pkgdir}/opt/${pkgname}/signatures/"


  for file in frontend/machine/{286,arm,hppa,mc68k,mips,pentium,ppc,sparc,st20}/*
    do if [ -f $file ]
    then install $file "${pkgdir}/opt/${pkgname}/$file"
    fi
  done

  for file in transformations/*
    do if [ -f $file ]
    then install $file "${pkgdir}/opt/${pkgname}/$file"
    fi
  done

  install boomerang "${pkgdir}/opt/${pkgname}/"
}

