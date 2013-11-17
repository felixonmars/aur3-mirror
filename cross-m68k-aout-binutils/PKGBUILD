# Contributor: SebRmv <sbriais at-symbol free dot fr>
# PKGBUILD based on cross-mipsel-linux-gnu-binutils
# (make by: Vojtech Horky <vojta . horky at-symbol seznam . cz>)
pkgname=cross-m68k-aout-binutils
_pkgname=binutils
_target="m68k-aout"
pkgver=2.16.1
pkgrel=6
pkgdesc="A set of programs to assemble and manipulate binary and object files for the M68K architecture"
url="http://www.gnu.org/software/binutils/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
source=("ftp://ftp.gnu.org/gnu/binutils/${_pkgname}-${pkgver}.tar.bz2")
sha1sums=('1c7952e78d0c4a959274f155202f248d49aab528')
_sysroot="/usr/lib/cross-${_target}"

prepare() {
	cd ${srcdir}/${_pkgname}-${pkgver}

patch -p0 <<EOF
--- ld/ld.texinfo	2005-06-12 20:35:45.000000000 +0200
+++ ld/ld.texinfo	2013-04-01 07:53:21.245542793 +0200
@@ -1589,7 +1589,7 @@
 
 @kindex --version-script=@var{version-scriptfile}
 @cindex version script, symbol versions
-@itemx --version-script=@var{version-scriptfile}
+@item --version-script=@var{version-scriptfile}
 Specify the name of a version script to the linker.  This is typically
 used when creating shared libraries to specify additional information
 about the version hierarchy for the library being created.  This option
@@ -6256,8 +6256,8 @@
 @printindex cp
 
 @tex
-% I think something like @colophon should be in texinfo.  In the
-% meantime:
+@c % I think something like @colophon should be in texinfo.  In the
+@c % meantime:
 \long\def\colophon{\hbox to0pt{}\vfill
 \centerline{The body of this manual is set in}
 \centerline{\fontname\tenrm,}
@@ -6267,7 +6267,7 @@
 \centerline{{\sl\fontname\tensl\/}}
 \centerline{are used for emphasis.}\vfill}
 \page\colophon
-% Blame: doc@cygnus.com, 28mar91.
+@c % Blame: doc@cygnus.com, 28mar91.
 @end tex
EOF
}

build() {
	cd ${srcdir}/${_pkgname}-${pkgver}

        CFLAGS=${CFLAGS//-D_FORTIFY_SOURCE=?/}
        export CFLAGS
        
        CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
        export CPPFLAGS

	./configure \
		"--prefix=${_sysroot}" \
		"--bindir=/usr/bin" "--program-prefix=${_target}-" \
		"--with-sysroot=${_sysroot}" \
		"--target=${_target}" "--build=$CHOST" "--host=$CHOST" \
		"--disable-nls" \
		--with-gcc --with-gnu-as --with-gnu-ld \
		--without-included-gettext \
		|| return 1
		
	make all || return 1
}

package() {
	cd ${srcdir}/${_pkgname}-${pkgver}

	make DESTDIR=${pkgdir} install || return 1
	
	msg "Removing duplicit files..."
	# remove these files as they are already in the system
	# (with native binutils)
	rm -Rf ${pkgdir}${_sysroot}/{man,info}
	# remove conflicting binaries
	find ${pkgdir}/usr/bin/ -type f -not -name 'm68k-aout*' -delete
	
	msg "Creating out-of-path executables..."
	# symlink executables to single directory with no-arch-prefix name
	mkdir -p ${pkgdir}/usr/bin/cross/${_target}/;
	cd ${pkgdir}/usr/bin/cross/${_target}/;
	for bin in ${pkgdir}/usr/bin/${_target}-*; do
		bbin=`basename "$bin"`;
		ln -s "/usr/bin/${bbin}" `echo "$bbin" | sed "s#^${_target}-##"`;
	done
}

