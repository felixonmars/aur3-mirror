# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=('ekstertera')
pkgver=0.0.6
pkgrel=1
pkgdesc=("GUI client for Yandex.Disk")
arch=('i686' 'x86_64')
url="https://github.com/abbat/${pkgname}"
license=('BSD')
makedepends=('qt5-base' 'qt5-tools' 'git')
source=("git+https://github.com/abbat/${pkgname}.git")
sha256sums=('SKIP')

export QT_SELECT=5

build() {
    project_file="${pkgname}.pro"

    cd ${srcdir}/${pkgname}

    QT_OPTS="network"
    if [ "${QT_SELECT}" -eq "4" ]; then
        QT_OPTS="${QT_OPTS}"
    else
        QT_OPTS="${QT_OPTS} core widgets"
    fi

    qmake -project -recursive -Wall -nopwd -o "${project_file}" \
        "CODEC = UTF-8" \
        "CODECFORTR = UTF-8" \
        "CONFIG += release" \
        "QT += ${QT_OPTS}" \
        "INCLUDEPATH += src" \
        "TRANSLATIONS += src/translations/ekstertera_en.ts" \
        src

    lrelease -compress -removeidentical "${project_file}"
    qmake "${project_file}"
    make

    mv "${pkgname}" "${pkgname}-qt${QT_SELECT}"
}

package() {
    if [ "${QT_SELECT}" -eq "4" ]; then
        depends=('qt4')
    else
        depends=('qt5-base')
    fi

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/applications"

    install -D -m755 "${srcdir}/${pkgname}/${pkgname}-qt${QT_SELECT}" "${pkgdir}/usr/bin/${pkgname}-qt${QT_SELECT}"
    install -D -m644 "${srcdir}/${pkgname}/${pkgname}.desktop"        "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/${pkgname}/src/icons/${pkgname}.xpm"  "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
    install -D -m644 "${srcdir}/${pkgname}/README.md"                 "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 "${srcdir}/${pkgname}/debian/copyright"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/bin/${pkgname}-qt${QT_SELECT}" "${pkgdir}/usr/bin/${pkgname}"
}
