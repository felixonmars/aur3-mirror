
_bm() {
	_dir=$(find $srcdir -maxdepth 2 -type f -name 'Makefile.PL')
	if [ ! -z "$_dir" ]; then 
		echo "EUMM";
		return 0;
	fi
	_dir=$(find $srcdir -maxdepth 2 -type f -name 'Build.PL')
	if [ ! -z "$_dir" ]; then 
		echo "MB";
		return 0;
	fi
	error "failed to detect build method for $pkgname";
	error "you may be able to fix this by editing the PKGBUILD"
    	exit 1;
}
_bdir() {
	_dir=$(find $srcdir -maxdepth 2 -type f -name $1 );
	dirname "$_dir";
}

perlmod_build() {
  _build_method=$(_bm);
  if [ $_build_method = 'EUMM' ]; then
     cd $(_bdir Makefile.PL);
     PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
     make  || return 1
  else if [ $_build_method = 'MB' ]; then
     cd $(_bdir Build.PL);
     PERL_MM_USE_DEFAULT=1 perl Build.PL INSTALLDIRS=vendor || return 1
    ./Build  || return 1
  fi fi
}
build() {
	perlmod_build;
}

perlmod_check() {
  _build_method=$(_bm);
  if [ $_build_method = 'EUMM' ]; then
     cd $(_bdir Makefile.PL);
     make test || return 1
  else if [ $_build_method = 'MB' ]; then
     cd $(_bdir Build.PL);
    ./Build test || return 1
  fi fi
}

check() {
	perlmod_check;
}

perlmod_package() {
  _build_method=$(_bm);
  if [ $_build_method = 'EUMM' ]; then
     cd $(_bdir Makefile.PL);
     make install DESTDIR="${pkgdir}" || return 1
  else if [ $_build_method = 'MB' ]; then
     cd $(_bdir Build.PL);
    ./Build install destdir=${pkgdir} || return 1
  fi fi
}

package(){
	perlmod_package;
}
