# Maintainer: C Anthony Risinger <anthony@xtfx.me>


# Default upstream definitions.
_deforigin='git://git.sv.gnu.org/pythonwebkit.git'
_defbranch='python_codegen'


# Our mighty package.
pkgname='pyjamas-engine-pythonwebkit'
pkgver=20120227
pkgrel=1
pkgdesc='Pyjamas desktop engine (pythonwebkit)'
url='http://www.gnu.org/software/pythonwebkit/'
arch=('i686' 'x86_64')
license=('custom')
depends=('python2' 'pygtk' 'libxt' 'libxslt' 'sqlite3' 'icu' 'gstreamer0.10-base' 'libsoup' 'enchant')
makedepends=('git' 'python2' 'python2-ply' 'gperf' 'gtk-doc' 'gtk2' 'gtk3')
provides=()
conflicts=()
optdepends=()
options=('!libtool')
source=('changeset_trunk_JavaScriptCore_wtf_Assertions.h_r70829.patch'
        'changeset_trunk_JavaScriptCore_wtf_PageAllocation.h_r86957-alt.patch'
        'changeset_trunk_WebCore_dom_make_names.pl_r73989.patch'
        'changeset_trunk_WebCore_dom_make_py_names.pl_r001-new.patch'
        'changeset_trunk_WebCore_make-hash-tools.pl_r89265.patch'
        'changeset_trunk_WebCore_platform_image-decoders_png_PNGImageDecoder.cpp_r82344.patch')
md5sums=('475516ea4646729055f479dc046eb0f1'
         'e973de554bff1a9ffb6a0f5d85ca5b42'
         'd9eb9b747a476ebba0d740fba878d219'
         'e3fca784cad5223f7fb428431724264f'
         'bd2a66b4bf9aece3aa798f52797d09d6'
         'f7b14c88cbac7ad274bd7281f9d9e90d')


# GTK2 package?
: ${_pkg_use_gtk2:=true}

# GTK3 package? XXX: Disable for now (doesn't compile).
: ${_pkg_use_gtk3:=false}

# Append `-git`?
: ${_pkg_is_devel:=false}

# Debug build?
: ${_pkg_is_debug:=false}


