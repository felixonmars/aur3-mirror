# Maintainer: C Anthony Risinger
pkgname=libpythonwebkit-python2
pkgver=20101114
pkgrel=1
pkgdesc="WebKit with Python DOM bindings"
url=http://www.gnu.org/software/pythonwebkit/
arch=('i686' 'x86_64')
license=(LGPL3)
depends=('python2' 'libxt' 'libxslt' 'sqlite3' 'icu>=4.4' 'gstreamer0.10-base' 'enchant' 'libsoup' 'gtk2')
makedepends=('git' 'gperf' 'gtk-doc' 'python2-ply')
provides=('libwebkit')
conflicts=('libwebkit')
optdepends=()
options=('!libtool')
source=()

_gitroot='git://git.sv.gnu.org/pythonwebkit.git'
_gitname='python_codegen'

build() {

    local g=${startdir}/${pkgname}.git w=${srcdir}
    if ! [ -d "${g}" ]; then
        git --git-dir=${g} --work-tree=${w} init
    fi  

    msg2 "Syncing with ${_gitroot}..."
    git --git-dir=${g} --work-tree=${w} fetch -fu ${_gitroot} +${_gitname}:${_gitname}
    msg2 "Initializing src tree..."
    git --git-dir=${g} --work-tree=${w} read-tree --reset -u ${_gitspec:-${_gitname}}

    # it tries to rm -rf /autom4te.cache... no thats not a
    # typo, the prefix var doesn't exist ($top_srcdir) [BUG]
    sed -i -e 's,top_srcdir,srcdir,g' autogen.sh

    # fix the python bindings hack so it uses python2...
    # need to find a better solution
    sed -i -e 's,python-config,python2-config,g' WebCore/bindings/python/GNUmakefile.am

    export PYTHON=/usr/bin/python2
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    msg2 "Building branch: origin/${_gitname}..."
    sed -e '/#/d' <<CONFIG | xargs ../autogen.sh
        --prefix=/usr
            # sys prefix
        --enable-option-checking=yes
            # warn unrecognized --enable/--with options
        --enable-silent-rules=no
            # less verbose build output [undo: 'make V=1']
        --enable-dependency-tracking=yes
            # do not reject slow dependency extractors
        --enable-largefile=yes
            # omit support for large files
        --enable-static=no
            #[=PKGS] build static libraries [default=no]
        --enable-shared=yes
            #[=PKGS] build shared libraries [default=yes]
        --enable-fast-install=yes
            #[=PKGS] optimize for fast installation [default=yes]
        --enable-libtool-lock=yes
            # use locking for parallel builds
        --enable-schemas-compile=yes
            # enable regeneration of gschemas.compiled on install
        --enable-debug=no
            # enable debugging [default=no]
        --enable-optimizations=yes
            # enable optimize builds (GCC only) [default=yes]
        --enable-3D-transforms=no
            # enable support for 3D transforms [default=no]
        --enable-channel-messaging=yes
            # enable HTML5 channel messaging support [default=yes]
        --enable-javascript-debugger=yes
            # enable JavaScript debugger/profiler support [default=yes]
        --enable-offline-web-applications=yes
            # enable HTML5 offline web applications support [default=yes]
        --enable-dom-storage=yes
            # enable HTML5 client-side session and persistent storage support [default=yes]
        --enable-indexeddb=no
            # enable the indexed database API [default=no]
        --enable-input-speech=no
            # enable the speech input API [default=no]
        --enable-database=yes
            # enable HTML5 client-side database storage support [default=yes]
        --enable-eventsource=yes
            # enable HTML5 server-sent events support [default=yes]
        --enable-icon-database=yes
            # enable icon database [default=yes]
        --enable-image-resizer=no
            # enable image resizer [default=no]
        --enable-datalist=yes
            # enable HTML5 datalist support [default=yes]
        --enable-ruby=yes
            # enable HTML5 ruby support [default=yes]
        --enable-sandbox=yes
            # enable HTML5 sandboxed iframe support [default=yes]
        --enable-video=yes
            # enable HTML5 video support [default=yes]
        --enable-xhtmlmp=no
            # enable support for XHTML-MP [default=no]
        --enable-xpath=yes
            # enable support for XPath [default=yes]
        --enable-xslt=yes
            # enable support for XSLT [default=yes]
        --enable-geolocation=no
            # enable support for geolocation [default=no]
        --enable-mathml=no
            # enable support for MathML [default=no]
        --enable-svg=yes
            # enable support for SVG [default=yes]
        --enable-wml=no
            # enable support for WML [default=no]
        --enable-shared-workers=yes
            # enable support for SharedWorkers [default=yes]
        --enable-workers=yes
            # enable support for Web Workers [default=yes]
        --enable-directory-upload=no
            # enable support for directory upload [default=no]
        --enable-file-system=no
            # enable support for HTML5 FileSystem API [default=no]
        --enable-svg-animation=yes
            # enable support for SVG animation (experimental) [default=yes]
        --enable-filters=yes
            # enable support for filters (experimental) [default=yes]
        --enable-svg-fonts=yes
            # enable support for SVG fonts (experimental) [default=yes]
        --enable-svg-foreign-object=yes
            # enable support for SVG foreign objects (experimental) [default=yes]
        --enable-svg-as-image=yes
            # enable SVG as Image support (experimental) [default=yes]
        --enable-svg-use=yes
            # enable SVG use element support (experimental) [default=yes]
        --enable-web-sockets=yes
            # enable support for Web Sockets [default=yes]
        --enable-web-timing=no
            # enable support for Web Timing [default=no]
        --enable-blob=no
            # enable support for Blob [default=no]
        --enable-fast-mobile-scrolling=no
            # enable support for Fast Mobile Scrolling [default=no]
        --enable-coverage=no
            # enable code coverage support [default=no]
        --enable-fast-malloc=yes
            # enable optimized memory allocator default=yes, default=no for debug builds
        --enable-jit=yes
            # enable JIT compilation [default=yes]
        --enable-opcode-stats=no
            # enable Opcode statistics [default=no]
        --enable-introspection=yes
            # enable GObject introspection [default=no]
        --enable-gtk-doc=no
            # use gtk-doc to build documentation [default=no]
        --enable-gtk-doc-html=no
            # build documentation in html format [default=yes]
        --enable-gtk-doc-pdf=no
            # build documentation in pdf format [default=no]
        #--with-pic
            # try to use only PIC/non-PIC objects [default=use both]
        --with-gnu-ld=no
            # assume the C compiler uses GNU ld [default=no]
        #--with-sysroot
            #[=DIR] Search for dependent libraries within DIR, or the compilers sysroot if not specified
        --with-gtk=2.0
            #=[2.0/3.0] the GTK+ version to use [default=2.0]
        --with-target=x11
            #=[x11/win32/quartz/directfb] Select webkit target [default=x11]
        --with-hildon=no
            # Use Hildon UI extensions [default=no]
        --with-unicode-backend=icu
            #=[icu/glib] Select Unicode backend. WARNING: glib-based slow/incomplete [default=icu]
        --with-font-backend=freetype
            #=[freetype/pango] Select font backend [default=freetype]
        #--with-html-dir
            #[=PATH] path to installed docs
CONFIG

    make

}

function package() {

    install -Dm644 WebKit/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}" install

}
