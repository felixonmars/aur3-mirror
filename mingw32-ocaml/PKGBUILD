# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Original patches by Richard W.M. Jones (Fedora) for OCaml 3.11, see http://git.annexia.org/?p=fedora-mingw.git;a=tree;f=ocaml;hb=HEAD
# Additional work by Romain Beauxis (Debian) for OCaml 3.12, see http://packages.debian.org/experimental/mingw32-ocaml
# This have been tested on small projects (using 'graphics' and 'unix' libs).
# Please report any issue (e.g. using camlp4 or any other lib)

# TODO: fix deps that are not really needed
# TODO: get to know ocamlfind, if needed
# TODO: provide a link to a blog post explaining how to use it
_pkgname=ocaml
pkgname=mingw32-ocaml
pkgver=3.12.0
pkgrel=1
pkgdesc="MinGW cross-compiler for Objective Caml (ocaml) that allows building windows (win32) binaries"
arch=('i686' 'x86_64')
url="http://caml.inria.fr/"
license=('LGPL2' 'custom: QPL-1.0')
options=(!strip)
makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-flexdll' 'libx11')
# we need to be able to compile in 32-bit, make sure you have enabled multilib repo
[ "$CARCH" = "x86_64" ] && makedepends=('mingw32-gcc' 'mingw32-binutils' 'mingw32-flexdll' 'libx11' 'lib32-libx11' 'gcc-multilib')
# according to the fedora package, we need mingw32-gcc to use the ocaml cross-compiler (not sure why though)
depends=('ocaml' 'mingw32-gcc' 'mingw32-binutils' 'mingw32-flexdll') #'ocaml-findlib')
source=( "http://caml.inria.fr/pub/distrib/ocaml-3.12/${_pkgname}-${pkgver}.tar.bz2"
    "Makefile-mingw32.in"
    "mingw32-ocaml-disable-cmxs.patch"
    "mingw32-ocaml-i386-profiling.patch"
    "mingw32-ocaml-win32unix-path.patch"
    "mingw32-ocaml-combined-Makefile.patch"
    "mingw32-ocaml-filename-win32-dirsep.patch"
    "mingw32-ocaml-no-stdlib-dir.patch"
    "mingw32-ocaml-fix-opt-link-opts.patch.in"
    "mingw32-ocaml-fix-ocamlrun-path.patch"
    "mingw32-ocaml-run-ranlib-on-threads.patch"
    "mingw32-ocaml-force-os-type.patch"
    "mingw32-ocaml-win32-compat.patch"
    "mingw32-ocaml-hardcode-mingw32-include.patch.in" )
md5sums=('bd92c8970767f412bc1e9a6c625b5ccf'
         'fdae6e8282d065b0e80edb38f1506354'
         '001ea1e8b81bb4a4420bfbcf046653c3'
         '5c9f0850503985bbc6ae913fd2c6a8ad'
         '244527f3c3dd5a830a6ea280e56282b6'
         '26c233c3828081cb156b1fad79f9e274'
         '9cea24b470b3162862869705392b5e99'
         'dfbdd7218ed132624bfb3130a7a8f001'
         '157be2ee3a45ba6674c8af49650a05c9'
         '5eb6a569bce7b0b466b03c6d73fc7624'
         '350640941c1780811d79462f2fb12fa7'
         'e7f94edbd44aa7f433862a2a78574bb0'
         'c7a672fa1811eba87b2c72757757e819'
         '232fc847aa8122895c5d14e2632ba4b9')

mingw32prefix="i486-mingw32"
otherlibraries="win32unix str num dynlink bigarray systhreads win32graph"
libdir="/usr/lib/${mingw32prefix}-ocaml"
mingw32libdir="/usr/${mingw32prefix}/lib"

