# Maintainer: Guillaume Brunerie <guillaume.brunerie [at] gmail [dot] com>

pkgname=stepmania-songs
pkgver=1
pkgrel=2
pkgdesc="Songs from Plaguemix, Stepmix and Dancing WipEout"
arch=('any')
url="http://www.stepmania.com"
license=('unknown')
depends=('stepmania')
makedepends=('unzip' 'unrar')  # unrar is only needed for Dancing WipEout

## Compressing the full package take 5 minutes with gzip and 40 minutes with xz,
## so we force the package to be compressed with gzip
PKGEXT='.pkg.tar.gz'



########
###   Change this to /opt/stepmania-svn if you are using stepmania-svn
########

_extract_path=/opt/stepmania

########
###   Comment the packs you don’t want to download
########

## Plaguemix Series
_plaguemix=y     #  22 songs,  2 files,  48 Mio

## Stepmix contest
_stepmix1=y      #  97 songs, 83 files, 254 Mio
_stepmix2=y      #  93 songs, 77 files, 236 Mio
_stepmix3=y      #  89 songs, 71 files, 254 Mio
_stepmix4=y      #  82 songs,  1 file,  308 Mio
_stepmix5=y      #  68 songs, 68 files, 271 Mio

## Dancing WipEout
_dw_rebirth=y    #  55 songs,  5 files, 227 Mio
_dw_2=y          #  96 songs,  8 files, 341 Mio
_dw_3=y          # 101 songs,  7 files, 332 Mio
_dw_starlight=y  #  99 songs, 10 files, 455 Mio

########
###   Total: 802 songs, 332 files, 2726 Mio (2.66 Gio)
########



