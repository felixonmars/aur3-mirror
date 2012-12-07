# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=dolphin-libreoffice-templates
pkgver=1.0
pkgrel=1
pkgdesc="Create LibreOffice documents from Dolphin contextual menu"
arch=('any')
url="http://www.libreoffice.org"
license=('custom')
depends=('kdebase-dolphin')

source=('Database.odb'
        'Drawing.odg'
        'Formula.odf'
        'Impress.odp'
        'LibreOffice_Database.desktop'
        'LibreOffice_Drawing.desktop'
        'LibreOffice_Formula.desktop'
        'LibreOffice_Impress.desktop'
        'LibreOffice_Spreadsheet.desktop'
        'LibreOffice_Text.desktop'
        'Spreadsheet.ods'
        'Text.odt'
        )
md5sums=('2f96777906d11442f54e7e79c308bf72'
         '4eb6ad49ebc8e3d80b2d094f9b3184e5'
         'a1a6a6de76d520fa335925f1ad07ef4e'
         '11e5feaa2737166c4fbd70650283ab35'
         '77f371331fdf112b24d18176abb927c1'
         'f29aa59ac2101f9c5783e0e4d5c2e031'
         '43db7bd2e63a125e2706d9e898b58352'
         '6a07308fc557f80ac3521a8040158c32'
         '2072fef7abe965cf09234c8e8fb4c196'
         '5fbd8518b9e5a07fd6b34e0784dd69a1'
         '17c2a2fa4e5f84b6d257952d955f8058'
         'f6d838010f8599dad81494af4e8bd65b')

package() {
    mkdir -p $pkgdir/usr/share/templates/.source
    install -m644 *.od* $pkgdir/usr/share/templates/.source
    install -m644 *desktop $pkgdir/usr/share/templates
}

