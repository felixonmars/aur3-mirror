# Maintainer:  mrshpot <mrshpot at gmail dot com>
# Contributor:  veox <box 55 [shift-two] mail [dot] ru>

pkgname=cl-gtk2
_clname=cl-gtk2   # used in CL scope, not package scope
pkgver=0.1.1
pkgrel=1
pkgdesc="GTK+ 2 bindings for Common Lisp"
arch=('i686' 'x86_64')
url="http://common-lisp.net/project/cl-gtk2/"
license=('BSD')

# TODO: replace this segment with 'common-lisp' when all provide it.
if pacman -Qq clisp-new-clx &>/dev/null; then
    depends=('clisp-new-clx' 'cl-asdf'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
elif pacman -Qq clisp-gtk2 &>/dev/null; then
    depends=('clisp-gtk2' 'cl-asdf'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
elif pacman -Qq sbcl &>/dev/null; then
    depends=('sbcl'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
elif pacman -Qq clisp &>/dev/null; then
    depends=('clisp' 'cl-asdf'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
elif pacman -Qq cmucl &>/dev/null; then
    depends=('cmucl' 'cl-asdf'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
else
    depends=('sbcl'
'cl-cffi' 'cl-trivial-garbage' 'cl-iterate' 'cl-bordeaux-threads'
'cl-closer-mop' 'cl-opengl' 'cl-cairo2')
fi

install=cl-gtk2.install
source=("${url}/files/${_clname}-${pkgver}.tar.gz")
md5sums=('39f3e136b2e23a2525c16e043ed97681')
options=(docs)


build() {

	install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}
        install -d ${pkgdir}/usr/share/common-lisp/systems
	install -d ${pkgdir}/usr/share/licenses/${pkgname}

	install -d ${pkgdir}/usr/share/doc/${_clname}
	install -d ${pkgdir}/usr/share/doc/${_clname}/references
	install -d ${pkgdir}/usr/share/doc/${_clname}/references/gobject.type-info
	
	
	for _dir in glib pango gdk gtk gtk-glext cairo; do
	  install -d ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir}
	done
	
	
	for _dir in glib pango gdk gtk gtk-glext cairo; do
	  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir} \
	    ${srcdir}/${_clname}-${pkgver}/${_dir}/*.lisp

	  install -m 644 -t ${pkgdir}/usr/share/common-lisp/source/${_clname}/${_dir} \
	    ${srcdir}/${_clname}-${pkgver}/${_dir}/*.asd
	done

	install -m 644 -t ${pkgdir}/usr/share/doc/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/doc/*.html

	install -m 644 -t ${pkgdir}/usr/share/doc/${_clname} \
	  ${srcdir}/${_clname}-${pkgver}/doc/*.lisp

	cd ${pkgdir}/usr/share/common-lisp/systems
	for _dir in glib pango gdk gtk gtk-glext cairo; do
	  ln -s ../source/${_clname}/${_dir}/*.asd .
	done
}
