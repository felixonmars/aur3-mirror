# Contributor: Dylon Edwards <deltaecho@archlinux.us>
# Contributor: Bernhard Friedreich <friesoft@gmail.com>

pkgname=qtscriptgenerator-git-4.6
pkgver=20100814
pkgrel=1

pkgdesc="A tool that generates Qt 4.6 bindings for Qt Script."
url="http://qt.gitorious.org/qt-labs/qtscriptgenerator"
license=('GPL')

source=( 'qtscriptgenerator-git.patch' )
md5sums=('323f52267f2fe393d00c644634d992dc')

arch=('i686' 'x86_64')

depends=( "qt" )
makedepends=( "git" )

provides=( "qtscriptgenerator-git=${pkgver}" "qtscriptgenerator=${pkgver}" )
conflicts=( "qtscriptgenerator" )

_gitroot="git://gitorious.org/qt-labs/qtscriptgenerator.git"
_gitname="qtscriptgenerator-git"

# Valid options are "true" or "false"
INSTALL_DOCS="true"

build() {
    # Export the include dir
    export QTDIR="/usr"
    export INCLUDE="/usr/include"

    msg "Connecting to the GIT server..."
    if [ -d ${_gitname}/.git ]; then
        ( cd ${_gitname} && git pull )
    else
        git clone ${_gitroot} ${_gitname}
        cd ${_gitname}

        git checkout --track -f -b 4.6 origin/4.6

        cd ..
    fi

    # Patch a file that lacks an #include,
    #+ and another to disable phonon.
    cp -a ${_gitname} ${_gitname}-build && cd $_
    patch -Np1 -i ../qtscriptgenerator-git.patch


    #  Compile and run the generator
    #+ to "generate" the source and
    #+ header files for the bindings
    cd ${srcdir}/${_gitname}-build/generator
    qmake && make
    ./generator

    #  Compile the bindings
    cd ${srcdir}/${_gitname}-build/qtbindings
    qmake && make

    #  Install the qtscript bindings
    cd ${srcdir}/${_gitname}-build/plugins/script
    mkdir -p ${pkgdir}/usr/lib/qt/plugins/script
    cp -a ./* ${pkgdir}/usr/lib/qt/plugins/script

    #  Determine whether to install the documentation
    if [ "${INSTALL_DOCS}" == "true" ]; then
        mkdir -p ${pkgdir}/usr/share/doc/qtscript
        cd ${srcdir}/${_gitname}-build/doc
        cp -a ./* ${pkgdir}/usr/share/doc/qtscript
    fi

    cd ${srcdir}
    rm -rf ${_gitname}-build
}