build() {
    patches=("mingw32-ocaml-combined-Makefile.patch"
	"mingw32-ocaml-disable-cmxs.patch"
	"mingw32-ocaml-filename-win32-dirsep.patch"
	"mingw32-ocaml-i386-profiling.patch"
	"mingw32-ocaml-no-stdlib-dir.patch"
	"mingw32-ocaml-win32-compat.patch"
	"mingw32-ocaml-win32unix-path.patch"
	"mingw32-ocaml-run-ranlib-on-threads.patch"
	"mingw32-ocaml-force-os-type.patch"
	"mingw32-ocaml-fix-ocamlrun-path.patch")

    patches_in=("mingw32-ocaml-hardcode-mingw32-include.patch"
	"mingw32-ocaml-fix-opt-link-opts.patch")

    cd "$srcdir"

    for i in ${patches[@]}
    do
	echo "[*] Applying patch ${i}..."
	patch -p1 < "${i}"
    done

    for i in ${patches_in[@]}
    do
	# We replace everything as needed
	sed \
	    -e "s,@mingw32libdir@,${mingw32libdir},g" \
	    < "${i}.in" > "${i}"
	echo "[*] Applying parametrized patch ${i}..."
	patch -p1 < "${i}"
    done

    cd "$srcdir/$_pkgname-$pkgver"


    # Build native ocamlrun and ocamlc which contain the
    # filename-win32-dirsep patch.
    # 
    # Note that we must build a 32 bit compiler, even on 64 bit build
    # architectures, because this compiler will try to do strength
    # reduction optimizations using its internal int type, and that must
    # match Windows' int type.  (That's what -cc and -host are for).    
    ./configure \
	-no-tk \
	-bindir /usr/bin \
	-libdir "$libdir" \
	-mandir /usr/share/man/man1 \
	-cc "gcc -m32" \
	-host i386-pc-linux \
	-x11lib /usr/lib/ \
	-verbose

    make world

    # Now move the working ocamlrun, ocamlc into the boot/ directory,
    # overwriting the binary versions which ship with the compiler with
    # ones that contain the above filename-win32-dirsep patch.  
    make coreboot

    # Now replace the compiler configuration (config/{s.h,m.h,Makefile})
    # with ones as they would be on a 32 bit Windows system.
    pushd config

    # config/m.h can just be copied from config/m-nt.h which ships.
    rm -f m.h
    cp m-nt.h m.h

    # config/s.h can just be copied from config/s-nt.h which ships.
    rm -f s.h
    cp s-nt.h s.h

    # config/Makefile is a custom one which we supply.
    rm -f Makefile
    sed \
	-e "s,@prefix@,/usr,g" \
	-e "s,@bindir@,/usr/bin,g" \
	-e "s,@libdir@,$libdir,g" \
	-e "s,@target@,${mingw32prefix},g" \
	-e "s,@otherlibraries@,${otherlibraries},g" \
	-e "s,@flexdir@,/usr/lib/flexdll,g" \
	< "$srcdir/Makefile-mingw32.in" > Makefile

    popd

    # We're going to build in otherlibs/win32unix and otherlibs/win32graph
    # directories, but since they would normally only be built under
    # Windows, they only have the Makefile.nt files.  Just symlink
    # Makefile -> Makefile.nt for these cases.
    for i in win32unix win32graph bigarray systhreads
    do 
	ln -sf Makefile.nt otherlibs/$i/Makefile
    done

    # Now clean the temporary files from the previous build.  This
    # will also cause asmcomp/arch.ml (etc) to be linked to the 32 bit
    # i386 versions, essentially causing ocamlopt to use the Win/i386 code
    # generator.
    make partialclean

    # We need to remove any .o object to ensure their future
    # recompilation.
    rm -f byterun/*.o

    # Just rebuild some small bits that we need for the following
    # 'make opt' to work.  Note that 'make all' fails here.
    make -C byterun libcamlrun.a
    make ocaml ocamlc
    make -C stdlib
    make -C tools ocamlmklib

    # Build ocamlopt
    make opt

    # Now build otherlibs for ocamlopt
    for i in $otherlibraries
    do
	make -C otherlibs/$i clean
	make -C otherlibs/$i all
	make -C otherlibs/$i allopt
    done

    # Build camlp4
    make camlp4opt
}


package() {
    cd "$srcdir/$_pkgname-$pkgver"
  

    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/$libdir"
    mkdir -p "$pkgdir/$libdir/threads"
    mkdir -p "$pkgdir/$libdir/stublibs"

    # This is the equivalent of 'make install installopt', but
    # we only want to install the parts which are really necessary
    # for the cross-compiler.  eg. We don't need any of the native
    # tools like ocamllex or ocamldoc.
    makearg="BINDIR=$pkgdir/usr/bin LIBDIR=$pkgdir/$libdir"
    make $makearg -C byterun install
    make $makearg -C stdlib install
    for i in $otherlibraries
    do
	make $makearg -C otherlibs/$i install
    done
    make $makearg -C tools install
    make $makearg installopt

    install -m 0755 ocamlc "$pkgdir/usr/bin"

    cp config/Makefile \
	"$pkgdir/$libdir/Makefile.config"

    for i in mkcamlp4 camlp4o camlp4r camlp4
    do
	install -m 0755 "_build/camlp4/$i.native" "$pkgdir/usr/bin/$i"
    done

    cp \
	toplevel/topstart.cmo \
	typing/outcometree.cmi typing/outcometree.mli \
	toplevel/toploop.cmi toplevel/toploop.mli \
	toplevel/topdirs.cmi toplevel/topdirs.mli \
 	toplevel/topmain.cmi toplevel/topmain.mli \
	"$pkgdir/$libdir"

    # Rename all the binaries to target-binary.
    pushd $pkgdir/usr/bin
    for f in ocamlc ocamlcp ocamldep ocamlmklib ocamlmktop ocamlopt ocamlprof ocamlobjinfo mkcamlp4 camlp4o camlp4r camlp4
    do
	mv $f ${mingw32prefix}-$f
    done
    popd

    # Don't install ocamlrun, use native one.
    rm $pkgdir/usr/bin/ocamlrun
}

# vim:set ts=2 sw=2 et:
