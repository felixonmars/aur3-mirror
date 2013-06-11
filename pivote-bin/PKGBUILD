# Maintainer: danilo <gezuru *at* gmail *dot* com>
pkgname=pivote-bin
pkgver=1.4.1.0
pkgrel=1
pkgdesc='E-voting tool of the Swiss Pirate Party (binary)'
arch=(i686 x86_64)
url='http://projects.piratenpartei.ch/projects/pi-vote'
license=('BSD')
depends=('mono')
source=("http://pivote.dbrgn.ch/PiVote_Client_Linux_x86_${pkgver}.zip")
md5sums=('77a1d9feb9472b3345645e0db6f77541')


package() {
    # Change into source dir
    cd "PiVote_Client_Linux_x86_${pkgver}"

    # Create directories
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/applications"

    # Change file permissions
    chmod -R a-x *

    # Copy files
    cp -R de-DE fr-FR *.dll *.config *.cfg *.pi-cert *.exe "${pkgdir}/usr/share/${pkgname}/"
    #install -D -m644 *.desktop "${pkgdir}/usr/share/applications/"
    install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "Third Party.txt" "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTY"

    # Create startscripts
    echo -e "#!/bin/bash\nmono /usr/share/${pkgname}/Pirate.PiVote.Client.exe" > "${pkgdir}/usr/bin/pivote-wizard"
    echo -e "#!/bin/bash\nmono /usr/share/${pkgname}/Pirate.PiVote.Circle.exe" > "${pkgdir}/usr/bin/pivote-circle"
    chmod +x "${pkgdir}/usr/bin/pivote-wizard"
    chmod +x "${pkgdir}/usr/bin/pivote-circle"
}
