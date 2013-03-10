pkgname=nwn-platinum-4cd
pkgver=1.69
pkgrel=3
pkgdesc="Neverwinter Nights is an RPG from Bioware. This requires the 4CD Platinum Release."
url="http://www.bioware.com/games/legacy"
license=('custom')
groups=('games')
arch=('i686' 'x86_64')
if [ "$CARCH" = "x86_64" ]; then
    depends=(
        'binkplayer'
        'elfutils'
        'lib32-elfutils'
        'lib32-libgl'
        'lib32-libstdc++5'
        'lib32-libxcursor'
        'lib32-libxdamage'
        'lib32-mesa'
        'perl'
        'lib32-sdl_mixer'
    )

    optdepends=(
        'lib32-alsa-lib: audio support for 32 bit programs'
        'lib32-libpulse: if you use pulse audio in 64 bit'
    )
else
    depends=(
        'binkplayer'
        'elfutils'
        'libgl'
        'libstdc++5'
        'libxcursor'
        'mesa'
        'perl'
        'sdl_mixer'
    )

    optdepends=(
        'alsa-lib: audio support'
        'libpulse: pulse audio support'
    )
fi
makedepends=('unzip' 'perl')
provides=('nwn')
conflicts=('nwn')
install=nwn.install
changelog=nwn.changelog

# This package is very large and doesn't compress well.  Just use tar.
PKGEXT='.pkg.tar'

source=(
    'http://nwdownloads.bioware.com/neverwinternights/linux/gold/nwclientgold.tar.gz'
    'http://nwdownloads.bioware.com/neverwinternights/linux/161/nwclienthotu.tar.gz'
    'http://files.bioware.com/neverwinternights/updates/linux/169/English_linuxclient169_xp2.tar.gz'
    'http://home.roadrunner.com/~nwmovies/nwlinux-beta.tar.bz2'
    'http://home.roadrunner.com/~nwmovies/cursors.tar.gz'
    'http://home.roadrunner.com/~nwmovies/nwmovies/nwmovies-latest.tar.gz'
    'nwn.launcher' 'nwn.desktop' 'nwlogger.patch' 'nwmouse.patch'
    'Data_Linux.zip'
    'Data_Shared.zip'
    'disk2.zip'
    'disk3.zip'
    'disk4.zip'
    'EULA.txt'
    'language_data.zip'
    'Language_data.zip'
    'Language_update.zip'
    'nwn.ico'
    'xp1_data.zip'
    'xp1.zip'
)

noextract=(
    'nwclientgold.tar.gz'
    'nwclienthotu.tar.gz'
    'English_linuxclient169_xp2.tar.gz'
    'cursors.tar.gz'
    'nwmovies-latest.tar.gz'
    'Data_Linux.zip'
    'Data_Shared.zip'
    'disk2.zip'
    'disk3.zip'
    'disk4.zip'
    'language_data.zip'
    'Language_data.zip'
    'Language_update.zip'
    'xp1_data.zip'
    'xp1.zip'
)

md5sums=(
    '0a059d55225fc32f905e86191d88a11f'
    '376cdece07106ea058d42b531f3146bb'
    'b021f0da3b3e00848521926716fdf487'
    '3961f7464d3d5b7ac9f097aa9aa2f4d3'
    '7be935418f0ececb5660f53b7a902b38'
    '1698a83bce2050174670e30c42b9d673'
    '7fd0497f55856edf50480b5acd3136d3'
    'bd7f80f5faa5ee1203371b4e8ec40638'
    'cb5bd625f2939eb8e359d4d81425ca7d'
    '421e64ffc5788734b2c4c63354c68351'
    'fdbbb7bbcadb6ae78fd611f8b13deb49'
    '25bcd365fe9d1394dd427576aa99d797'
    '5e4c3ca58b9a2ffbce07c2e5ca0b0954'
    '62403c4c6136acdb5f23d59a1ce84e11'
    '636ba23ab82fb65d4401dce8334f70b7'
    'f814b278244cb9d07b8986c5f3eb247a'
    'a07dbabd26800cad7aad0e46cf5a802b'
    '826ab2436005430938d130b11c56d5bd'
    '6de5ad752e1c5800da0f270d7d14d4e7'
    '40ff54a04c0f454f62765f0dd2448138'
    'c93f0a065dabac48c66129971b0e8591'
    '3879d54aeb36dd0fdcbb783fbf446907'
)

