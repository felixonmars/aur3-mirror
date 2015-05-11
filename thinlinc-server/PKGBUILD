# Maintainer: adytzu2007 <adybac "at" gmail {dot} com>

pkgname=thinlinc-server
pkgver=4.3.0
pkgrel=1
pkgdesc="Cendio ThinLinc Linux Remote Desktop Server"
arch=('i686' 'x86_64')
url="http://www.cendio.com/"
license=('custom')
install=${pkgname}.install

depends=('python2' 'net-tools' 'procps-ng' 'xorg-xauth' 'pcsclite'
         'java-environment')

# to get download link, register here
# http://www.cendio.com/downloads/server/register.py
_archive_name=tl-${pkgver}-server

source=("${_archive_name}.zip"
        'tlwebaccess.service'
        'tlwebadm.service'
        'vsmagent.service'
        'vsmserver.service'
        'service.patch')
sha256sums=('97e6a0639944b249f3c803db8a9f31ac8adcb601d51c291fd5ed2b1ddf6b86ab'
            '430bcbc959ab363a270fd830c9db8caa057dfbfde69beb6193958c282bd03f7d'
            'cbbf364b9303ff55a7fef434bddab7533f95b8228f045e232fd1c83b78a9a842'
            'b64dcb2ecfb38120a3314b14c114fbf79ecdf699984db7addadd3aec644165da'
            '3e0fdaeca38f4750c9b369a65b7b3c84dff996e9997dbb02dbfe16dc78a09849'
            '635a76ce5f501608ac77b3a396faee57c4bfba82ade2d38d37e657d147a745fd')

_extract_dir="extract"

build()
{
    cd "${srcdir}/${_archive_name}"

    cd serverkit-linux
    mkdir -p "${_extract_dir}"

    for rpm in *${CARCH}*rpm *noarch*rpm; do
        bsdtar -C "${_extract_dir}" -xf "${rpm}"
    done

    cd "${_extract_dir}"

    # Patch thinlinc-server to allow installing on a system with systemd
    cd "opt/thinlinc/libexec"
    patch -p1 < ${srcdir}/service.patch

    cd "${srcdir}/${_archive_name}/serverkit-linux/${_extract_dir}"

    mkdir -p "usr"
    [[ "$CARCH" == "x86_64" ]] && mv "lib64" "usr/lib"

    rm -Rf "etc/init.d"
}

package()
{
    cd "${srcdir}/${_archive_name}/serverkit-linux/${_extract_dir}"

    cp -aR * "${pkgdir}"

    install -D -m0644 ${srcdir}/tlwebaccess.service ${pkgdir}/usr/lib/systemd/system/tlwebaccess.service
    install -D -m0644 ${srcdir}/tlwebadm.service ${pkgdir}/usr/lib/systemd/system/tlwebadm.service
    install -D -m0644 ${srcdir}/vsmagent.service ${pkgdir}/usr/lib/systemd/system/vsmagent.service
    install -D -m0644 ${srcdir}/vsmserver.service ${pkgdir}/usr/lib/systemd/system/vsmserver.service
}