build() {
    ## Songs lists

    _plaguemix_songs=('' '')

    _stepmix1_songs=(\
     'Winners1'
     'Winners2'
     'Finalists1'
     'Finalists2'
     'Maik_CatParty'
     'AlienSpeech_HugsNDrugs'
     'DarkLuke_DarkEmperor2EndingTheme'
     'JordanBalagot_Djurdjevdan'
     'TheTerribleInfant_WonderedOffInWonderland'
     'BlueChaos_Hyperion'
     'Cloud_DublinDelight'
     'DarkLuke_Mana'
     'Subwire_Palindrome'
     'BlueChaos_VenetianSpirit'
     'DarkChao_Exotica'
     'DarkChao_KlungKung2004'
     'DarkChao_StripMine'
     'DarkChao_TheErrorSongSystemMix'
     'Arch0wl_Crowdpleaser'
     'Oasis_Messij'
     'Oasis_ColumnsBlueSquareOCRemix'
     'AustonMontville_F8'
     'Zenith_Necropolis'
     'NiDeCo_ChaozJapan'
     'JDK_Overload'
     'Kalazor_Erm'
     'Vospi_SunSonSundayOrangeMix'
     'jammitch_OnTheWave'
     'jammitch_ShineTrue'
     'jammitch_Nautilus'
     'DJOverture_NoIsTheNewYes'
     'keternal_ImpossibleFidelity'
     'KreeTsukiisa_CastlesInTheSky'
     'Zenith_AbrasiveHarmonies'
     'Something_August'
     'Will_Bubblegum'
     'JohnBonoSmithySatchmo_Platypus'
     'DJRockstar_Rebirth'
     'Digitaliz_TetrixTypeBRemix'
     'Digitaliz_Tsupseudogamush'
     'Digitaliz_SonarScurry'
     'Digitaliz_baSel'
     'Digitaliz_BlitzkriegBeats'
     'Digitaliz_StreetSweeper'
     'Nardolilli_RainbowRide'
     'CatQ_Ramua'
     'ArcticXion_AuditoryIllusion'
     'COHI_GoodTimesHardTimes'
     'ThePondermatic_ElectricHoliday'
     'MaxCerna_TakeMeBack'
     'Nardolilli_FrequencyClear'
     'Nardolilli_CloseYourEyes'
     'ChaotiX_WarpHole'
     'cpct0_GoodCopBadCop'
     'Digitaliz_AbstractAnger'
     'Digitaliz_RaveOnTheBayOfBengal'
     'Digitaliz_TheObeseLegendofJacob'
     'Digitaliz_ThoughtsOfRed'
     'Kalazor_AgainstTheRest'
     'Digitaliz_MrBeauregardsBounce'
     'Digitaliz_RomeNeedsNoMother'
     'DrDessart_VIP'
     'DarkChao_GoinHome'
     'DarkChaoPags_Duality'
     'MagnaTrick_MindReflection'
     'Shortysnmn2010_TurnAway'
     'cryptex2o6_Valencia'
     'Alezay_Summer'
     'DarkChao_Legacy'
     'DrDessart_MyNameIsJankenpopp'
     'DarkChao_Who'
     'DarkChao_TakeMeBack'
     'DarkChao_Indulgence'
     'Utopia_Who'
     'DjQuetzal_CsikosPostDoubleDrumMix'
     'DMAshura_omega'
     'DMAshura_DiSCONNECTED_HaZaRD'
     'DMAshura_MAX_Forever'
     'DMAshura_MaxX_AttaxX'
     'DMAshura_neoMAX'
     'Nebyoolae_SnakeShake'
     'Nebyoolae_ForNotTrying'
     'DarkLuke_ISawedTheDemons'
     )

    _stepmix2_songs=(\
     'Winners1'
     'Winners2'
     'Finalists1'
     'Finalists2'
     'Finalists3'
     'W1p3out_Fantranstic'
     'dillchip_Esperanza'
     'Hamm_Horizon2'
     'KitaKeru_MaxFullCircle'
     'xjen0vax_TakeMeBack'
     'tibyandy_MidnightOfTheNorth'
     'Raf_FirstDay'
     'Darklink_HorizonSpeedyMix'
     'banzaigtv2_DisconnectedTrance'
     'Marth_AsLongAsYouAreByMySide'
     'dt_HyperHyper'
     'IcePagoda_SpaghettiWestern'
     'Pags_Duality'
     'KitaKeru_FascinationNightskyMix2'
     'redrico_Cosmos'
     'Vospi_GoldenCosmonaut'
     'Pallero_GetReadyToDance'
     'ZetaAspect_DisturbedRelationship'
     'zeh_Pulsaris'
     'ZetaAspect_WhereinWeLie'
     'ZetaAspect_Starfield'
     'BeZeRkEr_ThroughTheGates'
     'ZetaAspect_LiquidSpheres'
     'Vospi_Serotonin'
     'marxinith_DoneWith'
     'MCXD_ClassicalInsanity'
     'Oni91_AcidRush'
     'Amras_ImNotCool'
     'ChaotiX_SMACK'
     'eaglefan101_SkAvenger'
     'think13_Knuckle'
     'CreamyGoodness_Hyperchase'
     'eaglefan101_TooMuchTime'
     'Venomocean_IMadeYouReal'
     'Darklink_Supremacy'
     'TestbugZer0_MaxXAttaxX'
     'PLatTIpuSS_Korobeiniki'
     'b1u3sh4rk_DrEaM'
     'dt_DanceAllNight'
     'ThePondermatic_TheyreHere'
     'PePeRz_DanceFactoryMegamix'
     'venomocean_ExpertActive'
     'CMG_FascinationMaxXK2'
     'Amras_Horizon'
     'MCDX_AcidSunset'
     'CreamyGoodness_Westin'
     'DF8_Exotica'
     'Hamm_SpeedyVocal'
     'Taren_DisconnectedSanxion7Remix'
     'itgfreak925_ColorOfGiggles'
     'BlueChaos_Convergence'
     'rifall_GannonTechno600'
     'pksage_WhatIsThisEarthLove'
     'Foti_ThemeFromJetsNGuns'
     'Foti_MegaScorcher'
     'Foti_KoalaInTheSpidersWeb'
     'KitaKeru_502Raver'
     'Chicky_VitalUnity'
     'ITGFreak911_FascinationNightSkyMix'
     'eaglefan101_FluidData'
     'BelialSunSet_Go'
     'Pags_EuphoriaLong'
     'patrickphan2_Alternation'
     'rifall_MegaSonic'
     'Hamm_Level1'
     'BelialSunSet_ToilingBelow'
     'Roasty_BossMachine'
     'BelialSunSet_AnalogSystem'
     'DF8_TasteOfStatic'
     'BelialSunSet_IfSpeedcoreWasADrug'
     'DF8_Fanaticism'
     'BlueChaos_NightGliding'
    )

    _stepmix3_songs=(\
     'Winners1'
     'Winners2'
     'Finalists1'
     'Finalists2'
     'Finalists3'
     'banzaigtv_NeoTheOne'
     'FlyingCats_TripMachineResuscitationMix'
     'JosiahTobin_ConflagrationHazard'
     'Oni91_FinalAuditionOmegaMix'
     'kabot_RoarRageMix'
     'banzaigtv_Z'
     'kabot_VenetianSpirit'
     'MIDI_SayItRightSanxion7Remix'
     'Lisek_HalfSymphony'
     'Lisek_HyperHyper'
     'Lisek_Summer'
     'kabot_ParadoxDisarrayMix'
     'banzaigtv_TakeMeAwayToParadise'
     'TStodden_ObeyTheModerator'
     'Nistocolm_ContraFeedingFrenzy2'
     'Nistocolm_CrystalisHouseLeaves'
     'Nistocolm_ThemeFromMetroidElecguitar'
     'W1p3out_PlanetKuea'
     'Marth_SnowblindShortMix'
     'StealingVision_Velocity'
     'Nistocolm_Delirium'
     'Nistocolm_BrinstarMetal'
     'Chicky_Power'
     'AlKeupone_BravingTalTalHeights'
     'rifall_MegasonicFlash'
     'rifall_MegasonicVertexTributeToZigzag'
     'Mantis_Glitctchmachiin'
     'FlyingCats_TsurespectgamushForStepmix3'
     'x0000_SicilianDefence'
     'derangedKitten_Skavenger'
     'CreamyGoodness_EmulatedNinjaGaiden'
     'Snap_Summer'
     'Snap_MonolithRenaissanceMix'
     'dt_ExtremeDishwasherRace'
     'DF8_TechLo'
     'banzaigtv_Heey'
     'DF8_DownloadtheFutureStepmaniaExclusive'
     'ProfessorRaine_HydrocityZoneAct1SonicTheHedgehog32'
     'Dilbertguy_Crash'
     'darkmage_NoSuchThingasthePromisedLand'
     'dt_Mavulosa'
     'Grim5768_MarbleZoneMVLEdit'
     'DF8_DoYouLike'
     'rifall_MegaSonicOverHeat'
     'KitaKeru_TheVisionary'
     'CMG_AndLikeUmYea'
     'eaglefan101_Euphorium'
     'ThePondermatic_VitalUnity2007Remake'
     'DeepEmbrace_StarStormStepmix'
     'eaglefan101_Snowfall'
     'Arcsynth_SnowfallFinalMix'
     'eaglefan101_ThreeRingNightfall'
     'jmgregory_BeethovensDelightClub303'
     'DF8_SailAway'
     'banzaigtv_Onyx'
     'Amras_Viva'
     'DeepEmbrace_Solaire'
     'Chicky_OttersDanceHotrootMix'
     'dt_EnjoyYourLife'
     'DF8_SugarSweet'
     'eaglefan101_GenomScreamsVirusMix'
     'CreamyGoodness_PoolsOfRustCastlevania3'
     'Oni91_DeadBatteries'
     'BeZeRkEr_DanceMixGr'
     'jacc_IAmTrying'
     'dt_Fantasia'
    )

    _stepmix4_songs=('')  # There is a pack containing all the StepMix4 songs

    _stepmix5_songs=(\
     'KVDOX_3'
     'vilzu_ForsakenNeon'
     'CMGUTOPIA_DigitalDisaster'
     'CMGUTOPIA_DoomsdayComputer'
     'CMGUTOPIA_NewSunsetMellowMoonlightMix'
     'CMGUTOPIA_TombstoneTerror'
     'Squeakyleak_Cyst'
     'Squeakyleak_Mute'
     'KVDOX_Strangeremixx'
     'KVDOX_TsumegamusH'
     'Naruichigarra_DrumAcerbity'
     'musicbeatz_ParadiseOnEFinal'
     'KVDOX_ZyWyXZ'
     'rifall_MySong'
     'rifall_RandomCanonBlow'
     'CondorTalon_BloodLullaby'
     'raigon_PsycheMetalLevel1GameproducedbyDarkWorldCompany'
     'MrRoob_HyperHyperDefinitiveversion'
     'FrankMunoz_ToothBrush'
     '3R2_CandyStorm'
     'rifall_MegaSonicSmile'
     'ArkBlitz_TheBottomStepMixcut'
     'KVDOX_Ra'
     '3R2_Rainbowintheskies'
     'Chaozplayerp_Haven'
     'ddrtime_NXN'
     'MrRoob_BloodSteal2'
     'pinnipedseal_Horizon2009Remaster'
     'fmelm_ParanoiaDarknessJungleIrregalaritesVolatge'
     'Nistocolm_FreshFest'
     'FiveSecondFinnian_195'
     'StepmaniaFreak_ChaozFantasy2'
     'boct1584_DawnPerpetualMix'
     'FiveSecondFinnian_RedGaia'
     'StepmaniaFreak_Z'
     'ShaydeZehetbauer_TropicalStepMix5Entry'
     'CondorTalon_ChaozAirflow'
     'FrankMunoz_Da'
     'fmelm_SleepingMemories'
     'WikiLeon_IGottaFeelingThattonightisgoingtobeaprofilepic2'
     'Butterfly_SomebodyToLoveforStepMix5'
     'FiveSecondFinnian_EscapeVelocity'
     'FiveSecondFinnian_Passing10s'
     'fmelm_FascinationMAXXPureAAMix'
     'FrankMunoz_LoveFilter2'
     'germanium_NoDoubt'
     'FiveSecondFinnian_FinnianBlurII'
     'IkeGawain_ZeroDanceTheScienceUniversityofTokyoYOSAKOIsawrun'
     'Chicky_Infiltration'
     'RAVD_NightOfPassion'
     'Zzront_PlasticFlashingLights'
     'Zzront_CortezPizarro'
     'dt_PirateDance'
     'CondorTalon_RoyallyScrewed'
     'CondorTalon_Valiant'
     'Zzront_SurfsUp'
     'MrRoob_DawnMoonMix'
     'PSYPODIAS_DigitalAbuse'
     'fmelm_PARANOiADreams'
     'StepmaniaFreak_ParadiseonE'
     'Lisek_DEKA'
     'Lisek_FreezingFlames'
     'Zzront_LadyClorofile'
     'Lisek_Isengard'
     'CondorTalon_No5'
     'dt_Dreamcatcher'
     'ddrtime_TsustrayamusH'
     'Seamine_VirtualEmotion'
    )

    _dw_rebirth_songs=('1' '2' '3' '4' '5')

    _dw_2_songs=('1' '2' '3' '4' '5' '6' '7' '8')

    _dw_3_songs=('1' '2' '3' '4' '5' '6' '7')

    _dw_starlight_songs=('01' '02' '03' '04' '05' '06' '07' '08' '09' '10')


    _pack_list=('plaguemix' 'stepmix1' 'stepmix2' 'stepmix3' 'stepmix4'
        'stepmix5' 'dw_rebirth' 'dw_2' 'dw_3' 'dw_starlight')


    ## Functions

    _instdir=$pkgdir$_extract_path
    _count=0
    _total=0
    for pack in ${_pack_list[*]}
    do
        eval "if [ \$_$pack ]; then (( _total += \${#_${pack}_songs[*]} )); fi"
    done

    # Download the file $2 on the server $1 and unzip it if [ $3 ]
    _download()
    {
        (( _count++ )) || :   # The return code must be zero

        echo
        echo -e "\e[1;33mDownloading $2 (file $_count/$_total)\e[0m"
        echo

        wget -c "$1$2"
        if [ $3 ]; then unzip -o $2 -x smzip.ctl -d $_instdir; fi
    }

    _download_plaguemix()
    {
        _download "http://www.gamecast.org/plaguemix/files/" \
            "plaguemix-complete.smzip" y
        _download "http://www.stepmaniam3.com/sm/data/files/" \
            "Songs_DJMcFox_PlagueMixAntique.smzip" y
        
        # This name cannot be handled by bsdtar
        mv $_instdir/Songs/Plaguemix\ Series/Bitches\ \(*-ZIQ\ Remix\) \
           $_instdir/Songs/Plaguemix\ Series/Bitches\ \(u-ZIQ\ Remix\)
    }

    # Download StepMix$1, the list of songs being in $2
    _download_stepmix()
    {
        for i in $2
        do
            _download "http://stepmaniam3.com/sm/data/files/" \
                "Songs_StepMix$1_$i.smzip" y
        done
    }

    _download_stepmix1()
    {
        _download_stepmix 1 "$1"

        mkdir "$_instdir/Songs/StepMix 1"
        mv $_instdir/Songs/StepMix\ 1*/* "$_instdir/Songs/StepMix 1"
        rm -r "$_instdir/Songs/StepMix 1.0" \
              "$_instdir/Songs/StepMix 1 Winners" \
              "$_instdir/Songs/StepMix 1 Finalists"
    }

    _download_stepmix2()
    {
        _download_stepmix 2 "$1"

        mv $_instdir/Songs/StepMix\ 2\ */* "$_instdir/Songs/StepMix 2"
        rm -r "$_instdir/Songs/StepMix 2 Winners" \
              "$_instdir/Songs/StepMix 2 Finalists"
    }

    _download_stepmix3()
    {
        _download_stepmix 3 "$1"

        mv $_instdir/Songs/StepMix\ 3\ */* "$_instdir/Songs/StepMix 3"
        rm -r "$_instdir/Songs/StepMix 3 Winners" \
              "$_instdir/Songs/StepMix 3 Finalists"
    }

    _download_stepmix4()
    {
        _download "http://stepmaniam3.com/sm/data/files/" \
            "Songs_StepMix4.smzip" y
    }

    _download_stepmix5()
    {
        _download_stepmix 5 "$1"
    }

    _download_dw_rebirth()
    {
        for i in $1
        do
            _download "http://ddrmulhouse.free.fr/W1p3out_simfiles/Dancing%20WipEout%20Rebirth/Release/" \
                "Dancing_WipEout_Rebirth.part$i.rar"
        done
        unrar x -y Dancing_WipEout_Rebirth.part1.rar
        unzip -o Dancing_WipEout_Rebirth.smzip -x smzip.ctl -d $_instdir
    }

    _download_dw_2()
    {
        for i in $1
        do
            _download "http://ddrmulhouse.free.fr/W1p3out_simfiles/Dancing%20WipEout%202/DirectDL/" \
                "Dancing_WipEout_2.part$i.rar"
        done
        unrar x -y Dancing_WipEout_2.part1.rar
        unzip -o Dancing_WipEout_2.smzip -x smzip.ctl -d $_instdir
    }

    _download_dw_3()
    {
        for i in $1
        do
            _download "http://ddrmulhouse.free.fr/W1p3out_simfiles/Dancing%20WipEout%203/Final%20Release/" \
                "Dancing_WipEout_3.part$i.rar"
        done
        unrar x -y Dancing_WipEout_3.part1.rar
        unzip -o Dancing_WipEout_3.smzip -x smzip.ctl -d $_instdir
    }

    _download_dw_starlight()
    {
        for i in $1
        do
            _download "http://ddrmulhouse.free.fr/W1p3out_simfiles/Dancing%20WipEout%20Starlight/Full%20Version/" \
                "Dancing_WipEout_Starlight.part$i.rar"
        done
        unrar x -y Dancing_WipEout_Starlight.part01.rar
        unzip -o Dancing_WipEout_Starlight.smzip -x smzip.ctl -d $_instdir
    }


    ## Actual downloading of songs

    install -d $_instdir
    cd $srcdir

    for pack in ${_pack_list[*]}
    do
        eval "if [ \$_$pack ]; then _download_$pack \"\${_${pack}_songs[*]}\"; fi"
    done
}