# Allow env passthru ...
# process mods/variants/defaults.
for x in x "${!_pkg_use_@}" "${!_pkg_is_@}"; do
    case "${x}==${!x}" in
        x==x)
            # Devel directory fragment
            : ${_dir_devel:=PKGBUILD.devel}

            # Local/custom repo?
            if [[ -z ${_gitrepo} ]]; then
                search=(/var/abs{,/local}/"${_dir_devel}"
                        "${SRCDEST%%/}/${_dir_devel}"
                        "${startdir%%/}/${_dir_devel}"
                        ~/"${_dir_devel}")
                for d in "${search[@]%%/}"; do
                    if [[ -e ${d} ]] || [[ ! -e ${d} && -w ${d%/*} ]]; then
                        mkdir -p "${d}" 2>&- &&
                            _gitrepo_proxy="${srcdir}/${pkgname}.git" &&
                            _gitrepo="${d}/${pkgname}.git" &&
                            break
                    fi
                done
            fi
            : ${_gitroot:=${_deforigin}}
            : ${_gitname:=${_defbranch}}
            : ${_gitwork:="${srcdir}/${pkgname}"}

            # Hide from AUR ...
            true && pkgname=("${pkgname}")
            _gtkver=()
            PKG_HAS_DEBUG='--disable-debug'
        ;;
        _pkg_use_gtk2==true)
            _gtkver+=(2)
        ;;
        _pkg_use_gtk3==true)
            _gtkver+=(3)
            true && pkgname=("${pkgname}" "${pkgname/webkit/webkit3}")
        ;;
        _pkg_is_devel==true)
            provides=("${pkgname[@]}")
            true && pkgname=("${pkgname[@]/%/-git}")
        ;;
        _pkg_is_debug==true)
            options+=('!strip')
            PKG_HAS_DEBUG='--enable-debug'
        ;;
    esac
done


build() {
    export PYTHON="$(which python2)"
    export PYTHON_CONFIG="${PYTHON}-config"
    local g="${_gitrepo}" w="${_gitwork}" p= v= l=0

    # Print config.
    echo; msg2 'PKGBUILD configuration ...'
    v=("${!_pkg@}" "${!_git@}" "${!PYTHON@}")
    for x in "${v[@]}"; do x=${#x} && ((l<x)) && l=$x; done; l=$((l+5))
    for x in "${v[@]}"; do printf '%*s  %s\n' ${l} "${x}" "${!x}"; done; echo

    mkdir -p "${w}"
    if [[ ! -e ${g}/objects ]]; then
        msg "[git] Creating NEW repository ... "
        git --git-dir="${g}" --work-tree="${w}" init
    elif [[ ! -w ${g}/objects ]]; then
        warning "[git] Repository read-only, setting up proxy ... "
        git --git-dir="${_gitrepo_proxy}" --work-tree="${w}" init
        echo "${g}/objects" > "${_gitrepo_proxy}/objects/info/alternates"
        cp -r "${g}/refs" "${_gitrepo_proxy}"
        g="${_gitrepo_proxy}"
    fi

    msg "[git] Syncing ... ${_gitroot} -> ${g}"
    git --git-dir="${g}" --work-tree="${w}" fetch -fu "${_gitroot}" "+${_gitname}:${_gitname}"
    msg "[git] Reading ... ${_gitspec:-${_gitname}} -> ${w}"
    git --git-dir="${g}" --work-tree="${w}" read-tree --reset -u "${_gitspec:-${_gitname}}"

    cd "${w}"

    msg "[patch] Applying ..."
    for x in "${srcdir}"/changeset_*; do
        msg2 "${x##*/} ..."
        patch -Np1 < "${x}" | sed 's,^,     ,g'
    done

    mkdir -p "${_gtkver[@]/#/build-gtk}"

    for x in "${_gtkver[@]}"; do (
        cd build-gtk${x}
        msg "[autogen] Configuring ... GTK${x}"
        p="${pkgname/webkit/webkit${x#2}}"
        _build  --with-gtk=${x}.0 \
                --program-prefix="${p}-" \
                --sysconfdir="\${prefix}/etc/${p}" \
                --localstatedir="\${prefix}/var/${p}" \
                --libdir="\${exec_prefix}/lib/${p}" \
                --includedir="\${prefix}/include/${p}" \
                --oldincludedir="\${prefix}/include/${p}" \
                --datarootdir="\${prefix}/share/${p}"
    ); done
}

_build() {
    # Not strictly needed anymore since we're not trying to statically pack webkit
    # into a python module :-) but we'll keep it around because the grander target
    # is *statically* linking everything into a single *shared* python module.so
    # ... PIC is good anyway.
    if [[ ${CARCH} == x86_64 ]]; then
        PKG_HAS_PIC='--with-pic'
        export CFLAGS="${CFLAGS} -fPIC -DPIC" CXXFLAGS="${CXXFLAGS} -fPIC -DPIC"
    fi

    ../autogen.sh \
        --prefix=/usr \
        --with-python-config="${PYTHON_CONFIG}" \
        --with-font-backend=freetype \
        --with-unicode-backend=icu \
        --enable-shared \
        --disable-static \
        --disable-gtk-doc \
        --disable-gtk-doc-html \
        "$@" ${PKG_HAS_PIC} ${PKG_HAS_DEBUG}

    msg "[make] Building ... GTK${x}"
    make
}

package_pyjamas-engine-pythonwebkit-git() { _package 2; }
package_pyjamas-engine-pythonwebkit3-git() { _package 3; }

_package() {
    pkgdesc+=" [GTK${1}]"
    depends+=("gtk${1}")

    msg "[make] Installing ... GTK${1}"
    cd "${_gitwork}/build-gtk${1}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${_gitwork}/WebKit/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}${1#2}/LICENSE"

    # XXX: Not needed, and has naming conflicts with webkit proper
    rm -rf "${pkgdir}/usr/include/"
}
