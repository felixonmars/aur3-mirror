# Maintainer: Artem A. Klevtsov unikum.pm@gmail.com
# Contributor: Vladislav Glinsky <cl0ne[at]mithril.org.ua>

pkgname=kdeicons-reflektions-kde4
_pkgname=Reflektions_KDE4
pkgver=1.57
pkgrel=1
pkgdesc='This is a version of the KDE4 port of the "Reflektions" icons.'
arch=('any')
url="http://kde-look.org/content/show.php/Reflektions_KDE4?content=110944"
license=('CCPL')
makedepends=('imagemagick')
source=("${pkgname}-${pkgver}.rar::http://fc08.deviantart.net/fs70/f/2014/130/4/7/reflektions_kde4_v1_57_by_linuxfever-d287xmx.rar")
sha256sums=('cb52f5dff3f66cf9b78660251abfe355ac698dfb3575f112834e3d65230d613c')

SIZES="8x8 16x16 22x22 32x32 48x48 64x64"
DIRS="actions apps categories devices emblems emotes mimetypes places status"

prepare()
{
    find "${srcdir}/${_pkgname}" -name '.directory' -delete
}

build()
{
    cd ${srcdir}/${_pkgname}

    # create the dirs
    msg2 "Create directories..."
    for size in ${SIZES}; do
        for dir in ${DIRS}; do
            mkdir -pm 755 "${size}/${dir}"
        done
    done

    msg2 "Convert icons..."
    for dir in ${DIRS}; do
        cd ${srcdir}/${_pkgname}/128x128_or/${dir}
        for icon in *; do
            for size in ${SIZES}; do
                convert "${icon}" -resize ${size} ../../"${size}/${dir}/${icon}"
            done
        done
    done
}

package() {
    cd ${srcdir}/${_pkgname}
    TARGETDIR="${pkgdir}/usr/share/icons/${_pkgname}"
    install -dm 755 "$TARGETDIR"
    install -Dm 644 index.theme "$TARGETDIR"

    cp -r 128x128_or "${TARGETDIR}"/128x128

    for size in ${SIZES}; do
        cp -rt "${TARGETDIR}" ${size}
        cp -rt "${TARGETDIR}/${size}" ${size}_or/*
    done

    # wtf? ok, original install script does it.
    cp -r 24x24_or/* ${pkgdir}/usr/share/icons/${_pkgname}/22x22

    ## Install color-scheme. used by anyone?
    if [[ ${colors} = y ]]; then
        install -Dm 644 Theme/Reflektions.colors ${pkgdir}/usr/share/apps/color-schemes/Reflektions_KDE4.colors
    fi

    find ${pkgdir} -type d -exec chmod 755 {} \;
    find ${pkgdir} -type f -exec chmod 644 {} \;
}