prepare() {
    ###########################################################################
    # Fix beta nwmovies that comes with nwlinux-beta.tar.bz2 to nwmovies-latest
    ###########################################################################
    cd "${srcdir}"/

    # Remove nwmovies which ships with the beta code; Replace with latest
    rm -rf nwmovies
    tar --overwrite -zxvf "${srcdir}"/nwmovies-latest.tar.gz -C "${srcdir}"/

    # Patch nwlogger
    patch -Np0 -i "${srcdir}"/nwlogger.patch -d "${srcdir}"/nwlogger

    # Patch nwmouse
    patch -Np0 -i "${srcdir}"/nwmouse.patch -d "${srcdir}"/nwmouse
}

build() {
    prepare

    cd "${srcdir}"/

    ########################################################################
    # nwmovies: Movies in Linux Client Support for NWN
    ########################################################################
    # Compile nwmovies using the appropriate SDL library
    if [ "$CARCH" = "x86_64" ]; then
        ./nwmovies_install.pl /usr/lib32/libSDL-1.2.so.0
    else
        ./nwmovies_install.pl /usr/lib/libSDL-1.2.so.0
    fi

    ########################################################################
    # nwuser: Per-User Settings Support for NWN
    ########################################################################
    ./nwuser_install.pl

    ########################################################################
    # nwmouse: Hardware Mouse Cursors Support for NWN
    ########################################################################
    ./nwmouse_install.pl

    ########################################################################
    # nwlogger: Client-Side Chat Window Logging Support for NWN
    ########################################################################
    ./nwlogger_install.pl
}

package()
{
    # NWN Platinum CD-Keys (Neverwinter Nights, Shadows of Undrentide,
    # and Hordes of the Underdark)
    local _key_nwn=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
    local _key_sou=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx
    local _key_hou=xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx-xxxxx

    # Create Destination Directory
    install -d "${pkgdir}"/opt/nwn

    ########################################################################
    # Extract CD data.  Follow extract steps for the Platinum 4CD from:
    #   http://home.roadrunner.com/~nwmovies/nwtoolset-43.html
    #
    # Use copy_cd_contents.sh to get the files.
    ########################################################################

    # Extract Data Files from CD Number 2 first
    unzip "${srcdir}"/disk2.zip -d "${pkgdir}"/opt/nwn/

    # Extract Data Files from CD Number 3 next
    unzip -o "${srcdir}"/disk3.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/language_data.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/Data_Linux.zip -d "${pkgdir}"/opt/nwn/

    # Extract Data Files from CD Number 4 next
    unzip -o "${srcdir}"/disk4.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/xp1.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/xp1_data.zip -d "${pkgdir}"/opt/nwn/

    # Extract Data Files from CD Number 1 last
    unzip -o "${srcdir}"/Language_data.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/Data_Shared.zip -d "${pkgdir}"/opt/nwn/
    unzip -o "${srcdir}"/Language_update.zip -d "${pkgdir}"/opt/nwn/

    # Install Custom License
    install -D -m 644 "${srcdir}"/EULA.txt \
        "${pkgdir}"/usr/share/licenses/$pkgname/EULA.txt

    # Install Icon File
    install -D -m 644 "${srcdir}"/nwn.ico \
        "${pkgdir}"/usr/share/pixmaps/nwn.ico

    ########################################################################
    # Done with CD data
    ########################################################################

    ########################################################################
    # Patch to 1.68 (1.61 hotu)
    ########################################################################
    # Extract 1.68 for original and expansion "Shadows of the Undrentide".
    tar -zxvf "${srcdir}"/nwclientgold.tar.gz -C "${pkgdir}"/opt/nwn/

    # Extract 1.61 for original and expansion "Hords of the Underdark".
    tar -zxvf "${srcdir}"/nwclienthotu.tar.gz -C "${pkgdir}"/opt/nwn/

    # Run fixinstall
    cd "${pkgdir}"/opt/nwn/
    ./fixinstall

    ########################################################################
    # Patch to 1.69 (depends on 1.68 / hotu 1.61)
    ########################################################################
    # Extract Latest Patch.  It overwrites nwmain and nwserver with
    # newer versions and must be done after 1.68 / hotu 1.61.
    tar -zxvf "${srcdir}"/English_linuxclient169_xp2.tar.gz \
        -C "${pkgdir}"/opt/nwn

    # Remove Unneeded Files & Directories
    rm -r "${pkgdir}"/opt/nwn/SDL-1.2.5/

    # Install CD Key File
    cat << EOF > "${pkgdir}"/opt/nwn/nwncdkey.ini
;These are your CD Keys for Neverwinter Nights.
;DO NOT share these CD Keys with ANYONE.
;Apart from this installation, or when registering with the Official Neverwinter Nights Community Site [http://nwn.bioware.com], BioWare and Infogrames will NEVER ask you for this CD Key.

[CDKEY]
Key3=$_key_hou
Key2=$_key_sou
Key1=$_key_nwn
EOF

    # Install nwmovies binaries
    install -D -m 755 -t "${pkgdir}"/opt/nwn/ \
        "${srcdir}"/nwmovies/{nwmovies.so,nwmovies.pl}

    # Install binkplayer binaries
    install -D -m 755 "${srcdir}"/nwmovies/binklib.so \
        "${pkgdir}"/opt/nwn/nwmovies/binklib.so

    # Install nwmoview libdis binaries
    install -D -m 755 "${srcdir}"/nwmovies/libdis/libdisasm.so \
        "${pkgdir}"/opt/nwn/nwmovies/libdis/libdisasm.so

    # SymLink BinkPlayer to the NWN Directory so the Movie Launcher
    # (nwmovies.pl) can find it
    ln -s /usr/bin/binkplayer "${pkgdir}"/opt/nwn/BinkPlayer

    # Install nwuser binaries
    install -D -m 755 "${srcdir}"/nwuser/nwuser.so \
        "${pkgdir}"/opt/nwn/nwuser.so

    # Install 64bit binaries if Arch64
    if [ "$CARCH" = "x86_64" ]; then
        install -D -m 755 "${srcdir}"/nwuser/nwuser64.so \
            "${pkgdir}"/opt/nwn/nwuser64.so
    fi

    # Install nwmouse binaries
    install -D -m 755 "${srcdir}"/nwmouse/nwmouse.so \
        "${pkgdir}"/opt/nwn/nwmouse.so

    # Install nwmouse libdis binaries
    install -D -m 755 "${srcdir}"/nwmouse/libdis/libdisasm.so \
        "${pkgdir}"/opt/nwn/nwmouse/libdis/libdisasm.so

    # Install nwlogger binaries
    install -D -m 755 "${srcdir}"/nwlogger/nwlogger.so \
        "${pkgdir}"/opt/nwn/nwlogger.so

    # Install nwlogger libdis binaries
    install -D -m 755 "${srcdir}"/nwlogger/libdis/libdisasm.so \
        "${pkgdir}"/opt/nwn/nwlogger/libdis/libdisasm.so

    # Install Cursors
    install -d "${pkgdir}"/opt/nwn/nwmouse/cursors/
    tar -zxf "${srcdir}"/cursors.tar.gz -C "${pkgdir}"/opt/nwn/nwmouse/cursors/

    # Install Launcher (Client)
    install -D -m 755 "${srcdir}"/nwn.launcher \
        "${pkgdir}"/usr/bin/nwn

    # Install Desktop File
    install -D -m 644 "${srcdir}"/nwn.desktop \
        "${pkgdir}"/usr/share/applications/nwn.desktop

    # Fix Whacky Permissions
    chown -R root:root "${pkgdir}"/
    chmod -R go=rX "${pkgdir}"/
}
